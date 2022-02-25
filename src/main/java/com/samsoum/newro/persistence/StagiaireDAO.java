package com.samsoum.newro.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.ui.PageStagiaire;


public class StagiaireDAO {
	public static int page = 1;
	private static int rowsPerPage = 40;
	private static StagiaireDAO instance;
	private String INSERT_QUERY = "INSERT INTO stagiaire(first_name, last_name, arrival, formation_over, promotion_id) VALUES(?,?,?,?,?);";
	private String COUNT_QUERY = "SELECT COUNT(*) AS rowcount FROM stagiaire;";
	private String DELETE_QUERY = "DELETE FROM stagiaire WHERE id=?;"; 
	private String GET_ONE_QUERY = "SELECT * FROM stagiaire WHERE id=?;";
	private String GET_ALL_QUERY = "SELECT * FROM stagiaire;";
	private String GET_PAGINATED_QUERY = "SELECT * FROM stagiaire ORDER BY id LIMIT ?, ?;";
	private String UPDATE_QUERY = "UPDATE stagiaire SET first_name=?, last_name=?, arrival=?, formation_over=?, promotion_id=? WHERE id=?;";

	private StagiaireDAO() {
		
	}
	public static StagiaireDAO getInstance() {
		if (StagiaireDAO.instance == null) {
			StagiaireDAO.instance = new StagiaireDAO();
		}
		return StagiaireDAO.instance;
	}
	
	public void add(Stagiaire data) throws DAOException {
		try(Connection con = DatabaseConnection.getConnection(); ){
			PreparedStatement st = 	con.prepareStatement(INSERT_QUERY);
			st = StagiaireMapper.getInstance().toStatement(data, st);
			try {
				st.executeUpdate();
				System.out.println("L'enregistrement : " + data + " a bien été enregistré");
			}
			catch(SQLException e) {
				// TODO : Logger cette exception
				e.printStackTrace();
				throw new DAOException("Problème dans l'enregistrement du stagaiaire " + data + " en base de donnée.");
			} 
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}


	public void delete(int id) throws DAOException {
		try(Connection con = DatabaseConnection.getConnection(); ){
			PreparedStatement st = con.prepareStatement(DELETE_QUERY);
			st.setInt(1, id);
			try {
				st.executeUpdate();		
				System.out.println("Le stagiaire d'id " + id + " a bien été supprimé"); 
			}
			catch(SQLException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans la suppression du stagiaire d'identifiant : " + id + " en base de donnée.");
			}
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public Stagiaire getOne(int id) throws DAOException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(GET_ONE_QUERY);){
			st.setInt(1, id);
			try {
				ResultSet res = st.executeQuery();
				res.next();
				return StagiaireMapper.getInstance().toModel(res);
			}
			catch(SQLException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans l'accès au stagiaire d'identifiant : " + id + " dans la base de donnée.");
			}
		} 
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public int getNumberOfStagiaires() throws DAOException {
		try(Connection con = DatabaseConnection.getConnection(); ) {
				PreparedStatement st = con.prepareStatement(COUNT_QUERY);
				try {
					ResultSet res = st.executeQuery();
					res.next();
					int numOfRows = res.getInt("rowcount");
					return numOfRows;
				}
				catch(SQLException e) {
					e.printStackTrace();
					throw new DAOException("Problème dans la réalisation du décompte de stagiaires en base de donnée.");
				}

		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	public List<Stagiaire> getAll() throws DAOException {
		try(Connection con = DatabaseConnection.getConnection(); ) {
			PreparedStatement st = con.prepareStatement(GET_ALL_QUERY);
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Stagiaire> liste = new ArrayList<>();
				while(res.next()) {
					
					liste.add(StagiaireMapper.getInstance().toModel(res)); 
				}
				return liste;
			}
			catch(SQLException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans l'accès à l'ensemble des stagiaires en base de donnée.");
			}
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}
	
	public PageStagiaire getPaginated() throws DAOException{
		return this.getPaginated(StagiaireDAO.page);
	}
	
	public PageStagiaire getPaginated(int page) throws DAOException{
		try(Connection con = DatabaseConnection.getConnection(); ){
			PreparedStatement st = con.prepareStatement(GET_PAGINATED_QUERY);
			int premiereLigne = (page -1)*PageStagiaire.NOMBRES_DE_LIGNES_PAR_DEFAUT;
			st.setInt(1, premiereLigne);
			st.setInt(2, PageStagiaire.NOMBRES_DE_LIGNES_PAR_DEFAUT);
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Stagiaire> liste = new ArrayList<>();
				while(res.next()) {
					liste.add(StagiaireMapper.getInstance().toModel(res)); 
				}
				return new PageStagiaire(page, PageStagiaire.NOMBRES_DE_LIGNES_PAR_DEFAUT, liste);
			}
			catch(SQLException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans l'accès à l'ensemble des stagiaires entre les identifiants "+ premiereLigne + " et " + (premiereLigne+StagiaireDAO.rowsPerPage) + " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}
	
	public PageStagiaire getPaginated( int page, int rowsPerPage) throws DAOException{
		try(Connection con = DatabaseConnection.getConnection(); ){
			PreparedStatement st = con.prepareStatement(GET_PAGINATED_QUERY);
			int premierId = (page -1)*rowsPerPage;
			st.setInt(1, premierId);
			st.setInt(2, rowsPerPage);
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Stagiaire> liste = new ArrayList<>();
				while(res.next()) {
					liste.add(StagiaireMapper.getInstance().toModel(res)); 
				}
				return new PageStagiaire(page, rowsPerPage, liste);
			}
			catch(SQLException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans l'accès à l'ensemble des stagiaires entre les identifiants "+ premierId + " et " + (premierId+StagiaireDAO.rowsPerPage) + " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public void update(Stagiaire stagiaire) throws DAOException {
		try(Connection con = DatabaseConnection.getConnection();){
			PreparedStatement statement = con.prepareStatement(UPDATE_QUERY);
			statement = StagiaireMapper.getInstance().toUpdateStatement(stagiaire, statement);
			try {
				statement.executeUpdate();
				System.out.println("Le stagiaire : " + stagiaire + " a bien été modifié !");
			}
			catch(SQLException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans la mise à jour du stagiaire " + stagiaire + " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		}
		catch(SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}
	public void setRowsPerPage(int numOfRows) {
		rowsPerPage = numOfRows;
	}
	
}
