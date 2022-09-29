<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Modifier mes informations</title>
</head>
<body>
	<c:if test="${!empty sessionScope.user}">
		<jsp:include page="/fragments/headerConnecte.jsp"></jsp:include>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<jsp:include page="/fragments/header.jsp"></jsp:include>
	</c:if>

	<form name="form_modif" action="" method="post">
	
	<div class="container rounded bg-white mt-5 mb-5">
	
    		<div class="row">
    		
        		<div class="col-md-3 border-right">
        		
            		<div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px"
            		 src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            		<span class="font-weight-bold" value="${profil.pseudo}"></span><span class="text-black-50" value="${profil.email}"></span>
            		</div>
        		</div>
        		<div class="col-md-5 border-right">
            		<div class="p-3 py-5">
                		<div class="d-flex justify-content-between align-items-center mb-3">
                		
                    	<h4 class="text-right">Modifier mon Profil</h4>
                		</div>
                		
                		
                	<div class="row mt-2">
                	
                		<div class="col-md-12">
                			<label for="id-fld-name" class="labels">Nom</label>
                			<input type="text" id="id-fld-name" name="fld-name" class="form-control" required="required" value="${user.nom}">
                		</div>
                		
                    	<div class="col-md-12">
                    		<label for="id-fld-prenom" class="labels">Prénom</label>
                    		<input type="text" id="id-fld-prenom" name="fld-prenom" class="form-control" required="required" value="${user.prenom}">
                    	</div>
                    	
                		<div class="col-md-12">
                			<label for="id-fld-pseudo" class="labels">Pseudo</label>
                			<input type="text" id="id-fld-pseudo" name="fld-pseudo" class="form-control" required="required" value="${user.pseudo}">
                		</div>
                		
                	</div>
                	
                	<div class="row mt-3">
                	
                    	<div class="col-md-12">
                    		<label for="id-fld-email" class="labels">Adresse Email</label>
                    		<input type="text" id="id-fld-email" name="fld-email" class="form-control" required="required" value="${user.email}">
                    	</div>
                    	
                    	<div class="col-md-12">
							<label for="id-fld-adresse" class="labels">Adresse</label>
							<input type="text" id="id-fld-adresse" name="fld-adresse" class="form-control" required="required" value="${user.rue}">
						</div>
                    	
                    	<div class="col-md-12">
							<label for="id-fld-ville" class="labels">Ville</label>
							<input type="text" id="id-fld-ville" name="fld-ville" class="form-control" required="required" value="${user.ville}">
						</div>
                    	
                    	<div class="col-md-12">
							<label for="id-fld-cp" class="labels">Code postal</label>
							<input type="text" id="id-fld-cp" name="fld-cp" class="form-control" required="required" value="${user.code_postal}">
						</div>
                    	
                    	<div class="col-md-12">
							<label for="id-fld-tel" class="labels">Numero de téléphone</label>
							<input type="text" id="id-fld-tel" name="fld-tel" class="form-control" required="required" value="${user.telephone}">
						</div>
                    	
                    	<div class="col-md-12">
							<label  for="old-id-fld-mdp" class="labels">Ancien mot de passe</label>
							<input type="password" class="form-control" id="old-id-fld-mdp" name="old-fld-mdp" required="required" />
						</div>
                    	
                    	<div class="col-md-12">
							<label for="id-fld-mdp" class="labels">Mot de passe</label>
							<input  type="password" class="form-control"  id="id-fld-mdp" name="fld-mdp"required="required">
						</div>
                    	
                    	<div class="col-md-12">
							<label for="id-fld-mdp2" class="labels">Confirmation</label>
							<input type="password" class="form-control" id="id-fld-mdp2" name="fld-mdp2" required="required">
						</div>
                    	
                	</div>
                	
                	 	<button type="submit" class="btn btn-primary mt-3" name="button" value ="modifier">Modifier mon profil</button>  
                	 				                                           
                	</div>
                 	
            	</div>
            		
        	</div>
        	
    	</div>
    	
	</form>
	
</body>

</html>