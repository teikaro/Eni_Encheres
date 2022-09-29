package fr.eni.encheres.dal;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bo.Articles;
import fr.eni.encheres.bo.Retrait;

import java.util.List;

public interface ArticleDAO {

    public List<Articles> selectVentesEnCours();

	Articles selectByNoArticle(int noArticle) throws BusinessException;

	public void insertArticle(Articles article, Retrait retrait) throws BusinessException;

}