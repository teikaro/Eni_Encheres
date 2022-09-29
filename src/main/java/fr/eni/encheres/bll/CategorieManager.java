package fr.eni.encheres.bll;

import java.util.List;

import fr.eni.encheres.bo.Categories;
import fr.eni.encheres.dal.CategorieDAO;
import fr.eni.encheres.dal.DAOFactory;

public class CategorieManager {
	
	private static CategorieManager instance;
	public final CategorieDAO daoType;
	
	private CategorieManager() {
		daoType = DAOFactory.getCategorieDAO();
	}
	
	public static CategorieManager getInstance() {
		if (instance == null) {
			instance = new CategorieManager();
		}
		return instance;
	}

	public List<Categories> listeCategories() {
		return daoType.selectCategorie();
	}
	
	
}
