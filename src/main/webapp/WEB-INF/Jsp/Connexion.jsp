<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"/>
<title>Login</title>
</head>
<body>
<c:if test="${!empty sessionScope.user}">
		<jsp:include page="/fragments/headerConnecte.jsp"/>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<jsp:include page="/fragments/header.jsp"/>
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
	<div class="container">
	<form method="post">
		<label for="login">Login</label>
		<input type="text" id="login" name="login"> 
		<label for="mdp">Mot de passe</label>
		<input type="password" id="mdp" name="mdp">
		<button type="submit" name="button" class="btn btn-primary" value ="connect">Se connecter</button>
		<button type="submit" name ="button" class="btn btn-primary" value = "create">Créer un compte</button>
	</form>
	</div>
</body>
</html>