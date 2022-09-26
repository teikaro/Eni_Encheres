<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"/>
<title>Créer son Profil</title>
</head>
<body>
<div id="modal-dialog-form" class="dialog-form" title="Mes infos">
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
		
		<form name="form_compte" action="" method="post">
                <div class="form-message">Mes Informations</div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-name">Nom : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-name" name="fld-name" type="text" class="fld-field" required="required" placeholder="Votre nom ?" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-prenom">Prénom : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-prenom" name="fld-prenom" type="text" class="fld-field" required="required" placeholder="Votre prenom ?" />
                    </div>
                </div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-pseudo">Pseudo : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-pseudo" name="fld-pseudo" type="text" class="fld-field" required="required" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-email">Email : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-email" name="fld-email" type="text" class="fld-field" required="required" placeholder="john.doe@gmail.com" />
                    </div>
                </div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-adresse">Adresse : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-adresse" name="fld-adresse" type="text" class="fld-field" required="required" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-ville">Ville : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-ville" name="fld-ville" type="text" class="fld-field" required="required" />
                    </div>
                </div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-cp">Code postal : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-cp" name="fld-cp" type="text" class="fld-field" required="required" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-tel">Teléphone : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-tel" name="fld-tel" type="text" class="fld-field" required="required" />
                    </div>
                </div>
				<div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-mdp">Mot de passe : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-mdp" name="fld-mdp" type="password" class="fld-field" required="required" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-mdp2">Confirmation : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-mdp2" name="fld-mdp2" type="password" class="fld-field" required="required" />
                    </div>
                </div>
                 <button type="submit" name="button" class="btn btn-primary" value ="inser">Créer un compte</button>
                 <a href="${pageContext.request.contextPath}/accueil" class="btn btn-primary">Annuler</a>
    		</form>
	</div>
</body>
</html>