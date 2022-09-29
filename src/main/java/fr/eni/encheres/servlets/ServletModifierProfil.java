package fr.eni.encheres.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bll.UtilisateurManager;
import fr.eni.encheres.bo.Utilisateur;


@WebServlet("/modifiermonprofil")
public class ServletModifierProfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
    public ServletModifierProfil() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilisateur user = (Utilisateur) request.getAttribute("user");
		request.setAttribute("user", user);
		request.getRequestDispatcher("WEB-INF/Jsp/ModifierProfil.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
		String button = request.getParameter("button");
		String pseudo = request.getParameter("fld-pseudo");
		String nom = request.getParameter("fld-name");
		String prenom = request.getParameter("fld-prenom");
		String email = request.getParameter("fld-email");
		String telephone = request.getParameter("fld-tel");
		String rue = request.getParameter("fld-adresse");
		String code_postal = request.getParameter("fld-cp");
		String ville = request.getParameter("fld-ville");
		String ancienMdp = request.getParameter("old-fld-mdp");
		String mdp = request.getParameter("fld-mdp");
		String confirmationMdp = request.getParameter("fld-mdp2");
		Integer userId = Integer.valueOf(request.getParameter("no_utilisateur"));
		
		if(button.equals("modifier")) {
			
			if(!ancienMdp.equals(mdp) && mdp.equals(confirmationMdp)) {
				
				user.setNo_utilisateur(userId);
				user.setPseudo(pseudo);
				user.setNom(nom);
				user.setPrenom(prenom);
				user.setEmail(email);
				user.setTelephone(telephone);
				user.setRue(rue);
				user.setCode_postal(code_postal);
				user.setVille(ville);
				if (!mdp.equals(null) && !confirmationMdp.equals(null)) {
					user.setMot_de_passe(confirmationMdp);
				} else {
					user.setMot_de_passe(user.getMot_de_passe());
				}
				user.setCredit(user.getCredit());
				user.setAdministrateur(user.isAdministrateur());
				
			}
		
			try {
				UtilisateurManager.getInstance().updateUser(user);
				request.getSession().setAttribute("user", user);
				response.sendRedirect(request.getContextPath() + "/accueil?no_utilisateur=" + user.getNo_utilisateur());	 
			} catch (ClassNotFoundException | BusinessException e) {
				
				e.printStackTrace();
			}
			
		 }
				
			  }
			 
	}