# Eternal Realms — Conception d'une base de données pour un MMORPG

## Présentation du projet

**Eternal Realms** est un projet de conception de base de données réalisé dans le cadre du cours de conception et architecture des données.

Le projet consiste à concevoir la structure d'une base de données destinée à un MMORPG, c'est-à-dire un jeu de rôle en ligne massivement multijoueur.

L'objectif est de modéliser les principales données nécessaires au fonctionnement d'un univers de jeu en ligne : joueurs, personnages, classes, guildes, objets, inventaires et quêtes.

Le projet est réalisé en groupe.

## Objectifs

Les objectifs principaux du projet sont :

- Identifier les besoins et les règles de gestion du système.
- Concevoir un Modèle Conceptuel de Données (MCD).
- Transformer le MCD en Modèle Logique de Données (MLD).
- Comparer plusieurs systèmes de gestion de bases de données.
- Justifier le choix de PostgreSQL à travers un ADR.
- Créer la base de données à l'aide du langage SQL.
- Insérer des données de test.
- Réaliser plusieurs requêtes SQL pour exploiter les données.

## Technologies utilisées

| Technologie | Utilisation |
|---|---|
| PostgreSQL | Système de gestion de base de données |
| SQL | Création, modification et interrogation de la base |
| Visual Studio Code | Édition des fichiers du projet |
| pgAdmin 4 | Gestion et consultation de la base de données |
| Git / GitHub | Versionnement et partage du projet |

## Périmètre du projet

La base de données couvre les éléments suivants :

- **Joueurs :** informations relatives aux comptes des utilisateurs.
- **Personnages :** personnages créés par les joueurs, leur niveau et leur expérience.
- **Classes :** catégories définissant les personnages.
- **Guildes :** groupes auxquels les personnages peuvent appartenir.
- **Objets :** équipements et objets disponibles dans le jeu.
- **Inventaires :** objets possédés par les personnages et quantités associées.
- **Quêtes :** missions disponibles dans l'univers du jeu.
- **Progression des quêtes :** suivi de l'avancement des personnages dans les quêtes.

Le projet porte principalement sur la conception et la gestion des données. Il ne comprend pas le développement du jeu lui-même, de ses graphismes, de ses combats ou de ses fonctionnalités en temps réel.

## Context

Projet réalisé dans le cadre du cours de conception et architecture des données.