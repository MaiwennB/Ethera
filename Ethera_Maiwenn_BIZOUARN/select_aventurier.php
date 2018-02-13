<?php
// Requette de selection
$sql = "SELECT idAventurier, nom FROM aventurier WHERE `idJoueur` IS NULL";
$aventuriers = $bdd->query($sql);