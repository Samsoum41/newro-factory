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

import com.samsoum.newro.binding.persistence.dto.UserEntity;
import com.samsoum.newro.binding.persistence.mapper.UserPersistenceMapper;
import com.samsoum.newro.model.User;
import com.samsoum.newro.persistence.repositories.jpa.UserRepository;

@Service
public class UserService implements UserDetailsService {
	
    private UserRepository userRepository;
        
    private UserPersistenceMapper persistenceMapper;
    
    @Autowired
    private UserService(UserRepository userRepository, UserPersistenceMapper persistenceMapper) {
    	this.userRepository = userRepository;
    	this.persistenceMapper = persistenceMapper;
    }
    
    public UserDetails loadUserByUsername(String identifiant) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findByIdentifiant(identifiant).get();
        User user = persistenceMapper.toModel(userEntity);
        
        if (user == null) {
            throw new UsernameNotFoundException("No user found with username: " + identifiant);
        }
        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        List<String> roles = user.getRoles().stream().map(role -> role.getRole()).collect(Collectors.toList());
        
        return new org.springframework.security.core.userdetails.User(
          user.getIdentifiant(), user.getHashedPassword(), enabled, accountNonExpired,
          credentialsNonExpired, accountNonLocked, getAuthorities(roles));
    }
    
    private static List<GrantedAuthority> getAuthorities (List<String> roles) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }
}
