<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"/>
<title>Détail de l'article</title>
</head>
<body>
	<c:if test="${!empty sessionScope.user}">
		<jsp:include page="/fragments/headerConnecte.jsp"></jsp:include>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<jsp:include page="/fragments/header.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty listeCodesErreur}">
		<div class="alert alert-danger" role="alert">
			<strong>Erreur!</strong>
			<ul>
			<c:forEach var="code" items="${listeCodesErreur}">
			  <li>${LecteurMessage.getMessageErreur(code)}</li>
			</c:forEach>
			</ul>
		</div>
	</c:if>
	<main>
		<div class="container">
			<h1>Détail vente</h1>
			
			<!--  <div id="image">
				<img alt="Image Article" src="">
			</div>-->
			
			<div id="detail">
				<p><!--Nom de l'article  --> ${article.nom_article}</p>
				<p>Description :  ${article.description}</p>
				<p>Catégorie : ${article.categorieArticle.libelle}</p>
				<p>Meilleure offre : ${article.prix_vente}</p>
				<p>Prix initial : ${article.prix_initial}</p>
				<p>Date de fin de l'enchère : ${article.date_fin_encheres}</p>
				<p>Adresse de retrait : ${article.lieuRetrait.rue} ${article.lieuRetrait.code_postal} ${article.lieuRetrait.ville}</p>
				<p>Vendeur : ${article.user.pseudo}</p>
				
			</div>
		</div>
	</main>
</body>
</html>