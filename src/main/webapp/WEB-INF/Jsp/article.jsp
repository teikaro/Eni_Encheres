<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

</head>

<body>

<div class="row mx-auto p-5" style="max-width: 1280px;">
		
			<c:forEach var ="article" items="${liste}">
				<div class="card mb-4 mx-auto" style="width: 600px;">
				<img class="card-img" src="https://www.w3.org/html/logo/downloads/HTML5_sticker.png" style="width: 600px; height: 150px;" alt="Card image cap">	 
				      <div class="card-body"> 
				        <h5 class="card-title"><a href=""><c:out value="${article.nom_article}"/></a> </h5>
				       		 <p class="card-text"> Prix : ${article.prix_initial} points </p>
				          <p class="card-text"> Fin de l'enchère le : ${article.date_fin_encheres}</p> 
				        <p class="card-text"> Vendeur : <a href="${pageContext.request.contextPath}/profil?no_utilisateur=${article.no_utilisateur}">${article.user.pseudo}</a>  </p>
				  </div>
				</div>
			</c:forEach>

		<c:if test="${empty liste}">
			<h3 class="text-center p-5"> Aucune enchère actuellement en cours !</h3>
		</c:if>
	</div>

    		
</body>

</html>
