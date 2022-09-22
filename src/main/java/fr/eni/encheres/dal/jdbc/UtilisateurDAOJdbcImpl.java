package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.UtilisateurDAO;
import fr.eni.encheres.dal.ConnectionProvider;

public class UtilisateurDAOJdbcImpl implements UtilisateurDAO{
	public static final String selectByMail = "SELECT no_utilisateur, pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur FROM UTILISATEURS WHERE email = ?";
	public static final String selectByPseudo = "SELECT * FROM UTILISATEURS WHERE pseudo = ?";
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
	public void inserUtilisateur(Utilisateur user) {
		
	}

	@Override
	public Utilisateur modifierUtilisateur(Utilisateur user) {
		return null;
	}


	
}
