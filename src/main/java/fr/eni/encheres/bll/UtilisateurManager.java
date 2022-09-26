package fr.eni.encheres.bll;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.DAOFactory;
import fr.eni.encheres.dal.UtilisateurDAO;

public class UtilisateurManager {

	private static final String EMAIL_VERIFICATION = "^(.+)@(.+)$"; // "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
	private static final String STRING_VERIFICATION = "^[^\\d\\s]+$";
	private static final String STRING_PSEUDO = "^[^\\s]+$";
	private static final String CHECK_NUMBER = "^\\d{10}$";
	private static final String CHECK_CP = "^\\d{5}$";
	private static final String REGEX_MDP = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
	private static UtilisateurManager instance;
	private UtilisateurDAO daoUser;

	private UtilisateurManager() {
		daoUser = DAOFactory.getUtilisateurDAO();
	}

	public static UtilisateurManager getInstance() {
		if (instance == null) {
			instance = new UtilisateurManager();
		}
		return instance;
	}

	public Utilisateur seConnecter(String login, String mdp) throws BusinessException {
		Utilisateur user = null;
		BusinessException be = null;
		if (login.contains("@")) {
			user = daoUser.getUserByMail(login);
		} else {
			user = daoUser.getUserByPseudo(login);
		}
		if (user == null || !user.getMot_de_passe().equals(mdp)) {
			be = new BusinessException();
			be.ajouterErreur(CodesResultatBLL.LOGIN_KO);
		}
		if (be != null) {
			throw be;
		}
		return user;
	}

	public void checkInsertUtilisteur(Utilisateur user) throws BusinessException {
		BusinessException be = new BusinessException();

		checkPseudo(user.getPseudo(), be);
		checkMail(user.getEmail(), be);
		checkNom(user.getNom(), be);
		checkPrenom(user.getPrenom(), be);
		checkTel(user.getTelephone(), be);
		checkRue(user.getRue(), be);
		checkVille(user.getVille(), be);
		checkCP(user.getCode_postal(), be);
		checkMdp(user.getMot_de_passe(), be);

		if (!be.hasErreurs()) {
			daoUser.inserUtilisateur(user);
		} else {
			throw be;
		}

	}

	public void updateUser(Utilisateur user) throws ClassNotFoundException, BusinessException{
		BusinessException be = new BusinessException();
		if (user.getPseudo().length() < 30 && user.getNom().length() < 30 &&
				  user.getPrenom().length() < 30 && user.getEmail().length() < 50 &&
				  user.getEmail().contains("@") && user.getTelephone().length() < 15 &&
				  user.getRue().length() < 30 && user.getCode_postal().length() < 10 &&
				  user.getVille().length() < 30 && user.getMot_de_passe().length() < 30) {
				  
				  daoUser.modifierUtilisateur(user);
				  } else{ 
			      be = new BusinessException();
				  be.ajouterErreur(CodesResultatBLL.INFOS_KO); 
				  
				  }
		 
	}

	public void deleteUser(Utilisateur user) throws BusinessException {
		daoUser.supprimerUtilisateur(user);

	}

	// ------------------------------- METHODES DE CONTROLE -----------------------------------------
	
	private void checkPseudo(String pseudo, BusinessException be) throws BusinessException {

		if (!pseudo.matches(STRING_PSEUDO) || pseudo.length() > 30) {
			be.ajouterErreur(CodesResultatBLL.PSEUDO_KO);
		} else {
			Utilisateur test = daoUser.getUserByPseudo(pseudo);
			if (test != null && test.getPseudo() != null) {
				be.ajouterErreur(CodesResultatBLL.PSEUDO_USED);
			}
		}
	}

	private void checkMail(String mail, BusinessException be) throws BusinessException {
		if (!mail.matches(EMAIL_VERIFICATION) || mail.length() > 50) {
			be.ajouterErreur(CodesResultatBLL.EMAIL_KO);
		} else {
			Utilisateur test = daoUser.getUserByMail(mail);
			if (test != null && test.getEmail() != null) {
				be.ajouterErreur(CodesResultatBLL.EMAIL_USED);
			}
		}
	}

	private void checkNom(String nom, BusinessException be) throws BusinessException {
		if (!nom.matches(STRING_VERIFICATION) || nom.length() > 30) {
			be.ajouterErreur(CodesResultatBLL.NOM_KO);
		}
	}

	private void checkPrenom(String prenom, BusinessException be) throws BusinessException {
		if (!prenom.matches(STRING_VERIFICATION) || prenom.length() > 30) {
			be.ajouterErreur(CodesResultatBLL.PRENOM_KO);
		}
	}

	private void checkTel(String number, BusinessException be) throws BusinessException {
		if (!number.matches(CHECK_NUMBER) || number.length() > 30) {
			be.ajouterErreur(CodesResultatBLL.PHONE_KO);
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

	private void checkMdp(String mdp, BusinessException be) throws BusinessException {
		if (!mdp.matches(STRING_VERIFICATION) || mdp.length() > 30) {
			be.ajouterErreur(CodesResultatBLL.MDP_KO);
		}
	}

	public Utilisateur getUserById(Integer id) {
		Utilisateur userAfficher = daoUser.getUserById(id);
		return userAfficher;
	}

}
