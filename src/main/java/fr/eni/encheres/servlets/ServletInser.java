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

/**
 * Servlet implementation class ServletInser
 */
@WebServlet("/NouvelUtilisateur")
public class ServletInser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/Jsp/inserUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String button = request.getParameter("button");

		if (button.equals("inser")) {
			String nom = request.getParameter("fld-name");
			String prenom = request.getParameter("fld-prenom");
			String pseudo = request.getParameter("fld-pseudo");
			String adresse = request.getParameter("fld-adresse");
			String email = request.getParameter("fld-email");
			String ville = request.getParameter("fld-ville");
			String cp = request.getParameter("fld-cp");
			String telephone = request.getParameter("fld-tel");
			String mdp = request.getParameter("fld-mdp");
			String mdp2 = request.getParameter("fld-mdp2");

			Utilisateur user = new Utilisateur();

			if (mdp.equals(mdp2)) {

				user.setPseudo(pseudo);
				user.setNom(nom);
				user.setPrenom(prenom);
				user.setEmail(email);
				user.setTelephone(telephone);
				user.setRue(adresse);
				user.setCode_postal(cp);
				user.setVille(ville);
				user.setMot_de_passe(mdp);
				user.setCredit(0);
				user.setAdministrateur(false);

				//System.out.println(user);

				try {
					UtilisateurManager.getInstance().checkInsertUtilisteur(user);
					request.getSession().setAttribute("user", user);
					response.sendRedirect("accueil");
				} catch (BusinessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					request.setAttribute("listeCodesErreur", e.getListeCodesErreur());
					request.getRequestDispatcher("/WEB-INF/Jsp/inserUpdate.jsp").forward(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else if (button.equals("reset")) {
			response.sendRedirect("accueil");
		}
	}
}
