package fr.eni.encheres.bll;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bo.Articles;
import fr.eni.encheres.bo.Retrait;
import fr.eni.encheres.dal.ArticleDAO;
import fr.eni.encheres.dal.DAOFactory;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;

public class ArticleManager {
	
	private static final String STRING_VERIFICATION = "^[^'-]+$";
	private static final String CHECK_CP = "^\\d{5}$";
	private static final String CHECK_NUMBER = "^\\d{1,15}$";
	
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

	public void checkInsertAricle(Articles article, Retrait retrait) throws BusinessException{
		BusinessException be = new BusinessException();
		
		checkNomArticle(article.getNom_article(), be);
		checkDescription(article.getDescription(), be);
		checkPrix(article.getPrix_initial(), be);
		checkDateStart(article.getDate_debut_encheres(), be);
		checkDateEnd(article.getDate_fin_encheres(),article.getDate_debut_encheres(), be);
		checkRue(retrait.getRue(), be);
		checkVille(retrait.getVille(), be);
		checkCP(retrait.getCode_postal(), be);
		
		if (!be.hasErreurs()) {
			articleDAO.insertArticle(article, retrait);
		} else {
			throw be;
		}
	}

	private void checkRue(String rue, BusinessException be) throws BusinessException {
		if (rue.length() > 30) {
			be.ajouterErreur(CodesResultatBLL.RUE_KO);
		}
	}

	private void checkCP(String cp, BusinessException be) throws BusinessException {
		if (!cp.matches(CHECK_CP) || cp.length() > 10) {
			be.ajouterErreur(CodesResultatBLL.CP_KO);
		}
	}

	private void checkVille(String ville, BusinessException be) throws BusinessException {
		if (!ville.matches(STRING_VERIFICATION) || ville.length() > 30) {
			be.ajouterErreur(CodesResultatBLL.VILLE_KO);
		}
	}

	private void checkDateEnd(Date date_fin_encheres, Date date_debut_encheres, BusinessException be) {
		if(date_debut_encheres.after(date_fin_encheres)) {
			be.ajouterErreur(CodesResultatBLL.DATE_FIN_KO);
		}
	}

	private void checkDateStart(Date date_debut_encheres, BusinessException be) {
		java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		if(date_debut_encheres.before(date)) {
			be.ajouterErreur(CodesResultatBLL.DATE_DEBUT_KO);
		}
	}

	private void checkPrix(Integer prix_initial, BusinessException be) {
		if (!String.valueOf(prix_initial).matches(CHECK_NUMBER) || String.valueOf(prix_initial).length() > 30) {
			be.ajouterErreur(CodesResultatBLL.PRIX_KO);
		}
	}

	private void checkDescription(String description, BusinessException be) {
		if (!description.matches(STRING_VERIFICATION) || description.length() > 300) {
			be.ajouterErreur(CodesResultatBLL.DESC_KO);
		}
	}

	private void checkNomArticle(String nom, BusinessException be) {
		if (!nom.matches(STRING_VERIFICATION) || nom.length() > 30) {
			be.ajouterErreur(CodesResultatBLL.NOM_KO);
		}
	}

}
