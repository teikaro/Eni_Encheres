<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
<link href="css/NouvelleVente.css"   rel="stylesheet"  type="text/css">
</head>
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

			 
	<div class="container contact-form">
            <div class="contact-image">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>
            <form name="form_article" action="" method="post">
            
                <h3>Vendez un de vos objets !</h3>
                
               <div class="row">
               
                    <div class="col-md-8 col-sm-4 ">
                    
                        <div class="form-group">
                        	<label for="nom_article">Nom de votre objet : </label>
                            <input type="text" id="id_nom_article" name="nom_article" class="form-control" required="required" />
                        </div>
                        
                        <div class="form-group">
                    		<label for="desc">Description : </label>
                            <textarea id="id_desc" name="desc" class="form-control" required="required" style="width: 100%; height: 100px;"></textarea>
                        </div>
                        
                        <div class="form-group">
                        	<label for="type">Catégorie :</label>
                            <select name="type" id="type-select">
								<c:forEach var="categorie" items="${types}">
									<option value="${categorie.no_categorie}"><c:out value="${categorie.libelle}"/></option>
								</c:forEach>
							</select>
                        </div>
                        
                        <div class="form-group">
                        	<label for="prix_ini">Mise a prix : </label>
                            <input type="number" id="id_prix_ini" name="prix_ini" class="form-control" required="required">
                        </div>
                        
                        <div class="form-group">
                        	<label for="date_start">Début de l'enchère : </label>
                            <input type="date" id="id_date_start" name="date_start" class="form-control" required="required">
                        </div>
                        
                        <div class="form-group">
                        	<label for="date_end">Fin de l'enchère : </label>
                            <input type="date" id="id_date_end" name="date_end" class="form-control" required="required">
                        </div>
                        
                        <fieldset>
                        
							<legend>Retrait</legend>
							
							<div>
								<label for="rue">Rue : </label>
								<input type="text" id="id_rue" class="form-control" name="rue" value="${user.rue}" required="required">
							</div>
							
							<div>
								<label for="cp">Code postal : </label>
								<input type="text" id="id_cp" class="form-control" name="cp" value="${user.code_postal}" required="required">
							</div>
							
							<div class="mb-5">
								<label for="ville">Ville : </label>
								<input type="text" id="id_ville" class="form-control" name="ville" value="${user.ville}" required="required">
							</div>
							
						</fieldset>
                        
                            <div class="form-group  ">
                            	<button type="submit" name="button" class="btn btn-primary" value="inser">Ajouter votre objet aux enchères</button>
                            	<a href="${pageContext.request.contextPath}/accueil" class="btn btn-primary  m-3">Annuler</a>
							</div>
							
                    </div>
                    
                </div>
                
            </form>
            
		</div>


</body>
</html>