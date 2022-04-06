package com.samsoum.newro.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.samsoum.newro.binding.front.dto.UserDto;
import com.samsoum.newro.binding.front.mapper.UserFrontMapper;
import com.samsoum.newro.binding.persistence.dto.UserEntity;
import com.samsoum.newro.binding.persistence.mapper.UserPersistenceMapper;
import com.samsoum.newro.model.User;
import com.samsoum.newro.persistence.repositories.jpa.UserRepository;

@Service
public class UserService implements UserDetailsService {
	
    private UserRepository userRepository;
        
    private UserPersistenceMapper persistenceMapper;
    
    private UserFrontMapper frontMapper;
    
    @Autowired
    private UserService(UserRepository userRepository, UserPersistenceMapper persistenceMapper, UserFrontMapper frontMapper) {
    	this.userRepository = userRepository;
    	this.persistenceMapper = persistenceMapper;
    	this.frontMapper = frontMapper;
    }
    
    public UserDetails loadUserByUsername(String identifiant) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findByUsername(identifiant).get();
        if (userEntity == null) {
            throw new UsernameNotFoundException("No user found with username: " + identifiant);
        }

        List<String> roles = userEntity.getRoles().stream().map(role -> role.getRole()).collect(Collectors.toList());
        
        return new org.springframework.security.core.userdetails.User(
        		userEntity.getUsername(), userEntity.getPassword(), getAuthorities(roles));
    }
    
    private static List<GrantedAuthority> getAuthorities (List<String> roles) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }
    
    public void register(UserDto userDto) {
    	User user = frontMapper.toModel(userDto);
    	UserEntity userEntity = persistenceMapper.toEntity(user);
    	userRepository.save(userEntity);
    }
}
