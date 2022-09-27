package fr.eni.encheres.bll;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bo.Articles;
import fr.eni.encheres.dal.ArticleDAO;
import fr.eni.encheres.dal.DAOFactory;

import java.time.LocalDateTime;
import java.util.List;

public class ArticleManager {
	
	private static ArticleManager instance;

    private final ArticleDAO articleDAO;

    public ArticleManager() {
        this.articleDAO = DAOFactory.getArticleDAO();
    }
    
    public List<Articles> selectVentesEnCours() {
        return this.articleDAO.selectVentesEnCours();
    }
    
    public static ArticleManager getInstance() {
		if (instance == null) {
			instance = new ArticleManager();
		}
		return instance;
	}
    
    public void validateArticle(Articles article, BusinessException businessException) throws BusinessException{

        if (article.getNom_article() == null || article.getNom_article().isBlank()){
            businessException.ajouterErreur(CodesResultatBLL.REGLE_ARTICLE_NOM_ERREUR);
        }

        if (article.getDescription() == null || article.getDescription().isBlank()){
            businessException.ajouterErreur(CodesResultatBLL.REGLE_ARTICLE_DESCRIPTION_ERREUR);
        }

       if (article.getDate_debut_encheres() == null){
           businessException.ajouterErreur(CodesResultatBLL.REGLE_ARTICLE_DATEDEBUTENCHERE_ERREUR);
       }

       if (article.getDate_fin_encheres() == null ||
               article.getDate_fin_encheres().before(article.getDate_debut_encheres())){
           businessException.ajouterErreur(CodesResultatBLL.REGLE_ARTICLE_DATEFINENCHERE_ERREUR);
       }

        if (article.getPrix_initial() == null || article.getPrix_initial() <= 0 ){
            businessException.ajouterErreur(CodesResultatBLL.REGLE_ARTICLE_MISEAPRIX_ERREUR);
        }

       if(article.getPrix_vente() == null){
           businessException.ajouterErreur(CodesResultatBLL.REGLE_ARTICLE_PRIXVENTE_ERREUR);
       }

    }

    public Articles selectByNoArticle(int noArticle) throws BusinessException {
        return this.articleDAO.selectByNoArticle(noArticle);
    }
    
}
