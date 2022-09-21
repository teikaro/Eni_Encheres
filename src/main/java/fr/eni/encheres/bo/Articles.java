package fr.eni.encheres.bo;

import java.time.LocalDateTime;

public class Articles {

	private Integer noArticle;
    private String nomArticle;
    private String description;
    private LocalDateTime dateDebutEncheres;
    private LocalDateTime dateFinEncheres;
    private Integer prixInitial;
    private Integer prixVente;
    private Integer noCategorie;
    private Integer noUtilisateur;
    
    public Articles() {
    }
    
    public Articles(Integer noArticle, String nomArticle, String description, LocalDateTime dateDebutEncheres, LocalDateTime dateFinEncheres, Integer prixInitial, Integer prixVente, Integer noCategorie) {
        this.noArticle = noArticle;
        this.nomArticle = nomArticle;
        this.description = description;
        this.dateDebutEncheres = dateDebutEncheres;
        this.dateFinEncheres = dateFinEncheres;
        this.prixInitial = prixInitial;
        this.prixVente = prixVente;
        this.noCategorie = noCategorie;
    }
    
    public Articles(String nomArticle, String description, LocalDateTime dateDebutEncheres, LocalDateTime dateFinEncheres,
            Integer prixInitial, Integer prixVente, Integer noCategorie) {
    	this.nomArticle = nomArticle;
		this.description = description;
		this.dateDebutEncheres = dateDebutEncheres;
		this.dateFinEncheres = dateFinEncheres;
		this.prixInitial = prixInitial;
		this.prixVente = prixVente;
		this.noCategorie = noCategorie;
    }
    
    
    public Integer getNoArticle() {
        return noArticle;
    }

    public void setNoArticle(Integer noArticle) {
        this.noArticle = noArticle;
    }

   
    
    public String getNomArticle() {
        return nomArticle;
    }

    public void setNomArticle(String nomArticle) {
        this.nomArticle = nomArticle;
    }

    
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    
    public LocalDateTime getDateDebutEncheres() {
        return dateDebutEncheres;
    }

    public void setDateDebutEncheres(LocalDateTime dateDebutEncheres) {
        this.dateDebutEncheres = dateDebutEncheres;
    }


    
    public LocalDateTime getDateFinEncheres() {
        return dateFinEncheres;
    }

    public void setDateFinEncheres(LocalDateTime dateFinEncheres) {
        this.dateFinEncheres = dateFinEncheres;
    }


    
    public Integer getPrixInitial() {
        return prixInitial;
    }

    public void setPrixInitial(Integer prixInitial) {
        this.prixInitial = prixInitial;
    }


    
    public Integer getPrixVente() {
        return prixVente;
    }

    public void setPrixVente(Integer prixVente) {
        this.prixVente = prixVente;
    }
    
    
    
    public Integer getNoCategorie() {
        return noCategorie;
    }

    public void setNoCategorie(Integer noCategorie) {
        this.noCategorie = noCategorie;
    }

    
 
    public Integer getNoUtilisateur() {
        return noUtilisateur;
    }

    public void setNoUtilisateur(Integer noUtilisateur) {
        this.noUtilisateur = noUtilisateur;

    }
	
}

