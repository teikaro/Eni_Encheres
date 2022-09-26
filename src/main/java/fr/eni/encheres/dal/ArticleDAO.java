package fr.eni.encheres.dal;

import fr.eni.encheres.bo.Articles;

import java.util.List;

public interface ArticleDAO {

    public List<Articles> selectVentesEnCours();

}