package fr.eni.encheres.bo;

import java.util.ArrayList;
import java.util.List;

public class Categorie {

	private Integer no_categorie;
    private String libelle;
    private List<Articles> articles = new ArrayList<>();
    
    
	public Categorie(Integer no_categorie, String libelle) {
		super();
		this.no_categorie = no_categorie;
		this.libelle = libelle;
	}
	
	public Categorie() {
		super();
	}


	public Categorie(String libelle) {
		this.libelle = libelle;
	}

	public Integer getNo_categorie() {
		return no_categorie;
	}


	public void setNo_categorie(Integer no_categorie) {
		this.no_categorie = no_categorie;
	}


	public String getLibelle() {
		return libelle;
	}


	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public List<Articles> getArticles() {
		return articles;
	}

	public void setArticles(List<Articles> articles) {
		this.articles = articles;
	}
    
	//Fonction d'ajout d'un article
    public void addArticle(Articles article)
    {
        this.articles.add(article);
    }

	@Override
	public String toString() {
		return "Categorie [no_categorie=" + no_categorie + ", libelle=" + libelle + ", articles=" + articles + "]";
	}
    
   
}

