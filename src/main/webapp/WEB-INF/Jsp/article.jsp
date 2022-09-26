
<form class="filtreForm"
	action="${pageContext.request.contextPath}/accueil" method="post"
	id="formradio">

	<input type="hidden" name="form" value="form" />

	<fieldset id="check">

		<legend>Enchères</legend>

		<div>

			<input type="radio" id="encheres_ouvertes" name="check"
				value="encheres_ouvertes" /> <label for="encheres_ouvertes">Ouvertes</label>

		</div>

		<div>

			<input type="radio" id="mes_encheres_en_cours" name="check"
				value="mes_encheres_en_cours" /> <label for="mes_encheres_en_cours">En
				cours</label>

		</div>

		<div>

			<input type="radio" id="mes_encheres_remportees" name="check"
				value="mes_encheres_remportees" /> <label
				for="mes_encheres_remportees">Remportées</label>

		</div>

	</fieldset>



	<fieldset>

		<legend>Mes ventes</legend>

		<div>

			<input type="radio" id="mes_ventes_en_cours" name="check"
				value="mes_ventes_en_cours" /> <label for="mes_ventes_en_cours">En
				cours</label>

		</div>

		<div>

			<input type="radio" id="ventes_non_debutees" name="check"
				value="ventes_non_debutees" /> <label for="ventes_non_debutees">Non
				débutées</label>

		</div>

		<div>

			<input type="radio" id="ventes_terminees" name="check"
				value="ventes_terminees" /> <label for="ventes_terminees">Terminées</label>

		</div>

	</fieldset>

</form>
