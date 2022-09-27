package fr.eni.encheres.dal.jdbc;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bo.Articles;
import fr.eni.encheres.bo.Categorie;
import fr.eni.encheres.bo.Retrait;
import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.ArticleDAO;
import fr.eni.encheres.dal.CodesResultatDAL;
import fr.eni.encheres.dal.ConnectionProvider;

public class ArticleDAOJdbcImpl implements ArticleDAO {
	
	 private static final String SELECT_VENTES_EN_COURS = "SELECT * FROM Articles a " +
	            "LEFT JOIN Utilisateurs u " +
	            "ON a.no_utilisateur = u.no_utilisateur " +
	            "LEFT JOIN Categories c " +
	            "ON a.no_categorie = c.no_categorie ";
	          //  "WHERE a.date_debut_encheres <= GETDATE() AND a.date_fin_encheres >= GETDATE()";
	 private static final String SELECT_BY_NO_ARTICLE = "SELECT a.no_article, a.nom_article, a.description, a.date_debut_encheres, a.date_fin_encheres, " +
	            "a.prix_initial, a.prix_vente, u.pseudo, r.rue, r.code_postal, r.ville, c.libelle, c.no_categorie, u.telephone, u.no_utilisateur " +
	            "FROM Articles a " +
	            "INNER JOIN UTILISATEURS u ON a.no_utilisateur = u.no_utilisateur " +
	            "INNER JOIN Retraits r ON a.no_article = r.no_article " +
	            "INNER JOIN CATEGORIES c ON a.no_categorie = c.no_categorie " +
	            "WHERE a.no_article = ?";
	
	
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
	                
	              listeArticles.add(article);

	            }

	            rs.close();
	            selectall.close();

	        } catch(Exception ex) {
	            ex.printStackTrace();
	        }

	        return listeArticles;
	    }

	 @Override
	    public Articles selectByNoArticle(int noArticle) throws BusinessException {
	        Articles article = new Articles();

	        try (Connection con = ConnectionProvider.getConnection()){
	            PreparedStatement pstmt = con.prepareStatement(SELECT_BY_NO_ARTICLE);
	            pstmt.setInt(1,noArticle);

	            ResultSet rs = pstmt.executeQuery();

	            if(rs.next()) {
	                article.setNo_article(rs.getInt(1));
	                article.setNom_article(rs.getString(2));
	                article.setDescription(rs.getString(3));
	                article.setDate_debut_encheres(rs.getDate(4));
	                article.setDate_debut_encheres(rs.getDate(5));
	                article.setPrix_initial(6);
	                article.setPrix_vente(rs.getInt(7));


	                Utilisateur utilisateur = new Utilisateur(rs.getString(8));
	                utilisateur.setTelephone(rs.getString(14));
	                utilisateur.setNo_utilisateur(rs.getInt(15));
	                article.setUser(utilisateur);


	                Retrait retrait = new Retrait(rs.getString(9), rs.getString(10), rs.getString(11));
	                article.setLieuRetrait(retrait);

	                Categorie categorie = new Categorie(rs.getString(12));
	                categorie.setNo_categorie(rs.getInt(13));
	                article.setCategorieArticle(categorie);
	                
	                System.out.println(article.toString2());

	            }
	        } catch(Exception ex) {
	            ex.printStackTrace();
	            BusinessException businessException = new BusinessException();
	            businessException.ajouterErreur(CodesResultatDAL.SELECT_ARTICLE_BY_NUM_ECHEC);
	        }
	        return article;
	    }

}
