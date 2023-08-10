-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 06 juil. 2020 à 09:32
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `demandes_releves_notes`
--

-- --------------------------------------------------------

--
-- Structure de la table `demandeurs_releves_notes`
--

DROP TABLE IF EXISTS `demandeurs_releves_notes`;
CREATE TABLE IF NOT EXISTS `demandeurs_releves_notes` (
  `idDemandeur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `dateNaissance` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `cin` varchar(10) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `adresse` text NOT NULL,
  `identiteDemandeur` varchar(20) NOT NULL,
  `dateDemande` date NOT NULL DEFAULT current_timestamp(),
  `estRecupere` tinyint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idDemandeur`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `demandeurs_releves_notes`
--

INSERT INTO `demandeurs_releves_notes` (`idDemandeur`, `nom`, `prenom`, `dateNaissance`, `email`, `cin`, `telephone`, `adresse`, `identiteDemandeur`, `dateDemande`, `estRecupere`) VALUES
(5, 'Meknassi', 'Mohammed Cherkaoui', '2018-05-23', 'm.cherkaoui95@gmail.com', 'A11111', '0600567551', 'AVENUE MOHAMMED 5, IMM D43, N 5', 'tuteur', '2020-07-06', 0),
(4, 'Meknassi', 'Mohammed Cherkaoui', '2019-02-13', 'm.cherkaoui95@gmail.com', 'Q111111', '0600567551', 'AVENUE MOHAMMED 5, IMM D43, N 5', 'tuteur', '2020-07-06', 0),
(6, 'Meknassi', 'Mohammed Cherkaoui', '2018-05-23', 'm.cherkaoui95@gmail.com', 'A11111', '0600567551', 'AVENUE MOHAMMED 5, IMM D43, N 5', 'tuteur', '2020-07-06', 0),
(7, 'Meknassi', 'Mohammed Cherkaoui', '2018-05-23', 'm.cherkaoui95@gmail.com', 'A11111', '0600567551', 'AVENUE MOHAMMED 5, IMM D43, N 5', 'tuteur', '2020-07-06', 0),
(8, 'Meknassi', 'Mohammed Cherkaoui', '2018-05-23', 'm.cherkaoui95@gmail.com', 'A11111', '0600567551', 'AVENUE MOHAMMED 5, IMM D43, N 5', 'tuteur', '2020-07-06', 0),
(9, 'Meknassi', 'Mohammed Cherkaoui', '2018-05-23', 'm.cherkaoui95@gmail.com', 'A11111', '0600567551', 'AVENUE MOHAMMED 5, IMM D43, N 5', 'tuteur', '2020-07-06', 0),
(10, 'Meknassi', 'Mohammed Cherkaoui', '2018-05-23', 'm.cherkaoui95@gmail.com', 'A11111', '0600567551', 'AVENUE MOHAMMED 5, IMM D43, N 5', 'tuteur', '2020-07-06', 0),
(11, 'ELAISSAOUI', 'Mohammed Cherkaoui', '2018-05-16', 'm.cherkaoui95@gmail.com', 'A123334', '0600567551', 'AVENUE MOHAMMED 5, IMM D43, N 5', 'lui-meme', '2020-07-06', 0);

-- --------------------------------------------------------

--
-- Structure de la table `liste_releves_notes`
--

DROP TABLE IF EXISTS `liste_releves_notes`;
CREATE TABLE IF NOT EXISTS `liste_releves_notes` (
  `idReleveNote` int(11) NOT NULL AUTO_INCREMENT,
  `anne` int(11) NOT NULL,
  `niveau` varchar(4) NOT NULL,
  `filiere` varchar(100) NOT NULL,
  `groupe` varchar(20) NOT NULL,
  `estAnneeComplete` tinyint(4) NOT NULL,
  `idDemandeur` int(11) NOT NULL,
  PRIMARY KEY (`idReleveNote`),
  KEY `FK` (`idDemandeur`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `liste_releves_notes`
--

INSERT INTO `liste_releves_notes` (`idReleveNote`, `anne`, `niveau`, `filiere`, `groupe`, `estAnneeComplete`, `idDemandeur`) VALUES
(2, 2009, '1A', 'A', 'A', 1, 10),
(3, 2009, '1A', 'B', 'B', 1, 10),
(4, 2001, '1A', 'TDM', 'Z', 1, 11),
(5, 2002, '1A', 'TDM', 'Z', 1, 11),
(6, 2003, '1A', 'TDM', 'Z', 1, 11),
(7, 2004, '1A', 'TDM', 'Z', 1, 11);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
