package fr.eni.encheres.dal.jdbc;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import fr.eni.encheres.bo.Articles;
import fr.eni.encheres.bo.Categorie;
import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.ArticleDAO;
import fr.eni.encheres.dal.ConnectionProvider;

public class ArticleDAOJdbcImpl implements ArticleDAO {
	
	 private static final String SELECT_VENTES_EN_COURS = "SELECT * FROM Articles a " +
	            "LEFT JOIN Utilisateurs u " +
	            "ON a.no_utilisateur = u.no_utilisateur " +
	            "LEFT JOIN Categories c " +
	            "ON a.no_categorie = c.no_categorie ";
	          //  "WHERE a.date_debut_encheres <= GETDATE() AND a.date_fin_encheres >= GETDATE()";
	
	
	
	 @Override
	    public List<Articles> selectVentesEnCours(){
	        List<Articles> listeArticles = new ArrayList<>();

	        try (Connection con = ConnectionProvider.getConnection()){
	            Statement selectall = con.createStatement();
	            ResultSet rs = selectall.executeQuery(SELECT_VENTES_EN_COURS);

	            while(rs.next()) {
	            	
	                Articles article = new Articles(rs.getInt("no_article"), rs.getString("nom_article"), rs.getString("description"),
	                        rs.getDate("date_debut_encheres"), rs.getDate("date_fin_encheres"),
	                        rs.getInt("prix_initial"), rs.getInt("prix_vente"), rs.getInt("no_utilisateur"), rs.getInt("no_categorie"));

	                Utilisateur user = new Utilisateur(rs.getString("pseudo"));
	                Categorie categorie = new Categorie(rs.getString("libelle"));
	                
	                article.setUser(user);
	                article.setLibelle(categorie);
	                
	              article.toString2();
	              listeArticles.add(article);

	            }

	            rs.close();
	            selectall.close();

	        } catch(Exception ex) {
	            ex.printStackTrace();
	        }

	        return listeArticles;
	    }



}
