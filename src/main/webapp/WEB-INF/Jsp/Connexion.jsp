<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"/>
<title>Login</title>
</head>
<body class="vh-100" style="background-color: #343a40;">
<c:if test="${!empty sessionScope.user}">
		<jsp:include page="/fragments/headerConnecte.jsp"/>
	</c:if>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/accueil">Eni-Encheres</a>
		</div>
	</nav>
	<div style="display: none;">
	<c:if test="${empty sessionScope.user}">
		<jsp:include page="/fragments/header.jsp"/>
	</c:if>
	</div>	
	
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

  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://images.pexels.com/photos/6077189/pexels-photo-6077189.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form method="post">

                  <div class="d-flex align-items-center mb-1 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span class="h2 fw-bold mb-0">Bienvenue sur Eni Enchères</span>
                  </div>

                  <h5 class="fw-normal mb-2 pb-3" style="letter-spacing: 1px;">Connectez-vous avec votre compte :</h5>

                  <div class="form-outline mb-3">
                  	<label class="form-label" for="login">Adresse mail ou pseudo :</label>
                    <input type="text" id="login" name="login" class="form-control form-control-lg" />  
                  </div>

                  <div class="form-outline">
                 	 <label class="form-label" for="mdp">Mot de passe</label>
                    <input type="password" id="mdp" name="mdp" class="form-control form-control-lg mb-2" />    
                  </div>

                  <div class="pt-1">
                    <button class="btn btn-dark btn-lg btn-block" type="submit" name="button" value ="connect">Connexion</button>
                  </div>
                  
                  <br>

                  <p class=" pb-lg-2" style="color: #393f81;">Vous n'en avez pas ? 
                    <button class="btn btn-dark btn-lg btn-block" type="submit" name="button" value = "create"  style="color: #FFF;">Créez votre compte içi !</button></p>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>