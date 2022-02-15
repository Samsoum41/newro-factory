package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import data.model.Answer;
import data.model.Chapter;
import data.model.Promotion;

public class PromotionDAO implements DAO<Promotion>{
	static Connection con = DatabaseConnection.getConnection();

	@Override
	public int add(Promotion data) throws SQLException {
		String query = "INSERT INTO promotion(name) VALUES(?);";
		PreparedStatement st = 	con.prepareStatement(query);
		st.setString(1, data.getName());
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
		String query = "DELETE FROM promotion WHERE id=?;"; 
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();		
	}

	@Override
	public Promotion getOne(int id) throws SQLException {
		String query = "SELECT * FROM promotion WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet res = st.executeQuery();
		res.next();
		return new Promotion(res.getInt("id"), res.getString("name"));
	}

	@Override
	public List<Promotion> getAll() throws SQLException {
		String query = "SELECT * FROM promotion";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet res = st.executeQuery();
		ArrayList<Promotion> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Promotion(res.getInt("id"), res.getString("name"))); 
		}
		return liste;
	}

	@Override
	public void update(Promotion data) throws SQLException {
		String query = "UPDATE promotion SET name=? WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, data.getName());
		st.setInt(2, data.getId());
		st.executeUpdate();
	}

}
