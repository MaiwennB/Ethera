<?php
include_once('connectBdd.php');
$idJoueur = $_POST["listJoueur"];
$idAventurier = $_POST["listAventurier"];
// Requette de selection
$req = "UPDATE aventurier SET idJoueur =(:idJoueur) WHERE idAventurier =(:aventurierId)";
$stmt = $bdd->prepare($req);
$stmt->bindParam('idJoueur', $idJoueur);
$stmt->bindParam('aventurierId', $idAventurier);
if ($stmt->execute())
{
    echo $info = 'Suppression réussi';
    header('Location: index.php');
}
else
{
echo $info = 'Erreur lors de l afectation de l aventurier';
}
