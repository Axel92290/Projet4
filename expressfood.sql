-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 12 oct. 2022 à 07:39
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `ID` int NOT NULL,
  `adresse` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `codePostal` int NOT NULL,
  `Ville` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Pays` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lattitude` decimal(10,0) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `utilisateurID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FOREIGN` (`utilisateurID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`ID`, `adresse`, `codePostal`, `Ville`, `Pays`, `lattitude`, `longitude`, `utilisateurID`) VALUES
(2, '4 Allée des champs', 75012, 'Paris', 'France', '27', '10', 2),
(4, '78 rue de montmartre', 75018, 'Paris', 'France', '45', '8', 4),
(6, '27 Allée rieu', 75004, 'Paris', 'France', '29', '17', 6),
(8, '4 Allée des champs', 75015, 'Paris', 'France', '14', '12', 8),
(10, '154 avenue du général de gaulle', 75001, 'Paris', 'France', '18', '48', 10);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `ID` int NOT NULL,
  `datePaiement` date NOT NULL,
  `dateLivraison` date NOT NULL,
  `prixTotal` decimal(10,0) NOT NULL,
  `Statut` int NOT NULL,
  `adresseID` int NOT NULL,
  `utilisateurID` int NOT NULL,
  `livreurID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FOREIGN2` (`livreurID`),
  KEY `FOREIGN3` (`adresseID`),
  KEY `FOREIGN4` (`utilisateurID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`ID`, `datePaiement`, `dateLivraison`, `prixTotal`, `Statut`, `adresseID`, `utilisateurID`, `livreurID`) VALUES
(2, '2022-06-01', '2022-06-01', '17', 1, 2, 2, 3),
(4, '2022-06-01', '2022-06-01', '24', 1, 4, 4, 5),
(6, '2022-06-01', '2022-06-01', '12', 1, 6, 6, 7),
(8, '2022-06-01', '2022-06-01', '16', 1, 8, 8, 9),
(10, '2022-06-01', '2022-06-01', '20', 1, 10, 10, 11);

-- --------------------------------------------------------

--
-- Structure de la table `commandeproduit`
--

DROP TABLE IF EXISTS `commandeproduit`;
CREATE TABLE IF NOT EXISTS `commandeproduit` (
  `ID` int NOT NULL,
  `quantite` int NOT NULL,
  `commandeId` int NOT NULL,
  `produitID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FOREIGN5` (`produitID`),
  KEY `FOREIGN6` (`commandeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commandeproduit`
--

INSERT INTO `commandeproduit` (`ID`, `quantite`, `commandeId`, `produitID`) VALUES
(1, 1, 2, 1),
(2, 1, 4, 2),
(3, 1, 6, 3),
(4, 1, 8, 4);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `ID` int NOT NULL,
  `lattitude` decimal(10,0) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `statut` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `utilisateurID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FOREIGN7` (`utilisateurID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`ID`, `lattitude`, `longitude`, `statut`, `utilisateurID`) VALUES
(3, '12', '27', '0', 3),
(5, '16', '29', '1', 5),
(7, '18', '31', '0', 7),
(9, '20', '33', '1', 9),
(11, '22', '35', '0', 11);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `ID` int NOT NULL,
  `reference` int NOT NULL,
  `nom` text NOT NULL,
  `description` text NOT NULL,
  `photo` int NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `dateDisponibilité` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`ID`, `reference`, `nom`, `description`, `photo`, `prix`, `dateDisponibilité`) VALUES
(1, 1204, 'Poulet frites', 'Demi poulet avec frites maisons', 1, '12', '0000-00-00'),
(2, 1205, 'Burger du chef', 'Burger avec produits frais', 2, '10', '2022-05-30'),
(3, 1206, 'Saumon sauce citron', 'Saumon et son riz a la sauce citron', 3, '15', '2022-05-30'),
(4, 1207, 'Crepe au chocolat', 'Crepe maison et sa sauce au chocolat noire ', 4, '4', '2022-05-30'),
(5, 1208, 'Tiramisu', 'Tiramisu fait maison', 5, '7', '2022-05-30'),
(6, 1209, 'Fondant au chocolat', 'Fondant au chocolat fait maison', 6, '5', '2022-05-30');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID` int NOT NULL,
  `nom` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prénom` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mot de passe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `typeUtilisateur` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID`, `nom`, `prénom`, `email`, `mot de passe`, `typeUtilisateur`) VALUES
(2, 'Berty', 'Guidera', 'bguidera0@cnbc.com', 'T4jaBGfKF', 'client'),
(3, 'Asia', 'Monteath', 'amonteath1@ft.com', 'eafHj5', 'livreur'),
(4, 'Dov', 'Hissie', 'dhissie2@technorati.com', 'jkUKKk', 'client'),
(5, 'Levy', 'Bousfield', 'lbousfield3@altervista.org', 'oA2qwAGZ1676', 'livreur'),
(6, 'Chad', 'Baison', 'cbaison4@google.nl', 'DV9JNl8Ap8w', 'client'),
(7, 'Mable', 'Phillot', 'mphillot5@uiuc.edu', 'XpqVqUUtk', 'livreur'),
(8, 'Elva', 'Bedberry', 'ebedberry6@mysql.com', '9tZE1DChl5bc', 'client'),
(9, 'Morly', 'Fonso', 'mfonso7@biblegateway.com', 'e1NK5n', 'livreur'),
(10, 'Emyle', 'Aspland', 'easpland8@stumbleupon.com', '5oWDTuE5RQU', 'client'),
(11, 'Sergei', 'Featherbie', 'sfeatherbie9@seesaa.net', 'lkF8IFJ', 'livreur');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FOREIGN` FOREIGN KEY (`utilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FOREIGN2` FOREIGN KEY (`livreurID`) REFERENCES `livreur` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FOREIGN3` FOREIGN KEY (`adresseID`) REFERENCES `adresse` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FOREIGN4` FOREIGN KEY (`utilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `commandeproduit`
--
ALTER TABLE `commandeproduit`
  ADD CONSTRAINT `FOREIGN5` FOREIGN KEY (`produitID`) REFERENCES `produit` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FOREIGN6` FOREIGN KEY (`commandeId`) REFERENCES `commande` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `FOREIGN7` FOREIGN KEY (`utilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
