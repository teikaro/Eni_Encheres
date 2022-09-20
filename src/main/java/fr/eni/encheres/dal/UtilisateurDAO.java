package fr.eni.encheres.dal;

import fr.eni.encheres.bo.Utilisateur;

public interface UtilisateurDAO {

	Utilisateur getUserByMail(String login);

	Utilisateur getUserByPseudo(String login);

}
