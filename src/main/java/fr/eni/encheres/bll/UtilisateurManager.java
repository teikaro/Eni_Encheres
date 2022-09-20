package fr.eni.encheres.bll;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.DAOFactory;
import fr.eni.encheres.dal.UtilisateurDAO;

public class UtilisateurManager {
	
	private static UtilisateurManager instance;
	private UtilisateurDAO daoUser;
	
	private UtilisateurManager() {
		daoUser = DAOFactory.getUtilisateurDAO();
	}
	
	public static UtilisateurManager getInstance() {
		if(instance == null) {
			instance = new UtilisateurManager();
		}
		return instance;
	}
	
	public Utilisateur seConnecter(String login, String mdp) throws BusinessException {
		Utilisateur user = null;
		BusinessException be = null;
		if(login.contains("@")) {
			user = daoUser.getUserByMail(login);
		}else {
			user = daoUser.getUserByPseudo(login);
		}
		if(user == null || !user.getMot_de_passe().equals(mdp)) {
			be = new BusinessException();
			be.ajouterErreur(CodesResultatBLL.LOGIN_KO);
		}
		if(be != null) {
			throw be;
		}
		return user;
	}
}
