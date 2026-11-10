# **1. Cahier des charges :**

## **1.1 Présentation du projet**
Ce projet et un petit jeu en MMORPG, d'entrainement de conception de base de donnée en utilisant PostgreSQL.

Ce jeu permet à plusieurs joueur de créer et de faire évoluer leurs personnages. Chaque personnages possède une classe, peut rejoindre une guild, récupérer des objets et accomplir différentes quêtes pour de l'expérience.

Le principe de ce projet été donc de créé une base de données pour un jeu MMORPG et de concevoir une base de données permettant de stocker et d'organiser les différentes informations liées aux joueurs et à leur progression dans le jeu.
La base de données devra notamment permettre de gérer les comptes des joueurs, leurs personnages, les objets qu'ils possèdent, les guildes auxquelles ils appartiennent ainsi que les quêtes qu'ils réalisent.

## **1.2 Objectifs du système**
- La base de données doit permettre de :
- Enregistrer et identifier les joueurs.
- Gérer les personnages créés par les joueurs.
- Associer chaque personnage à une classe.
- Gérer les guildes et leurs membres.
- Stocker les objets disponibles dans le jeu.
- Gérer les inventaires et les quantités d'objets possédées.
- Enregistrer les différentes quêtes du jeu.
- Suivre la progression des personnages dans les quêtes.
- Conserver le niveau et l'expérience des personnages.
- Calculer un classement des personnages selon leur expérience.

## **1.3 Périmètre fonctionnel**
Ce projet se concentre uniquement sur la conception et la gestion des données principales d'un MMORPG.

Il couvre la gestion des joueurs, des personnages, des classes, des guildes, des objets, des inventaires et des quêtes.

En revanche, le projet ne prend pas en charge le fonctionnement du jeu en lui-même. Les systèmes de combat, les déplacements des personnages, les graphismes, les connexions en temps réel entre joueurs et les interactions en jeu ne sont pas inclus dans le périmètre de cette base de données.

## **1.4 Règles de gestion**

- **RG1 – Gestion des joueurs**
Chaque joueur possède un identifiant unique, un pseudonyme unique et une adresse e-mail unique. Un joueur peut créer zéro à plusieurs personnages.

- **RG2 – Gestion des personnages**
Chaque personnage appartient obligatoirement à un seul joueur. Un joueur peut posséder plusieurs personnages.

- **RG3 – Gestion des classes**
Chaque personnage doit obligatoirement posséder une classe. Une même classe peut être attribuée à plusieurs personnages.

- **RG4 – Gestion des guildes**
Un personnage peut ne rejoindre aucune guilde ou appartenir à une seule guilde à la fois. Une guilde peut accueillir plusieurs personnages.

- **RG5 – Gestion des objets**
Chaque objet possède un identifiant unique, un nom, un type, une rareté et un niveau requis pour pouvoir être utilisé.

- **RG6 – Gestion des inventaires**
Un personnage peut posséder plusieurs objets et un même objet peut être possédé par plusieurs personnages. Pour chaque objet présent dans un inventaire, le système conserve la quantité possédée et la date d'obtention.

- **RG7 – Gestion des quêtes**
Chaque quête possède un identifiant unique, un titre et un niveau recommandé.

- **RG8 – Progression des quêtes**
Un personnage peut participer à plusieurs quêtes et une même quête peut être réalisée par plusieurs personnages. Pour chaque participation, le système conserve le statut de progression, la date de début et éventuellement la date de fin.

- **RG9 – Progression des personnages**
Chaque personnage possède un niveau compris entre 1 et 100 ainsi qu'une quantité de points d'expérience qui ne peut pas être négative.

- **RG10 – Classement des personnages**
Les personnages sont classés selon leur quantité de points d'expérience. Le classement est calculé à partir des données enregistrées, sans nécessiter de stocker manuellement la position de chaque personnage.

