<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="/fragments/head.jsp"/>
<title>Accueil</title>
</head>
<body>
	<c:if test="${!empty sessionScope.user}">
		<jsp:include page="/fragments/headerConnecte.jsp"/>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<jsp:include page="/fragments/header.jsp"/>
	</c:if>
	<main>
		<div class="container">
			<h1>Liste des enchères :</h1>

			<label for="site-search">Filtres :</label> <input type="search"
				id="site-search" name="q" placeholder="Le nom de l'article contient">

			<label for="site-search">Catégorie :</label> <select name="catégorie"
				id="categorie-select">
				<option value="">Toutes</option>
				<option value="informatique">Informatique</option>
				<option value="ameublement">Ameublement</option>
				<option value="vetement">Vêtement</option>
				<option value="sport">Sport et Loisirs</option>
			</select>

			<button class="btn btn-primary">Rechercher</button>
		</div>

<c:if test="${!empty sessionScope.user}">

            <form class="filtreForm" action="${pageContext.request.contextPath}/accueil" method="post" id="formradio" style="margin-top: 25px; position: relative; left: 320px;">
            
                <input type="hidden" name="form" value="form"/>
                
                <fieldset id="check" style="display: inline;">
                
                    <legend>Enchères</legend>
                    
                    <div style="margin-left: 30px;">
                        <input type="radio" id="encheres_ouvertes" name="check" value="encheres_ouvertes"/>
                        <label for="encheres_ouvertes">Ouvertes</label>
                    </div>

                    <div style="margin-left: 30px;">
                        <input type="radio" id="mes_encheres_en_cours" name="check" value="mes_encheres_en_cours"/>
                        <label for="mes_encheres_en_cours">En cours</label>
                    </div>

                    <div style="margin-left: 30px;">
                        <input type="radio" id="mes_encheres_remportees" name="check" value="mes_encheres_remportees"/>
                        <label for="mes_encheres_remportees">Remportées</label>
                    </div>
                    
                </fieldset>
                
                <fieldset style="display: inline;">

                    <legend>Mes ventes</legend>
                    
                    <div style="margin-left: 30px;">
                        <input type="radio" id="mes_ventes_en_cours" name="check" value="mes_ventes_en_cours"/>
                        <label for="mes_ventes_en_cours">En cours</label>
                    </div>

                    <div style="margin-left: 30px;">
                        <input type="radio" id="ventes_non_debutees" name="check" value="ventes_non_debutees"/>
                        <label for="ventes_non_debutees">Non débutées</label>
                    </div>

                    <div style="margin-left: 30px;">
                        <input type="radio" id="ventes_terminees" name="check" value="ventes_terminees"/>
                        <label for="ventes_terminees">Terminées</label>
                    </div>
                    
                </fieldset>
                
            </form>
            
</c:if>	

		<jsp:include page="article.jsp" />
	</main>
</body>

</html>