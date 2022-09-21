<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes Informations</title>
</head>
<body>
	<div id="modal-dialog-form" class="dialog-form" title="Mes infos">
		<h2>ENI-Enchères</h2>
		
		<form name="form_compte" action="" method="post">
                <div class="form-message">Mes Informations</div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-name">Nom : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-name" name="fld-name" type="text" class="fld-field" required="required" placeholder="Votre nom ?" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-dateNaissance">Prénom : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-prenom" name="fld-prenom" type="text" class="fld-field" required="required" placeholder="Votre prenom ?" />
                    </div>
                </div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-pseudo">Pseudo : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-pseudo" name="fld-pseudo" type="text" class="fld-field" required="required" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-email">Email : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-email" name="fld-email" type="text" class="fld-field" required="required" placeholder="john.doe@gmail.com" />
                    </div>
                </div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-adresse">Adresse : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-adresse" name="fld-adresse" type="text" class="fld-field" required="required" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-ville">Ville : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-ville" name="fld-ville" type="text" class="fld-field" required="required" />
                    </div>
                </div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-cp">Code postal : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-cp" name="fld-cp" type="text" class="fld-field" required="required" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-tel">Teléphone : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-tel" name="fld-tel" type="text" class="fld-field" required="required" />
                    </div>
                </div>
                <div class="form-line">
                    <div class="form-label">
                        <label for="id-fld-mdp">Mot de passe : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-mdp" name="fld-mdp" type="password" class="fld-field" required="required" />
                    </div>
                    <div class="form-label">
                        <label for="id-fld-mdp2">Confirmation : </label>
                    </div>
                    <div class="form-field">
                        <input id="id-fld-mdp2" name="fld-mdp2" type="password" class="fld-field" required="required" />
                    </div>
                </div>
                 <button type="submit" name="button" value ="inser">Créer un compte</button>
				 <button type="reset" name ="button" value = "reset">Annuler</button>   
    		</form>
	</div>
</body>
</html>