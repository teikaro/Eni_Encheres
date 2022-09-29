package fr.eni.encheres.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.encheres.bll.ArticleManager;
import fr.eni.encheres.bll.CategorieManager;
import fr.eni.encheres.bo.Articles;
import fr.eni.encheres.bo.Categorie;

@WebServlet("/accueil")
public class AccueilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public AccueilServlet() {
       super();
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    		//Categorie categorie = CategorieManager.getInstance().selectLibelle();
    		List<Articles> liste = ArticleManager.getInstance().selectVentesEnCours(); 
    		
    		request.setAttribute("liste", liste);
    		request.getRequestDispatcher("/WEB-INF/Jsp/accueil.jsp").forward(request, response);
		}
    
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().getAttribute("user");
		doGet(request, response);
	}

}
