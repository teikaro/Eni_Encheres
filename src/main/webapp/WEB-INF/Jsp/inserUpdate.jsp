<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes Informations</title>
</head>
<body>
	<jsp:include page="/fragments/champsInserUpdate.html"></jsp:include>
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