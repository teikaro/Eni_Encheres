package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.UtilisateurDAO;
import fr.eni.encheres.dal.ConnectionProvider;

public class UtilisateurDAOJdbcImpl implements UtilisateurDAO{
	public static final String selectByMail = "SELECT no_utilisateur, pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur FROM UTILISATEURS WHERE email = ?";
	public static final String selectByPseudo = "SELECT * FROM UTILISATEURS WHERE pseudo = ?";
	public static final String insert = "INSERT into UTILISATEURS(pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur) values (?,?,?,?,?,?,?,?,?,?,?)";
	public static final String selectById = "SELECT * FROM UTILISATEURS WHERE no_utilisateur = ?";
	
	public Utilisateur getUserByLogin(String login, String requete) {
		Utilisateur user = null;
		try (Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(requete)){
					pstmt.setString(1, login);
					try(ResultSet rs = pstmt.executeQuery()){
						if(rs.next()) {
							user = new Utilisateur(rs.getInt("no_utilisateur"), rs.getString("pseudo"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"), 
									rs.getString("telephone"), rs.getString("rue"), rs.getString("code_postal"), rs.getString("ville"), 
									rs.getString("mot_de_passe"), rs.getInt("credit"), rs.getBoolean("administrateur"));
						}
					}
				} catch (SQLException e) {

					e.printStackTrace();
				}
		//System.out.println(user.toString());
		return user;
	}

	@Override
	public Utilisateur getUserByMail(String login) {
		return getUserByLogin(login, selectByMail);
	}

	@Override
	public Utilisateur getUserByPseudo(String login) {
		return getUserByLogin(login, selectByPseudo);
	}

	public void inserUtilisateur(Utilisateur user) {
		Connection c = null;
		PreparedStatement rqt = null;
		
		try {
			c = ConnectionProvider.getConnection();
			rqt = c.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			rqt.setString(1, user.getPseudo());
			rqt.setString(2, user.getNom());
			rqt.setString(3, user.getPrenom());
			rqt.setString(4, user.getEmail());
			rqt.setString(5, user.getTelephone());
			rqt.setString(6, user.getRue());
			rqt.setString(7, user.getCode_postal());
			rqt.setString(8, user.getVille());
			rqt.setString(9, user.getMot_de_passe());
			rqt.setInt(10, user.getCredit());
			rqt.setBoolean(11, user.isAdministrateur());
			
			int nbRows = rqt.executeUpdate();
			if (nbRows == 1) {
				ResultSet rs = rqt.getGeneratedKeys();
				if (rs.next()) {
					user.setNo_utilisateur(rs.getInt(1));
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Utilisateur getUserById(Integer id, String requete) {
		Utilisateur user = null;
		try (Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(requete)){
					pstmt.setInt(1, id);
					try(ResultSet rs = pstmt.executeQuery()){
						if(rs.next()) {
							user = new Utilisateur(rs.getInt("no_utilisateur"), rs.getString("pseudo"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"), 
									rs.getString("telephone"), rs.getString("rue"), rs.getString("code_postal"), rs.getString("ville"), 
									rs.getString("mot_de_passe"), rs.getInt("credit"), rs.getBoolean("administrateur"));
						}
					}
				} catch (SQLException e) {

					e.printStackTrace();
				}
		return user;
	}

	@Override
	public Utilisateur getUserById(Integer id) {
		return getUserById(id, selectById);
	}

	@Override
	public Utilisateur modifierUtilisateur(Utilisateur user) {
		// TODO Auto-generated method stub
		return null;
	}
}
