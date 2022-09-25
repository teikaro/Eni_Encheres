<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>

/*css provisoire*/
.container {

	 text-align:center;


} 
	.container-profil {
	    display : flex;
	    flex-direction : column;
	    justify-content : center;
	    align-items : center;
	    border : 1px solid #000;
	    margin-bottom : 10px;
	 
	}
	
	.champs {
		display : flex;	
		justify-content : flex-start;
	}
	
	#button-modifier{
	
    margin: 0 auto;
    
	}
	#lien-modifier{
	 text-decoration : none;
	 color : #000;
	}
	
	#lien-modifier:visited{
		text-decoration : none;
		color:#000;
	}
		

</style>
<meta charset="UTF-8">
<title>Affichage du profil </title>
</head>
<body>
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
	<c:if test="${!empty sessionScope.user}">
		<jsp:include page="/fragments/headerConnecte.jsp"></jsp:include>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<jsp:include page="/fragments/header.jsp"></jsp:include>
	</c:if>
	<div class="container">
			<p >Profil de ${profil.pseudo}</p>
		<div class="container-profil">
			<div class="champs">
				<p>Pseudo : </p>
				<p class="info-user" id="pseudo"> ${profil.pseudo}</p>
			</div>
			<div class="champs">
				<p>Nom : </p>
				<p class="info-user" id="nom">${profil.nom}</p>
			</div>
			<div class="champs">
				<p>Prenom : </p>
				<p class="info-user" id="prenom">${profil.prenom}</p>
			</div>
			<div class="champs">
				<p>email : </p>
				<p class="info-user" id="email">${profil.email}</p>
			</div>
			<div class="champs">
				<p>Téléphone : </p>
				<p class="info-user" id="telephone">${profil.telephone}</p>
			</div>
			<div class="champs">
				<p>Rue : </p>
				<p class="info-user" id="rue">${profil.rue}</p>
			</div>
			<div class="champs">
				<p>Téléphone : </p>
				<p class="info-user" id="code-postal">${profil.code_postal}</p>
			</div>
			<div class="champs">
				<p>Ville :  </p>
				<p class="info-user" id="ville">${profil.ville}</p>
			</div>
		</div>
		<c:if test="${profil.no_utilisateur == user.no_utilisateur}">
		<form method="post" action="">
			<button type="submit" class="btn btn-primary" id="button-modifier"><a id="lien-modifier" href="${pageContext.request.contextPath}/modifiermonprofil?no_utilisateur=${user.no_utilisateur}">Modifier</a></button>
		</form>	
		</c:if>
	</div>
</body>
</html>