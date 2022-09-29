package fr.eni.encheres.servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bll.ArticleManager;
import fr.eni.encheres.bll.CategorieManager;
import fr.eni.encheres.bo.Articles;
import fr.eni.encheres.bo.Categories;
import fr.eni.encheres.bo.Retrait;
import fr.eni.encheres.bo.Utilisateur;

/**
 * Servlet implementation class ServletNouvelArticle
 */
@WebServlet("/NouvelArticle")
public class ServletNouvelArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Categories> types = CategorieManager.getInstance().listeCategories();
		//System.out.println(types.toString());
		
		//request.setAttribute("user", user);
		request.setAttribute("types", types);
		request.getRequestDispatcher("WEB-INF/Jsp/nouvelleVente.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String button = request.getParameter("button");
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");

		if (button.equals("inser")) {
			String nom = request.getParameter("nom_article");//System.out.println(nom);
			String description = request.getParameter("desc");//System.out.println(description);
			int categorie = Integer.parseInt(request.getParameter("type"));//System.out.println(categorie);
			int prixIni = Integer.parseInt(request.getParameter("prix_ini"));//System.out.println(prixIni);
			Date start = Date.valueOf(request.getParameter("date_start"));//System.out.println(start);
			Date fin = Date.valueOf(request.getParameter("date_end"));//System.out.println(fin);
			
			String rue = request.getParameter("rue");//System.out.println(rue);
			String cp = request.getParameter("cp");//System.out.println(cp);
			String ville = request.getParameter("ville");//System.out.println(ville);
			
			Articles article = new Articles();
			Retrait retrait = new Retrait();
			
			article.setNo_categorie(categorie);
			article.setNom_article(nom);
			article.setDescription(description);
			article.setPrix_initial(prixIni);
			article.setDate_debut_encheres(start);
			article.setDate_fin_encheres(fin);
			article.setNo_utilisateur(user.getNo_utilisateur());
			
			retrait.setCode_postal(cp);
			retrait.setRue(rue);
			retrait.setVille(ville);
			
			try {
				ArticleManager.getInstance().checkInsertAricle(article, retrait);
				response.sendRedirect("accueil");
			} catch (BusinessException e) {
				e.printStackTrace();
				request.setAttribute("listeCodesErreur", e.getListeCodesErreur());
				request.getRequestDispatcher("/WEB-INF/Jsp/nouvelleVente.jsp").forward(request, response);
			}
		}
	}

}
