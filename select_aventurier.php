<?php
// Requette de selection
$sql = "SELECT idAventurier, nom FROM aventurier WHERE idJoueur = null";
$aventuriers = $bdd->query($sql);