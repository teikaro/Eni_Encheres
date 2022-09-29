<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"/>
<title>Vendre un article</title>
</head>
<body>
	<c:if test="${!empty sessionScope.user}">
		<jsp:include page="/fragments/headerConnecte.jsp"/>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<jsp:include page="/fragments/header.jsp"/>
	</c:if>
	<div>
		<img alt="Image Article" src="">
	</div>
	<div class = "form-group">
		<form name="form_article" action="" method="post">
			<div><label for="nom_article">Article : </label>
			<input type="text" id="id_nom_article" name="nom_article" required="required"></div>
			<div><label for="desc">Description : </label>
			<textarea id="id_desc" name="desc" rows="5" placeholder="Vous pouvez décrire votre article ici." required="required"></textarea></div>
			<div><label for="type">Catégorie : </label>
			<select name="type"
				id="type-select">
				<option value="informatique">Informatique</option>
				<option value="ameublement">Ameublement</option>
				<option value="vetement">Vêtement</option>
				<option value="sport">Sport et Loisirs</option>
			</select></div>
			<div><label for="prix_ini">Mise à prix</label>
			<input type="number" id="id_prix_ini" name="prix_ini" step="10"required="required"></div>
			<div><label for="date_start">Début de l'enchère</label>
			<input type="date" id="id_date_start" name="date_start"required="required"></div>
			<div><label for="date_end">Fin de l'enchère</label>
			<input type="date" id="id_date_end" name="date_end"required="required"></div>
			<fieldset>
				<legend>Retrait</legend>
				<div><label for="rue">Rue : </label>
				<input type="text" id="id_rue" name="rue" value="${user.rue}" required="required"></div>
				<div><label for="cp">Code postal : </label>
				<input type="text" id="id_cp" name="cp" value="${user.code_postal}" required="required"></div>
				<div><label for="ville">Ville : </label>
				<input type="text" id="id_ville" name="ville" value="${user.ville}" required="required"></div>
			</fieldset>
			 <button type="submit" name="button" class="btn btn-primary" value ="inser">Enregister</button>
             <a href="${pageContext.request.contextPath}/accueil" class="btn btn-primary">Annuler</a>
		</form>
	</div>
</body>
</html>