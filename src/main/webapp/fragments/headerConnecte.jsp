<header >
	<!--  <div class="container text-left text-black">
		<h1>Eni-Encheres</h1>
	</div>
	<div class="contaner text-right">
		<a href="#">Enchères</a>
		<a href="#">Vendre un article</a>
		<a href="#">Mon profil</a>
		<a href="${pageContext.request.contextPath}/logout">Déconnexion</a>
	</div>-->
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/accueil">Eni-Encheres</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">Enchères<span class="sr-only">(current)</span></a></li>
					<li class="nav-item active">
						<a class="nav-link" href="${pageContext.request.contextPath}/NouvelArticle">Vendre un article</a></li>
					<li class="nav-item active">
						<a class="nav-link" href="${pageContext.request.contextPath}/profil?no_utilisateur=${user.no_utilisateur}">Mon profil</a></li>
					<li class="nav-item active">
						<a class="nav-link" href="${pageContext.request.contextPath}/logout">Déconnexion</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>