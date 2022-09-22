<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"></jsp:include>

<body class="container">
<c:if test="${!empty sessionScope.user}">
	<jsp:include page="/fragments/headerConnecte.jsp"></jsp:include>
</c:if>
<c:if test="${empty sessionScope.user}">
	<jsp:include page="/fragments/header.jsp"></jsp:include>
</c:if>
	<main>
				<div>
			<h1>Liste des enchères :</h1>
			
			<label for="site-search">Filtres :</label>
			<input type="search" id="site-search" name="q" placeholder="Le nom de l'article contient">

			<label for="site-search">Catégorie :</label>
			<select name="catégorie" id="categorie-select">
    			<option value="">Toutes</option>
    			<option value="dog">Informatique</option>
    			<option value="cat">Ameublement</option>
    			<option value="hamster">Vêtement</option>
    			<option value="parrot">Sport et Loisirs</option>
			</select>

			<button>Rechercher</button>
		</div>
		
		<jsp:include page="article.jsp"/>
	</main>
</body>

</html>