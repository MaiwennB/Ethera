-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 16 jan. 2018 à 12:57
-- Version du serveur :  10.0.31-MariaDB
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
--

DELIMITER $$
--
-- Procédures
--
$$

$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `aventurier`
--

CREATE TABLE `aventurier` (
  `idAventurier` int(3) NOT NULL,
  `idJoueur` int(3) NOT NULL,
  `idTerrain` int(3) NOT NULL,
  `nom` char(32) DEFAULT NULL,
  `vie` int(2) DEFAULT '100',
  `magie` int(2) DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `aventurier`
--

INSERT INTO `aventurier` (`idAventurier`, `idJoueur`, `idTerrain`, `nom`, `vie`, `magie`) VALUES
(1, 1, 5, 'Brandon Stark', 100, 100),
(3, 1, 5, 'Gandalf', 100, 100),
(4, 2, 3, 'George Clooney', 100, 100),
(5, 2, 3, 'Didier Deschamps', 100, 100),
(9, 1, 5, 'TestAventurier', 100, 100);

-- --------------------------------------------------------

--
-- Structure de la table `connaitre`
--

CREATE TABLE `connaitre` (
  `idAventurier` int(3) NOT NULL,
  `idSort` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `connaitre`
--

INSERT INTO `connaitre` (`idAventurier`, `idSort`) VALUES
(1, 1),
(3, 2),
(3, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `idJoueur` int(3) NOT NULL,
  `nom` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`idJoueur`, `nom`) VALUES
(1, 'joueur1'),
(2, 'joueur2'),
(3, 'TestProcédure');

-- --------------------------------------------------------

--
-- Structure de la table `objet`
--

CREATE TABLE `objet` (
  `idObjet` int(3) NOT NULL,
  `nom` char(32) NOT NULL,
  `genre` int(2) NOT NULL,
  `vie` int(2) DEFAULT NULL,
  `contenance` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `objet`
--

INSERT INTO `objet` (`idObjet`, `nom`, `genre`, `vie`, `contenance`) VALUES
(1, 'Oeuf de Dragon', 1, NULL, NULL),
(2, 'Anneau de Sauron', 1, NULL, NULL),
(5, 'raclette', 3, 10, NULL),
(6, 'chocolatine', 3, 2, NULL),
(9, 'sac à dos', 2, NULL, 10),
(10, 'sac banane', 2, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `idAventurier` int(3) NOT NULL,
  `idObjet` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `posseder`
--

INSERT INTO `posseder` (`idAventurier`, `idObjet`) VALUES
(1, 2),
(3, 5),
(3, 6),
(3, 10),
(5, 1),
(5, 10);

-- --------------------------------------------------------

--
-- Structure de la table `sort`
--

CREATE TABLE `sort` (
  `idSort` int(3) NOT NULL,
  `nom` char(32) DEFAULT NULL,
  `magie` char(32) DEFAULT NULL,
  `idObjet` int(3) DEFAULT NULL,
  `idTerrain` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sort`
--

INSERT INTO `sort` (`idSort`, `nom`, `magie`, `idObjet`, `idTerrain`) VALUES
(1, 'dévastation', '10000', 2, 5),
(2, 'boule lumineuse', '1', NULL, 5),
(4, 'métamorphose en mouton', '10', NULL, 3),
(5, 'omelette', '2', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `terrain`
--

CREATE TABLE `terrain` (
  `idTerrain` int(3) NOT NULL,
  `nom` char(32) NOT NULL,
  `genre` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `terrain`
--

INSERT INTO `terrain` (`idTerrain`, `nom`, `genre`) VALUES
(2, 'forêt hantée', 1),
(3, 'forêt enchantée', 1),
(4, 'montagnes du Sud', 2),
(5, 'montagnes du Nord', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aventurier`
--
ALTER TABLE `aventurier`
  ADD PRIMARY KEY (`idAventurier`),
  ADD KEY `I_FK_aventurier_joueur` (`idJoueur`),
  ADD KEY `I_FK_aventurier_terrain` (`idTerrain`);

--
-- Index pour la table `connaitre`
--
ALTER TABLE `connaitre`
  ADD PRIMARY KEY (`idAventurier`,`idSort`),
  ADD KEY `I_FK_connaitre_aventurier` (`idAventurier`),
  ADD KEY `I_FK_connaitre_sort` (`idSort`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`idJoueur`);

--
-- Index pour la table `objet`
--
ALTER TABLE `objet`
  ADD PRIMARY KEY (`idObjet`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`idAventurier`,`idObjet`),
  ADD KEY `I_FK_posseder_aventurier` (`idAventurier`),
  ADD KEY `I_FK_posseder_objet` (`idObjet`);

--
-- Index pour la table `sort`
--
ALTER TABLE `sort`
  ADD PRIMARY KEY (`idSort`),
  ADD UNIQUE KEY `I_FK_sort_objet` (`idObjet`),
  ADD KEY `I_FK_sort_terrain` (`idTerrain`);

--
-- Index pour la table `terrain`
--
ALTER TABLE `terrain`
  ADD PRIMARY KEY (`idTerrain`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aventurier`
--
ALTER TABLE `aventurier`
  MODIFY `idAventurier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `idJoueur` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `objet`
--
ALTER TABLE `objet`
  MODIFY `idObjet` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `posseder`
--
ALTER TABLE `posseder`
  MODIFY `idAventurier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `sort`
--
ALTER TABLE `sort`
  MODIFY `idSort` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `terrain`
--
ALTER TABLE `terrain`
  MODIFY `idTerrain` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aventurier`
--
ALTER TABLE `aventurier`
  ADD CONSTRAINT `FK_aventurier_joueur` FOREIGN KEY (`idJoueur`) REFERENCES `joueur` (`idJoueur`),
  ADD CONSTRAINT `FK_aventurier_terrain` FOREIGN KEY (`idTerrain`) REFERENCES `terrain` (`idTerrain`);

--
-- Contraintes pour la table `connaitre`
--
ALTER TABLE `connaitre`
  ADD CONSTRAINT `FK_connaitre_aventurier` FOREIGN KEY (`idAventurier`) REFERENCES `aventurier` (`idAventurier`),
  ADD CONSTRAINT `FK_connaitre_sort` FOREIGN KEY (`idSort`) REFERENCES `sort` (`idSort`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `FK_posseder_aventurier` FOREIGN KEY (`idAventurier`) REFERENCES `aventurier` (`idAventurier`),
  ADD CONSTRAINT `FK_posseder_objet` FOREIGN KEY (`idObjet`) REFERENCES `objet` (`idObjet`);

--
-- Contraintes pour la table `sort`
--
ALTER TABLE `sort`
  ADD CONSTRAINT `FK_sort_objet` FOREIGN KEY (`idObjet`) REFERENCES `objet` (`idObjet`),
  ADD CONSTRAINT `FK_sort_terrain` FOREIGN KEY (`idTerrain`) REFERENCES `terrain` (`idTerrain`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
