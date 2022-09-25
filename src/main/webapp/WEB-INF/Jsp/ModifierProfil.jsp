<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Modifier</title>
</head>
<body>
	<c:if test="${!empty sessionScope.user}">
		<jsp:include page="/fragments/headerConnecte.jsp"></jsp:include>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<jsp:include page="/fragments/header.jsp"></jsp:include>
	</c:if>
	<form name="form_modif" action="" method="post">
    	<div class="form-message">Modifier mon profil</div>
    		<div class="form-line">
    			<div class="form-label">
                	<label for="id-fld-name">Nom : </label>
                </div>
                <div class="form-field">
                	<input id="id-fld-name" name="fld-name" type="text" class="fld-field"  required="required" value="${user.nom}"/>
                </div>
                <div class="form-label">
                	<label for="id-fld-dateNaissance">Prénom : </label>
                </div>
                <div class="form-field">
                	<input id="id-fld-prenom" name="fld-prenom" type="text" class="fld-field"  required="required" value="${user.prenom}" />
                </div>
            </div>
            <div class="form-line">
            	<div class="form-label">
                	<label for="id-fld-pseudo">Pseudo : </label>
                </div>
                <div class="form-field">
                	<input id="id-fld-pseudo" name="fld-pseudo" type="text" class="fld-field" required="required" value="${user.pseudo}" />
                </div>
                <div class="form-label">
                	<label for="id-fld-email">Email : </label>
                </div>
                <div class="form-field">
                	<input id="id-fld-email" name="fld-email" type="text" class="fld-field" required="required" value="${user.email}" />
                </div>
            </div>
            <div class="form-line">
            	<div class="form-label">
            		<label for="id-fld-adresse">Adresse : </label>
            	</div>
            	<div class="form-field">
            		<input id="id-fld-adresse" name="fld-adresse" type="text" class="fld-field" required="required" value="${user.rue}" />
            	</div>
            	<div class="form-label">
            		<label for="id-fld-ville">Ville : </label>
            	</div>
            	<div class="form-field">
            		<input id="id-fld-ville" name="fld-ville" type="text" class="fld-field" required="required" value="${user.ville}"/>
            	</div>
            </div>
            <div class="form-line">
            	<div class="form-label">
            		<label for="id-fld-cp">Code postal : </label>
            	</div>
            	<div class="form-field">
            		<input id="id-fld-cp" name="fld-cp" type="text" class="fld-field" required="required" value="${user.code_postal}"/>
           		</div>
            	<div class="form-label">
            		<label for="id-fld-tel">Teléphone : </label>
            	</div>
            	<div class="form-field">
            		<input id="id-fld-tel" name="fld-tel" type="text" class="fld-field" required="required" value="${user.telephone}"/>
            	</div>
            </div>
			<div class="form-line">
				<div class="form-label">
                	<label for="old-id-fld-mdp">Ancien Mot de passe : </label>
                </div>
                <div class="form-field">
                	<input id="old-id-fld-mdp" name="old-fld-mdp" type="password" class="fld-field" required="required" />
                </div>
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
            <button type="submit" name="button" value ="modifier">Modifier mon profil</button>
            <button type="submit" name ="button" value = "supprimer">Supprimer mon profil</button>
			
	</form>
</body>
</html>