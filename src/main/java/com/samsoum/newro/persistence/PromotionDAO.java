package com.samsoum.newro.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.samsoum.newro.mapper.PromotionMapper;
import com.samsoum.newro.model.Promotion;

@Repository
public class PromotionDAO{
	private DataSource dataSource;
	public static int page = 1;
	private PromotionMapper mapper;
	private String insertQuery = "INSERT INTO promotion(name) VALUES(?);";
	private String deleteQuery = "DELETE FROM promotion WHERE id=?;"; 
	private String getOneQuery = "SELECT * FROM promotion WHERE id=?;"; 
	private String getAllQuery = "SELECT * FROM promotion;";
	//private String getPaginatedQuery = "SELECT * FROM promotion ORDER BY id LIMIT ?, ?;";
	private String updateQuery = "UPDATE promotion SET name=? WHERE id=?;";
	
	@Autowired
	private PromotionDAO(DataSource datasource, PromotionMapper mapper) {
		 this.dataSource= datasource;
		 this.mapper = mapper;
	}

	public void add(Promotion data) throws DAOException {
		try(Connection con = dataSource.getConnection(); ){
			PreparedStatement st =	con.prepareStatement(insertQuery);
			st.setString(1, data.getName());

			try {
				st.executeUpdate();
				System.out.println("L'enregistrement : " + data + " a bien été enregistré");
			}
			catch(SQLException e) {
				System.out.println("L'enregistrement en base de donné a échoué");
				e.printStackTrace();
				throw new DAOException();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public void delete(int id) throws DAOException {
		try(Connection con = dataSource.getConnection(); 
			PreparedStatement st = con.prepareStatement(deleteQuery);){
			st.setInt(1, id);
			try {
				st.executeUpdate();	
			}
			catch(SQLException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans la suppression de la promotion d'identifiant : " + id + " en base de donnée.");
			}
		}	
		catch(SQLException e) {
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public Optional<Promotion> getOne(int id) throws DAOException {
		try(Connection con = dataSource.getConnection(); 
			PreparedStatement st = con.prepareStatement(getOneQuery); ) {
			st.setInt(1, id);
			try {
				ResultSet res = st.executeQuery();
				if(res.isBeforeFirst()) {
					res.next();
					Optional<Promotion> opt = Optional.of(mapper.toModel(res));
					return opt;	
				}
				else {
					return Optional.empty();
				}
			}
			catch(SQLException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans l'accès à la promotion d'identifiant : " + id + " dans la base de donnée.");
			}
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public List<Promotion> getAll() throws DAOException {
		try(Connection con = dataSource.getConnection(); 
			PreparedStatement st = con.prepareStatement(getAllQuery);){
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Promotion> liste = new ArrayList<>();
				while(res.next()) {
					liste.add(mapper.toModel(res)); 
				}
				return liste;
			}
			catch(SQLException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans l'accès à l'ensemble des promotions en base de donnée.");
			}
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}
	
	/*
	public List<Promotion> getPaginated() throws DAOException{
		try(Connection con = dataSource.getConnection(); ){
			PreparedStatement st = con.prepareStatement(getPaginatedQuery);
			st.setInt(1, (PromotionDAO.page -1)*PromotionDAO.ROWS_PER_PAGE);
			st.setInt(2, PromotionDAO.ROWS_PER_PAGE);
			ResultSet res = st.executeQuery();
			ArrayList<Promotion> liste = new ArrayList<>();
			while(res.next()) {
				liste.add(new Promotion(res.getInt("id"), res.getString("name"))); 
			}
			return liste;
		}
	}
	*/

	public void update(Promotion data) throws DAOException {
		try(Connection con = dataSource.getConnection(); ){
			PreparedStatement st = con.prepareStatement(updateQuery);
			try {
				st = mapper.toUpdateStatement(data, st);
				st.executeUpdate();
			}
			catch(SQLException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans la mise à jour de la promotion " + data + " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

}
