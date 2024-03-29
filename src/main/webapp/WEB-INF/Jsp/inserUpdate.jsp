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
    		
    		<div class="container rounded bg-white mt-5 mb-5">
    		<div class="row">
        		<div class="col-md-3 border-right">
            		<div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5"
            		 width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            		<span class="font-weight-bold">${profil.pseudo}</span><span class="text-black-50">${profil.email}</span>
            		
            		</div>
            		
        		</div>
        		
        		<div class="col-md-5 border-right">
        		<div class="p-3 py-5">
                		<div class="d-flex justify-content-between align-items-center mb-3">
                    	<h4 class="text-right">Création de compte :</h4>
                	</div>
                	
            		<div class="p-3 py-5">
                		<div class="d-flex justify-content-between align-items-center mb-3">
                    	<h4 class="text-right">Mes informations</h4>
                	</div>
                	<div class="row mt-2">
                	
                		<div class="col-md-12">
                			<label for="id-fld-name">Nom : </label>
                        	<input id="id-fld-name" name="fld-name" type="text" class="form-control" required="required" placeholder="Votre nom ?">
                		</div>
                		
                    	<div class="col-md-12">
							<label for="id-fld-prenom">Prénom : </label>
                        	<input id="id-fld-prenom" name="fld-prenom" type="text" class="form-control" required="required" placeholder="Votre prenom ?"> 
						</div>
							
                    	<div class="col-md-12">
							<label for="id-fld-pseudo">Pseudo : </label>
                        <input id="id-fld-pseudo" name="fld-pseudo" type="text" class="form-control" required="required">			
                		</div>              
                	
                    	<div class="col-md-12">
							<label for="id-fld-email">Email : </label>
                        <input id="id-fld-email" name="fld-email" type="text" class="form-control" required="required" placeholder="john.doe@gmail.com">
						</div>
							
                    	<div class="col-md-12">
							<label for="id-fld-adresse">Adresse : </label>
                        <input id="id-fld-adresse" name="fld-adresse" type="text" class="form-control" required="required">
						</div>
						
                    	<div class="col-md-12">
							<label for="id-fld-ville">Ville : </label>
                        <input id="id-fld-ville" name="fld-ville" type="text" class="form-control" required="required">
						</div>
							
                    	<div class="col-md-12">
							<label for="id-fld-cp">Code postal : </label>
                        <input id="id-fld-cp" name="fld-cp" type="text" class="form-control" required="required">
						</div>
						
                    	<div class="col-md-12">
							<label for="id-fld-tel">Teléphone : </label>
                        <input id="id-fld-tel" name="fld-tel" type="text" class="form-control" required="required">
						</div>
						
						<div class="col-md-12">
							<label for="id-fld-mdp">Mot de passe : </label>
                        	<input id="id-fld-mdp" name="fld-mdp" type="password" class="form-control" required="required">
						</div>
						
						<div class="col-md-12">
							<label for="id-fld-mdp2">Confirmation : </label>
                        	<input id="id-fld-mdp2" name="fld-mdp2" type="password" class="form-control" required="required">
						</div>				
                	        	
                			<div class="mt-5 text-center">
                	
                				<button type="submit" name="button" class="btn btn-primary" value ="inser">Créer un compte</button>
                 				<a href="${pageContext.request.contextPath}/accueil" class="btn btn-primary">Annuler</a>

                	 		</div>
                	 
                		
                 	
            		</div>
            		
        		</div>
        		
        </div>	
        	
    		</div>
    		
		</div>
	</form>	
  </div>
</body>
</html>