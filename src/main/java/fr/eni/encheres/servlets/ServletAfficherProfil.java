package fr.eni.encheres.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bll.UtilisateurManager;
import fr.eni.encheres.bo.Utilisateur;


@WebServlet("/profil")
public class ServletAfficherProfil extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
	
	public ServletAfficherProfil()
	{
		super();
	}
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Integer userId = Integer.valueOf(request.getParameter("no_utilisateur"));
	     Utilisateur profil = UtilisateurManager.getInstance().getUserById(userId);
	     request.setAttribute("profil", profil);
	     request.getRequestDispatcher("/WEB-INF/Jsp/AfficherProfil.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().getAttribute("user");
		//response.sendRedirect(request.getContextPath() + "/accueil?no_utilisateur=" + user.getNo_utilisateur());
		
}
}