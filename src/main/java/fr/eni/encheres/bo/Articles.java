package fr.eni.encheres.bo;

import java.sql.Date;

public class Articles {

	private Integer no_article;
    private String nom_article;
    private String description;
    private Date date_debut_encheres;
    private Date date_fin_encheres;
    private Integer prix_initial;
    private Integer prix_vente;
    private Integer no_utilisateur;
    private Integer no_categorie;
	private Utilisateur user;
	private Categories libelle; 
	private Categories categorieArticle;
	private Retrait lieuRetrait;
    
    
    public Articles() {
    }
    
    public Articles(Integer no_article, String nom_article, String description, Date date_debut_encheres,
			Date date_fin_encheres, Integer prix_initial, Integer prix_vente, Integer no_utilisateur,
			Integer no_categorie, Utilisateur user, Categories libelle) {
		super();
		this.no_article = no_article;
		this.nom_article = nom_article;
		this.description = description;
		this.date_debut_encheres = date_debut_encheres;
		this.date_fin_encheres = date_fin_encheres;
		this.prix_initial = prix_initial;
		this.prix_vente = prix_vente;
		this.no_utilisateur = no_utilisateur;
		this.no_categorie = no_categorie;
		this.user = user;
		this.libelle = libelle;
	}

	public Articles(Integer no_article, String nom_article, String description, Date date_debut_encheres,
			Date date_fin_encheres, Integer prix_initial, Integer prix_vente, Integer no_utilisateur,
			Integer no_categorie) {
		super();
		this.no_article = no_article;
		this.nom_article = nom_article;
		this.description = description;
		this.date_debut_encheres = date_debut_encheres;
		this.date_fin_encheres = date_fin_encheres;
		this.prix_initial = prix_initial;
		this.prix_vente = prix_vente;
		this.no_utilisateur = no_utilisateur;
		this.no_categorie = no_categorie;
	}


	public Articles(String nom_article, String description, Date date_debut_encheres,
			Date date_fin_encheres, Integer prix_initial, Integer prix_vente, Integer no_utilisateur,
			Integer no_categorie) {
		super();
		this.nom_article = nom_article;
		this.description = description;
		this.date_debut_encheres = date_debut_encheres;
		this.date_fin_encheres = date_fin_encheres;
		this.prix_initial = prix_initial;
		this.prix_vente = prix_vente;
		this.no_utilisateur = no_utilisateur;
		this.no_categorie = no_categorie;
	}

	public Articles(String nomArticle, String description, Date dateDebutEncheres, Date dateFinEncheres, Integer miseAPrix, Integer prixVente, Categories categorieArticle, Retrait lieuRetrait, Utilisateur user) {
        this.nom_article = nomArticle;
        this.description = description;
        this.date_debut_encheres = dateDebutEncheres;
        this.date_debut_encheres = dateFinEncheres;
        this.prix_initial = miseAPrix;
        this.prix_vente = prixVente;
        this.categorieArticle = categorieArticle;
        this.lieuRetrait = lieuRetrait;
        this.user = user;
    }



	public Integer getNo_article() {
		return no_article;
	}

	public void setNo_article(Integer no_article) {
		this.no_article = no_article;
	}

	public String getNom_article() {
		return nom_article;
	}

	public void setNom_article(String nom_article) {
		this.nom_article = nom_article;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate_debut_encheres() {
		return date_debut_encheres;
	}

	public void setDate_debut_encheres(Date date_debut_encheres) {
		this.date_debut_encheres = date_debut_encheres;
	}

	public Date getDate_fin_encheres() {
		return date_fin_encheres;
	}

	public void setDate_fin_encheres(Date date_fin_encheres) {
		this.date_fin_encheres = date_fin_encheres;
	}

	public Integer getPrix_initial() {
		return prix_initial;
	}

	public void setPrix_initial(Integer prix_initial) {
		this.prix_initial = prix_initial;
	}

	public Integer getPrix_vente() {
		return prix_vente;
	}

	public void setPrix_vente(Integer prix_vente) {
		this.prix_vente = prix_vente;
	}

	public Integer getNo_utilisateur() {
		return no_utilisateur;
	}

	public void setNo_utilisateur(Integer no_utilisateur) {
		this.no_utilisateur = no_utilisateur;
	}

	public Integer getNo_categorie() {
		return no_categorie;
	}

	public void setNo_categorie(Integer no_categorie) {
		this.no_categorie = no_categorie;
	}

	public Utilisateur getUser() {
		return user;
	}

	public void setUser(Utilisateur user) {
		this.user = user;
	}

	public Retrait getLieuRetrait() {
		return lieuRetrait;
	}

	public void setLieuRetrait(Retrait lieuRetrait) {
		this.lieuRetrait = lieuRetrait;
	}

	public Categories getCategorieArticle() {
		return categorieArticle;
	}

	public void setCategorieArticle(Categories categorieArticle) {
		this.categorieArticle = categorieArticle;
		categorieArticle.addArticle(this);
	}
	
	public Categories getLibelle() {
		return libelle;
	}

	public void setLibelle(Categories libelle) {
		this.libelle = libelle;
	}


	@Override
	public String toString() {
		return "Articles [no_article=" + no_article + ", nom_article=" + nom_article + ", description=" + description
				+ ", date_debut_encheres=" + date_debut_encheres + ", date_fin_encheres=" + date_fin_encheres
				+ ", prix_initial=" + prix_initial + ", prix_vente=" + prix_vente + ", no_utilisateur=" + no_utilisateur
				+ ", no_categorie=" + no_categorie + "]";
	}

	public String toString2() {
		return "Articles [no_article=" + no_article + ", nom_article=" + nom_article + ", description=" + description
				+ ", date_debut_encheres=" + date_debut_encheres + ", date_fin_encheres=" + date_fin_encheres
				+ ", prix_initial=" + prix_initial + ", prix_vente=" + prix_vente + ", no_utilisateur=" + no_utilisateur
				+ ", no_categorie=" + no_categorie + ", user=" + user + ", libelle=" + categorieArticle.getLibelle() + "]";
	}









	
	
}

