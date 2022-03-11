package com.samsoum.newro.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import com.samsoum.newro.mapper.MapperException;
import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.ui.PageStagiaire;
import com.samsoum.newro.util.Context;
import com.samsoum.newro.util.SpringConfig;

@Repository
public class StagiaireDAO {
	private DataSource datasource;
	// Parfois je ne mets pas le ';' dans les requêtes pour pouvoir les concaténer
	private String SELECT_QUERY = "SELECT stagiaire.id, first_name, last_name, arrival, formation_over, promotion_id, name FROM stagiaire INNER JOIN promotion ON promotion_id=promotion.id ";
	private String ORDER_QUERY = "ORDER BY %s ASC ";	
	private String PAGINATE_QUERY = "LIMIT ?, ? ";
	private String FILTER_QUERY = "WHERE %s LIKE '%%%s%%' ";
	// Requêtes composés : 
	private String INSERT_QUERY = "INSERT INTO stagiaire(first_name, last_name, arrival, formation_over, promotion_id) VALUES(?,?,?,?,?);";
	private String COUNT_QUERY = "SELECT COUNT(*) AS rowcount FROM stagiaire;";
	private String DELETE_QUERY = "DELETE FROM stagiaire WHERE stagiaire.id=?;";
	private String GET_ONE_QUERY = SELECT_QUERY + "WHERE stagiaire.id=?;";
	private String GET_BY_NAMES_QUERY = SELECT_QUERY + "WHERE first_name = ? AND last_name=?;";
	private String GET_ALL_QUERY = SELECT_QUERY + ";";
	private String GET_PAGINATED_QUERY = SELECT_QUERY  + PAGINATE_QUERY;
	private String GET_ORDERED_PAGINATED_QUERY = SELECT_QUERY + ORDER_QUERY + PAGINATE_QUERY;
	private String GET_ORDERED_PAGINATED_AND_FILTERED_QUERY = SELECT_QUERY + FILTER_QUERY + ORDER_QUERY + PAGINATE_QUERY;
	private String UPDATE_QUERY = SELECT_QUERY
			+ "UPDATE stagiaire SET first_name=?, last_name=?, arrival=?, formation_over=?, promotion_id=? WHERE stagiaire.id=?;";

	@Autowired
	public StagiaireDAO(DataSource datasource) {
		this.datasource = datasource;
	}
	
//
//	public static StagiaireDAO getInstance() {
//		if (StagiaireDAO.instance == null) {
//			StagiaireDAO.instance = new StagiaireDAO();
//		}
//		return StagiaireDAO.instance;
//	}

	public Optional<Stagiaire> getByNames(String first_name, String last_name) throws DAOException {
		try (Connection con = datasource.getConnection();) {
			PreparedStatement st = con.prepareStatement(GET_BY_NAMES_QUERY);
			st.setString(1, first_name);
			st.setString(2, last_name);
			try {
				ResultSet res = st.executeQuery();
				if (res.isBeforeFirst()) {
					res.next();
					Optional<Stagiaire> opt = Optional.of(StagiaireMapper.getInstance().toModel(res));
					return opt;
				} else {
					// TODO : changer ce return null
					return Optional.empty();
				}
			} catch (SQLException | MapperException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans l'accès au stagiaire d'identifiant : " + first_name
						+ " dans la base de donnée.");
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public void add(Stagiaire data) throws DAOException {
		try (Connection con = datasource.getConnection();) {
			PreparedStatement st = con.prepareStatement(INSERT_QUERY);
			st = StagiaireMapper.getInstance().toStatement(data, st);
			try {
				st.executeUpdate();
				System.out.println("L'enregistrement : " + data + " a bien été enregistré");
			} catch (SQLException e) {
				// TODO : Logger cette exception
				e.printStackTrace();
				throw new DAOException("Problème dans l'enregistrement du stagaiaire " + data + " en base de donnée.");
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		} catch (MapperException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			throw new DAOException();
		}
	}

	public int delete(int id) throws DAOException {
		try (Connection con = datasource.getConnection();) {
			PreparedStatement st = con.prepareStatement(DELETE_QUERY);
			st.setInt(1, id);
			try {
				int res = st.executeUpdate();
				if (res > 0) {
					System.out.println("Le stagiaire d'id " + id + " a bien été supprimé");
				} else {
					System.out.println("Pas de stagiaire avec cet id");
				}
				return res;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException(
						"Problème dans la suppression du stagiaire d'identifiant : " + id + " en base de donnée.");
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public Optional<Stagiaire> getOne(int id) throws DAOException {
		try (Connection con = datasource.getConnection();
				PreparedStatement st = con.prepareStatement(GET_ONE_QUERY);) {
			st.setInt(1, id);
			try {
				ResultSet res = st.executeQuery();
				if (res.isBeforeFirst()) {
					res.next();
					Optional<Stagiaire> opt = Optional.of(StagiaireMapper.getInstance().toModel(res));
					return opt;
				} else {
					// TODO : changer ce return null
					return Optional.empty();
				}
			} catch (SQLException | MapperException e) {
				e.printStackTrace();
				throw new DAOException(
						"Problème dans l'accès au stagiaire d'identifiant : " + id + " dans la base de donnée.");
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public int getNumberOfStagiaires() throws DAOException {
		try (Connection con = datasource.getConnection();) {
			PreparedStatement st = con.prepareStatement(COUNT_QUERY);
			try {
				ResultSet res = st.executeQuery();
				res.next();
				int numOfRows = res.getInt("rowcount");
				return numOfRows;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans la réalisation du décompte de stagiaires en base de donnée.");
			}

		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public List<Stagiaire> getAll() throws DAOException {
		try (Connection con = datasource.getConnection();) {
			PreparedStatement st = con.prepareStatement(GET_ALL_QUERY);
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Stagiaire> liste = new ArrayList<>();
				while (res.next()) {

					liste.add(StagiaireMapper.getInstance().toModel(res));
				}
				return liste;
			} catch (SQLException | MapperException e) {
				e.printStackTrace();
				throw new DAOException("Problème dans l'accès à l'ensemble des stagiaires en base de donnée.");
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public PageStagiaire getPaginated() throws DAOException {
		return this.getPaginated(PageStagiaire.STARTING_PAGE);
	}

	public PageStagiaire getPaginated(int page) throws DAOException {
		try (Connection con = datasource.getConnection();) {
			PreparedStatement st = con.prepareStatement(GET_PAGINATED_QUERY);
			int premiereLigne = (page - 1) * PageStagiaire.NOMBRES_DE_LIGNES_PAR_DEFAUT;
			st.setInt(1, premiereLigne);
			st.setInt(2, PageStagiaire.NOMBRES_DE_LIGNES_PAR_DEFAUT);
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Stagiaire> liste = new ArrayList<>();
				while (res.next()) {
					liste.add(StagiaireMapper.getInstance().toModel(res));
				}
				return new PageStagiaire(page, PageStagiaire.NOMBRES_DE_LIGNES_PAR_DEFAUT, liste);
			} catch (SQLException | MapperException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans l'accès à l'ensemble des stagiaires entre les identifiants "
						+ premiereLigne + " et " + (premiereLigne + PageStagiaire.NOMBRES_DE_LIGNES_PAR_DEFAUT)
						+ " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public PageStagiaire getPaginated(int page, int rowsPerPage) throws DAOException {
		try (Connection con = datasource.getConnection();) {
			PreparedStatement st = con.prepareStatement(GET_PAGINATED_QUERY);
			int premierId = (page - 1) * rowsPerPage;
			st.setInt(1, premierId);
			st.setInt(2, rowsPerPage);
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Stagiaire> liste = new ArrayList<>();
				while (res.next()) {
					liste.add(StagiaireMapper.getInstance().toModel(res));
				}
				
				return new PageStagiaire(page, rowsPerPage, liste);
			} catch (SQLException | MapperException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans l'accès à l'ensemble des stagiaires entre les identifiants "
						+ premierId + " et " + (premierId + rowsPerPage) + " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public PageStagiaire getOrderdAndPaginated(StagiaireField field, int page, int rowsPerPage) throws DAOException {
		try (Connection con = datasource.getConnection();) {
			String query = String.format(GET_ORDERED_PAGINATED_QUERY, field.getValue());
			PreparedStatement st = con.prepareStatement(query);
			int premierId = (page - 1) * rowsPerPage;
			st.setInt(1, premierId);
			st.setInt(2, rowsPerPage);
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Stagiaire> liste = new ArrayList<>();
				while (res.next()) {
					liste.add(StagiaireMapper.getInstance().toModel(res));
				}
				return new PageStagiaire(page, rowsPerPage, liste);
			} catch (SQLException | MapperException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans l'accès à l'ensemble des stagiaires entre les identifiants "
						+ premierId + " et " + (premierId + rowsPerPage) + " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public PageStagiaire getOrderdAndPaginatedAndFiltered(StagiaireField orderField, StagiaireField filterField, String filterValue, int page, int rowsPerPage) throws DAOException {
		try (Connection con = datasource.getConnection();) {
			String query = String.format(GET_ORDERED_PAGINATED_AND_FILTERED_QUERY, filterField.getValue(), filterValue, orderField.getValue());
			System.out.println(query);
			PreparedStatement st = con.prepareStatement(query);
			int premierId = (page - 1) * rowsPerPage;
			st.setInt(1, premierId);
			st.setInt(2, rowsPerPage);
			try {
				ResultSet res = st.executeQuery();
				ArrayList<Stagiaire> liste = new ArrayList<>();
				while (res.next()) {
					liste.add(StagiaireMapper.getInstance().toModel(res));
				}
				return new PageStagiaire(page, rowsPerPage, liste);
			} catch (SQLException | MapperException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans l'accès à l'ensemble des stagiaires entre les identifiants "
						+ premierId + " et " + (premierId + rowsPerPage) + " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public void update(Stagiaire stagiaire) throws DAOException {
		try (Connection con = datasource.getConnection();) {
			PreparedStatement statement = con.prepareStatement(UPDATE_QUERY);
			statement = StagiaireMapper.getInstance().toUpdateStatement(stagiaire, statement);
			try {
				statement.executeUpdate();
				System.out.println("Le stagiaire : " + stagiaire + " a bien été modifié !");
			} catch (SQLException e) {
				e.printStackTrace();
				String messageErreur = "Problème dans la mise à jour du stagiaire " + stagiaire + " en base de donnée.";
				throw new DAOException(messageErreur);
			}
		} catch (SQLException | MapperException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}
}
