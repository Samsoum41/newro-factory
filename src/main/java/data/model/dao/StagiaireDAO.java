package data.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import data.model.Stagiaire;

public class StagiaireDAO implements DAO<Stagiaire>{
	static Connection con = DatabaseConnection.getConnection();
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	@Override
	public int add(Stagiaire data) throws SQLException {
		String query = "INSERT INTO stagiaire(first_name, last_name, arrival, formation_over, promotion_id) VALUES(?,?,?,?,?);";
		PreparedStatement st = 	con.prepareStatement(query);
		
		Timestamp arrival = data.getArrival() == null  ? null : Timestamp.valueOf(data.getArrival().atStartOfDay());
		Timestamp formation_over = data.getFormation_over() == null ? null : Timestamp.valueOf(data.getFormation_over().atStartOfDay());
		
		st.setString(1, data.getFirst_name());
		st.setString(2, data.getLast_name());
		st.setTimestamp(3, arrival);
		st.setTimestamp(4, formation_over);
		st.setInt(5, data.getPromotion_id());
		try {
			int n = st.executeUpdate();
			System.out.println("L'enregistrement : " + data + " a bien été enregistré");
			return n;
		}
		catch(SQLException e) {
			System.out.println("L'enregistrement en base de donné a échoué");
			System.out.println(e.getMessage());
			return 0;
		}

	}

	@Override
	public void delete(int id) throws SQLException {
		String query = "DELETE FROM stagiaire WHERE id=?;"; 
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();		
		System.out.println("Le stagiaire d'id " + id + " a bien été supprimé"); 
	}

	@Override
	public Stagiaire getOne(int id) throws SQLException {
		String query = "SELECT * FROM stagiaire WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet res = st.executeQuery();
		res.next();
		LocalDate arrival = res.getDate("arrival") == null  ? null : res.getDate("arrival").toLocalDate();
		LocalDate formation_over = res.getDate("formation_over") == null ? null : res.getDate("arrival").toLocalDate();
		return new Stagiaire(res.getInt("id"), res.getString("first_name"), res.getString("last_name"), arrival, formation_over, res.getInt("promotion_id"));
	}

	@Override
	public List<Stagiaire> getAll() throws SQLException {
		String query = "SELECT * FROM stagiaire;";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet res = st.executeQuery();
		ArrayList<Stagiaire> liste = new ArrayList<>();
		while(res.next()) {
			LocalDate arrival = res.getDate("arrival") == null  ? null : res.getDate("arrival").toLocalDate();
			LocalDate formation_over = res.getDate("formation_over") == null ? null : res.getDate("arrival").toLocalDate();
			liste.add(new Stagiaire(res.getInt("id"), res.getString("first_name"), res.getString("last_name"), arrival, formation_over, res.getInt("promotion_id"))); 
		}
		return liste;
	}
	
	@Override
	public List<Stagiaire> getPaginated() throws SQLException{
		String query = "SELECT * FROM stagiaire ORDER BY id LIMIT ?, ?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, (StagiaireDAO.page -1)*StagiaireDAO.ROWS_PER_PAGE);
		st.setInt(2, StagiaireDAO.ROWS_PER_PAGE);
		ResultSet res = st.executeQuery();
		ArrayList<Stagiaire> liste = new ArrayList<>();
		while(res.next()) {
			LocalDate arrival = res.getDate("arrival") == null  ? null : res.getDate("arrival").toLocalDate();
			LocalDate formation_over = res.getDate("formation_over") == null ? null : res.getDate("arrival").toLocalDate();
			liste.add(new Stagiaire(res.getInt("id"), res.getString("first_name"), res.getString("last_name"), arrival, formation_over, res.getInt("promotion_id"))); 
		}
		return liste;
	}

	@Override
	public void update(Stagiaire data) throws SQLException {
		String query = "UPDATE stagiaire SET first_name=?, last_name=?, arrival=?, formation_over=?, promotion_id=? WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		Date arrival = data.getArrival() == null ? null : Date.valueOf(data.getArrival());
		Date formation_over = data.getFormation_over() == null ? null : Date.valueOf(data.getFormation_over());

		st.setString(1, data.getFirst_name());
		st.setString(2, data.getLast_name());
		st.setDate(3, arrival);
		st.setDate(4, formation_over);
		st.setInt(5, data.getPromotion_id());
		st.setInt(6, data.getId());

		try {
			st.executeUpdate();
			System.out.println("Le stagiaire : " + data + " a bien été modifié !");
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
}
