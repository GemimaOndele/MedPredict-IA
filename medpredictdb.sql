-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 02 avr. 2025 à 18:10
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `medpredictdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `capteur`
--

CREATE TABLE `capteur` (
  `id_Capteur` bigint(20) UNSIGNED NOT NULL,
  `id_Equipement` int(11) NOT NULL,
  `type_capteur` varchar(50) DEFAULT NULL,
  `emplacement` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `id_Equipement` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `statut` varchar(20) DEFAULT NULL,
  `id_TypeEquipement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `historiquemaintenance`
--

CREATE TABLE `historiquemaintenance` (
  `id_Maintenance` bigint(20) UNSIGNED NOT NULL,
  `id_Equipement` int(11) NOT NULL,
  `date_intervention` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cout` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rapportpanne`
--

CREATE TABLE `rapportpanne` (
  `id_Panne` bigint(20) UNSIGNED NOT NULL,
  `id_Equipement` int(11) NOT NULL,
  `date_panne` date DEFAULT NULL,
  `cause` text DEFAULT NULL,
  `action_effectuee` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typeequipement`
--

CREATE TABLE `typeequipement` (
  `id_TypeEquipement` int(11) NOT NULL,
  `Libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD PRIMARY KEY (`id_Capteur`),
  ADD KEY `fk_equipement_capteur` (`id_Equipement`);

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_Equipement`),
  ADD KEY `fk_type_equipement` (`id_TypeEquipement`);

--
-- Index pour la table `historiquemaintenance`
--
ALTER TABLE `historiquemaintenance`
  ADD PRIMARY KEY (`id_Maintenance`),
  ADD KEY `fk_equipement_maintenance` (`id_Equipement`);

--
-- Index pour la table `rapportpanne`
--
ALTER TABLE `rapportpanne`
  ADD PRIMARY KEY (`id_Panne`),
  ADD KEY `fk_equipement_panne` (`id_Equipement`);

--
-- Index pour la table `typeequipement`
--
ALTER TABLE `typeequipement`
  ADD PRIMARY KEY (`id_TypeEquipement`),
  ADD UNIQUE KEY `Libelle` (`Libelle`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `capteur`
--
ALTER TABLE `capteur`
  MODIFY `id_Capteur` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `equipement`
--
ALTER TABLE `equipement`
  MODIFY `id_Equipement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `historiquemaintenance`
--
ALTER TABLE `historiquemaintenance`
  MODIFY `id_Maintenance` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rapportpanne`
--
ALTER TABLE `rapportpanne`
  MODIFY `id_Panne` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `typeequipement`
--
ALTER TABLE `typeequipement`
  MODIFY `id_TypeEquipement` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `fk_equipement_capteur` FOREIGN KEY (`id_Equipement`) REFERENCES `equipement` (`id_Equipement`);

--
-- Contraintes pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD CONSTRAINT `fk_type_equipement` FOREIGN KEY (`id_TypeEquipement`) REFERENCES `typeequipement` (`id_TypeEquipement`);

--
-- Contraintes pour la table `historiquemaintenance`
--
ALTER TABLE `historiquemaintenance`
  ADD CONSTRAINT `fk_equipement_maintenance` FOREIGN KEY (`id_Equipement`) REFERENCES `equipement` (`id_Equipement`);

--
-- Contraintes pour la table `rapportpanne`
--
ALTER TABLE `rapportpanne`
  ADD CONSTRAINT `fk_equipement_panne` FOREIGN KEY (`id_Equipement`) REFERENCES `equipement` (`id_Equipement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
