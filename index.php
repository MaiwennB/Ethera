<HTML>
    <head>
        <meta charset="utf-8">
        <?php include_once('connectBdd.php');
        include('select_joueur.php'); 
            
            include('select_aventurier.php'); 
        ?>

    </head>
    <body>
        <H1>Page 1</H1>
        <FORM action="affecterJoueur.php" method="post" enctype="multipart/form-data">
        <div>
            <libelle>Joueur : </libelle>
			<select name="listJoueur" id="listJoueur">
				<?php  
					foreach ($joueurs as $joueur) {
						echo('<option value="'.$joueur["idJoueur"].'">');
						echo $joueur["nom"];
						echo "</option>";
					}
				?>
			</select>
		</div>
        <div>
        <libelle>Aventurier : </libelle>
            <select name="listAventurier" id="listAventurier">
				<?php  
					foreach ($aventuriers as $aventurier) {
						echo('<option value="'.$aventurier["idAventurier"].'">');
						echo $aventurier["nom"];
						echo "</option>";
					}
				?>
			</select>
            <!---Créé aventurier :
            <libelle>Nom d'aventurier : </libelle>
			<input type="text" name="nomAvent"></input>
            <input type="submit" value="valider" name="Valider"></input>-->
            
		</div>
        <input type="submit" value="valider" name="Valider"></input>
        </FORM>
    </body>
</HTML>