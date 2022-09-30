<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"/>
<title>Détail de l'article</title>
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
	
	<div class="container py-5">
  <div class="row d-flex justify-content-center align-items-center">
    <div class="col">
      <div class="card my-4 shadow-3">
        <div class="row g-0">
          <div class="col-xl-6 d-xl-block bg-image">
            <img src="https://mdbcdn.b-cdn.net/img/Others/extended-example/delivery.webp" alt="Sample photo"
              class="img-fluid">
          </div>
          <div class="col-xl-6">
            <div class="card-body p-md-5 text-black">
              <h3 class="mb-4 text-uppercase">Détail de l'objet :</h3>
              
               
                  <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example1m">Nom :</label>
                    <input type="text" readonly="readonly" id="form3Example1m" class="form-control form-control-lg" placeholder="${article.nom_article}">
                  </div>  
                
                  <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example1m">Description :</label>
                    <textarea type="text" readonly="readonly" id="form3Example1m" class="form-control form-control-lg" placeholder="${article.description}"></textarea>
                  </div>

              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1m">Catégorie :</label>
                <input type="text" readonly="readonly" class="form-control form-control-lg" placeholder="${article.categorieArticle.libelle}">
              </div>


              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1m">Meilleure offre :</label>
                <input type="text" readonly="readonly" class="form-control form-control-lg" placeholder="${article.prix_vente}">
              </div>

              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1m">Prix initial :</label>
                <input type="text" readonly="readonly" class="form-control form-control-lg" placeholder="${article.prix_initial}">
              </div>
              
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1m">Date de fin de l'enchère :</label>
                <input type="text" readonly="readonly" class="form-control form-control-lg" placeholder="${article.date_fin_encheres}">
              </div>
              
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1m">Adresse de retrait :</label>
                <input type="text" readonly="readonly" class="form-control form-control-lg" placeholder="${article.lieuRetrait.rue} ${article.lieuRetrait.code_postal} ${article.lieuRetrait.ville}">
              </div>
              
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1m">Vendeur :</label>
                <input type="text" readonly="readonly" class="form-control form-control-lg" placeholder="${article.user.pseudo}">
              </div>

            </div>
            
          </div>
          
        </div>
        
      </div>
      
    </div>
    
  </div>
  
</div>

</body>

</html>