<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"></jsp:include>
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

<title>Mon profil </title>
</head>

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
	<div class="container rounded bg-white mt-5 mb-5">
    		<div class="row">
        		<div class="col-md-3 border-right">
            		<div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            		<span class="font-weight-bold">${profil.pseudo}</span><span class="text-black-50">${profil.email}</span>
            		</div>
        		</div>
        		<div class="col-md-5 border-right">
            		<div class="p-3 py-5">
                		<div class="d-flex justify-content-between align-items-center mb-3">
                    	<h4 class="text-right">Mon Profil</h4>
                		</div>
                	<div class="row mt-2">
                		<div class="col-md-12">
                		<label class="labels">Pseudo</label>
                		<input type="text" readonly="readonly" class="form-control" placeholder="${profil.pseudo}"
                		></div>
                		
                    	<div class="col-md-12">
							<label class="labels">Nom</label>
							<input type="text" readonly="readonly" class="form-control" placeholder="${profil.nom}">
						</div>
							
                    	<div class="col-md-12">
							<label class="labels">Prénom</label>
							<input type="text" readonly="readonly" class="form-control" placeholder="${profil.prenom}"></div>			
                		</div>
                	
                	<div class="row mt-3">
                	
                    	<div class="col-md-12">
							<label class="labels">Adresse Email</label>
							<input type="text" readonly="readonly" class="form-control" placeholder="${profil.email}">
						</div>
							
                    	<div class="col-md-12">
							<label class="labels">Numero de téléphone</label>
							<input type="text" readonly="readonly" class="form-control" placeholder="${profil.telephone}">
						</div>
						
                    	<div class="col-md-12">
							<label class="labels">Rue</label>
							<input type="text" readonly="readonly" class="form-control" placeholder="${profil.rue}">
						</div>
							
                    	<div class="col-md-12">
							<label class="labels">Code postal</label>
							<input type="text" readonly="readonly" class="form-control" placeholder="${profil.code_postal}">
						</div>
						
                    	<div class="col-md-12">
							<label class="labels">Ville</label>
							<input type="text" readonly="readonly" class="form-control" placeholder="${profil.ville}">
						</div>
						
                	</div>
                	
                	
                  	<c:if test="${profil.no_utilisateur == user.no_utilisateur}"> 
                  	
                		<form method="post" action="">
                	
                			<div class="mt-5 text-center">
                	
                				<button type="submit" id="button-modifier" class="btn btn-primary profile-button col-md-4 col-sm-2 mt-2 mb-2">
                	
                	 				<a id="lien-modifier" class="text-white" href="${pageContext.request.contextPath}/modifiermonprofil?no_utilisateur=${user.no_utilisateur}">Modifier le profil</a>  
                	 				
                	 				</button>                                               
                	 				<button type="submit" class="btn btn-primary profile-button col-md-5 col-sm-2" style="cursor: pointer;" name ="button" value = "supprimer">Supprimer mon profil</button>
                	 
                	 			
                	 
                	 		</div>
                	 
                		</form>	
                	
                 	</c:if> 
                 	
            		</div>
            		
        		</div>
    		</div>
		</div>
</body>
</html>