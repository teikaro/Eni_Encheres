package fr.eni.encheres.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bll.ArticleManager;
import fr.eni.encheres.bll.EnchereManager;
import fr.eni.encheres.bo.Articles;

/**
 * Servlet implementation class ServletDetailArticle
 */
@WebServlet("/detailArticle")
public class ServletDetailArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idArticle = Integer.valueOf(request.getParameter("no_article"));
		ArticleManager articleManager = new ArticleManager();
        //EnchereManager enchereManager = new EnchereManager();
        Articles article = new Articles();

        //Récupération de l'article par le noArticle
        try {
           article = articleManager.selectByNoArticle(idArticle);
        } catch (BusinessException ex) {
            ex.printStackTrace();
            request.setAttribute("listeCodesErreur", ex.getListeCodesErreur());
            request.getRequestDispatcher("/accueil").forward(request, response);
        }
        //System.out.println(article.toString());
        request.setAttribute("article", article);
        
        request.getRequestDispatcher("/WEB-INF/Jsp/detailArticle.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
