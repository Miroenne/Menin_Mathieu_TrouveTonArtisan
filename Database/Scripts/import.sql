-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 09 juin 2026 à 13:12
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db`
--

USE db;
-- --------------------------------------------------------

--
-- Déchargement des données de la table `Catégories`
--

INSERT INTO Catégories (id_Catégorie, nom_Catégorie) VALUES
(1, 'Alimentation'),
(2, 'Bâtiment'),
(3, 'Fabrication'),
(4, 'Services');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `Spécialités`
--

INSERT INTO Spécialités (id_Spécialité, nom_Spécialité, Catégories_id_Catégorie) VALUES
(9, 'Bijoutier', 3),
(1, 'Boucher', 1),
(2, 'Boulanger', 1),
(5, 'Chauffagiste', 2),
(3, 'Chocolatier', 1),
(12, 'Coiffeur', 4),
(10, 'Couturier', 3),
(6, 'Electricien', 2),
(11, 'Ferronier', 3),
(13, 'Fleuriste', 4),
(7, 'Menuisier', 2),
(8, 'Plombier', 2),
(14, 'Toiletteur', 4),
(4, 'Traiteur', 1),
(15, 'Webdesign', 4);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `Top`
--

INSERT INTO Top (id_Top, top_Value) VALUES
(1, 'FAUX'),
(2, 'VRAI');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `Villes`
--

INSERT INTO Villes (id_Ville, nom_Ville) VALUES
(7, 'Aix-les-bains'),
(8, 'Annecy'),
(13, 'Annonay'),
(5, 'Bourg-en-bresse'),
(11, 'Chambéry'),
(4, 'Chamonix'),
(3, 'Evian'),
(9, 'Le Puy-en-Velay'),
(1, 'Lyon'),
(2, 'Montélimar'),
(12, 'Romans-sur-Isère'),
(10, 'Saint-Priest'),
(14, 'Valence'),
(6, 'Vienne');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `Artisans`
--

INSERT INTO Artisans (id_Artisan, nom, email, site_web, a_propos, photo_url, note, Spécialités_id_Spécialité, Villes_id_Ville, Top_id_Top) VALUES
(1, 'Boucherie Dumont', 'boucherie.dumond@gmail.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.5, 1, 1, 1),
(2, 'Au pain chaud', 'aupainchaud@hotmail.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', 'https://www.je-cherche-un-commerce.com/upload/commerces/images/large/1779444880_2051fc30bb8b58d2628608fecdb484e6_04.jpg', 4.8, 2, 2, 2),
(3, 'Chocolaterie Labbé', 'chocolaterie-labbe@gmail.com', 'https://chocolaterie-labbe.fr', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.9, 3, 1, 2),
(4, 'Traiteur Truchon', 'contact@truchon-traiteur.fr', 'https://truchon-traiteur.fr', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.1, 4, 1, 1),
(5, 'Orville Salmons', 'o-salmons@live.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 5.0, 5, 3, 2),
(6, 'Mont Blanc Eléctricité', 'contact@mont-blanc-electricite.com', 'https://mont-blanc-electricite.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.5, 6, 4, 1),
(7, 'Boutot & fils', 'boutot-menuiserie@gmail.com', 'https://boutot-menuiserie.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.7, 7, 5, 1),
(8, 'Vallis Bellemare', 'v.bellemare@gmail.com', 'https://plomberie-bellemare.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.0, 8, 6, 1),
(9, 'Claude Quinn', 'claude.quinn@gmail.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.2, 9, 7, 1),
(10, 'Amitee Lécuyer', 'a.amitee@hotmail.com', 'https://lecuyer-couture.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.5, 10, 8, 1),
(11, 'Ernest Carignan', 'e-carigan@hotmail.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', 'https://www.fubat.fr/wp-content/uploads/2025/03/ferronnerie-dart-en-cours-de-realisation.jpg.avif', 5.0, 11, 9, 1),
(12, 'Royden Charbonneau', 'r.charbonneau@gmail.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 3.8, 12, 10, 1),
(13, 'Leala Dennis', 'l.dennos@hotmail.fr', 'https://coiffure-leala-chambery.fr', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 3.8, 12, 11, 1),
(14, 'C\'est sup\'hair', 'sup-hair@gmail.com', 'https://sup-hair.fr', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', 'https://expertimo.staticlbi.com/original/images/biens/1994/728658aac03852f1988af73f5e4f625f/photo_ad328bf8b6c658915d605017f7f04506.jpg', 4.1, 12, 12, 1),
(15, 'Le monde des fleurs', 'contact@le-monde-des-fleurs-annonay.fr', 'https://le-monde-des-fleurs-annonay.fr', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.6, 13, 13, 1),
(16, 'Valérie Laderoute', 'v-laredoute@gmail.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', NULL, 4.5, 14, 14, 1),
(17, 'CM Graphisme', 'contact@cm-graphisme.com', 'https://cm-graphisme.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ante sem, id volutpat massa fermentum nec. Praesent volutpat scelerisque mauris, quis sollicitudin tellus sollicitudin. ', 'https://audreytips.com/wp-content/uploads/2021/08/webdesign-e-commerce-les-6-cles-pour-un-boutique-qui-attire-et-convertit-1.jpg', 4.4, 15, 14, 1);

-- COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;