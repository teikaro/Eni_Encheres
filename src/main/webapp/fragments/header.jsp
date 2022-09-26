<header >
	<!-- <div class="container text-left text-black">
		<h1>Eni-Encheres</h1>
	</div>
	<div class="contaner text-right">
		<a href="${pageContext.request.contextPath}/login">Se connecter</a>
		<a href="${pageContext.request.contextPath}/NouvelUtilisateur">S'inscrire</a>
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
						<a class="nav-link" href="${pageContext.request.contextPath}/login">Se connecter<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/NouvelUtilisateur">S'inscrire</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>