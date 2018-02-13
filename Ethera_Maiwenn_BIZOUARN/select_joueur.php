<?php
// Requette de selection
$req = "SELECT idJoueur, nom FROM joueur";
$joueurs = $bdd->query($req);