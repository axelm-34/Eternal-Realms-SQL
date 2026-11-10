# ADR 0001 — Choix du système de gestion de base de données

- **Statut :** Accepté
- **Date :** 10 novembre 2026
- **Projet :** Eternal Realms
- **Décision :** Utilisation de PostgreSQL

## 1. Contexte

Dans le cadre du projet Eternal Realms, nous devons concevoir une base de données destinée à un MMORPG.

Cette base de données doit permettre de stocker et de gérer plusieurs types d'informations :
- Les comptes des joueurs.
- Les personnages créés par les joueurs.
- Les classes des personnages.
- Les guildes auxquelles les personnages peuvent appartenir.
- Les objets présents dans le jeu.
- Les inventaires des personnages.
- Les quêtes et leur progression.

Ces différentes données sont liées entre elles. Par exemple, un joueur peut posséder plusieurs personnages, un personnage peut appartenir à une guilde et un inventaire peut contenir plusieurs objets.

Nous devons donc choisir un système de gestion de base de données (SGBD) capable de gérer efficacement ces relations et de garantir la cohérence des informations.

## 2. Solutions trouvées

Trois solutions on été trouvées : PostgreSQL, MongoDB et Redis.

### 2.1 PostgreSQL

PostgreSQL est un système de gestion de base de données relationnelle open source. Il permet d'organiser les données dans des tables reliées entre elles grâce aux clés primaires et aux clés étrangères.

**Avantages :**
- Permet de créer des relations entre plusieurs tables.
- Garantit la cohérence des données grâce aux clés étrangères et aux contraintes.
- Utilise le langage SQL, adapté aux recherches et aux manipulations de données.
- Permet d'effectuer des requêtes complexes avec des jointures (JOIN).
- Gère les transactions pour éviter certaines incohérences lors des modifications.
- Convient à la gestion des joueurs, personnages, guildes, inventaires et quêtes.

**Inconvénients :**
- Nécessite de réfléchir à la structure des tables avant de créer la base de données.
- Les relations entre les données demandent parfois plusieurs jointures.
- Une modification importante de la structure peut nécessiter des adaptations du schéma.

### 2.2 MongoDB

MongoDB est un système de gestion de base de données orienté documents. Contrairement à PostgreSQL, il stocke principalement les informations sous forme de documents, généralement au format BSON.

**Avantages :**
- Structure flexible : les documents d'une même collection peuvent avoir des champs différents.
- Permet de stocker des données imbriquées dans un même document.
- Peut être intéressant pour des données dont la structure évolue régulièrement.
- Adapté à certains systèmes qui manipulent des données semi-structurées.

**Inconvénients :**
- La gestion des relations entre les différentes données est moins directe qu'avec une base relationnelle.
- Certaines opérations nécessitent de gérer les références entre documents.
- Il faut faire attention à la cohérence des données lorsque plusieurs documents doivent être modifiés ensemble.
- Le modèle documentaire est moins naturel pour notre projet, qui comporte de nombreuses relations entre les entités.

MongoDB pourrait être intéressant pour stocker des informations de jeu plus flexibles, mais il n'apporte pas d'avantage décisif pour notre modèle actuel.

### 2.3 Redis

Redis est un système de stockage de données en mémoire, principalement utilisé comme base de données clé-valeur, cache ou outil de gestion de données rapides.

**Avantages :**
- Très rapide pour lire et modifier des données conservées en mémoire.
- Permet de stocker des informations sous différentes structures, comme des listes, des ensembles ou des classements.
- Peut être utilisé pour gérer des classements et des données temporaires.
- Intéressant pour améliorer les performances de certaines fonctionnalités d'un jeu en ligne.

**Inconvénients :**
- Ne propose pas le même modèle relationnel que PostgreSQL.
- La gestion des relations complexes entre joueurs, personnages, objets et quêtes est moins adaptée.
- Il ne fournit pas le même fonctionnement classique de clés étrangères pour garantir les relations entre les tables.
- Il nécessiterait davantage de logique à développer pour maintenir la cohérence de nos données relationnelles.

Redis pourrait être utile en complément de PostgreSQL pour certaines fonctionnalités nécessitant beaucoup de rapidité, comme un classement de joueurs, mais il n'est pas le meilleur choix comme base principale de notre projet.

## 3. Comparaison des solutions

| Critères | PostgreSQL | MongoDB | Redis |
|---|---|---|---|
| Modèle de données | Relationnel | Documents | Clé-valeur et structures en mémoire |
| Relations entre données | Très adapté | Possible, mais moins direct | Peu adapté |
| Clés étrangères | Oui | Non, gestion par l'application | Non |
| Requêtes complexes | SQL et jointures | Agrégations et requêtes documentaires | Commandes adaptées à ses structures |
| Cohérence des données | Contraintes et transactions | Transactions possibles, validation à prévoir | Opérations atomiques selon les commandes |
| Utilisation dans notre projet | Très adaptée | Possible | Plutôt complémentaire |

## 4. Décision retenue

Après comparaison, nous avons choisi **PostgreSQL** comme système de gestion de base de données pour Eternal Realms.

Ce choix s'explique principalement par la structure de notre projet. Les informations que nous devons stocker sont fortement liées entre elles. PostgreSQL permet de représenter ces relations directement grâce aux clés primaires, aux clés étrangères et aux tables d'association.

Par exemple :
- Un personnage est relié à un joueur et à une classe.
- Un personnage peut être associé à une guilde.
- Un inventaire relie les personnages aux objets.
- Une progression de quête relie les personnages aux quêtes.

PostgreSQL permet également d'utiliser des requêtes SQL avec des jointures pour récupérer les informations provenant de plusieurs tables.

Enfin, ce système permet de définir des contraintes pour limiter les erreurs de saisie et garantir une meilleure cohérence des données.

## 5. Conséquences de cette décision

Le choix de PostgreSQL entraîne plusieurs conséquences sur la conception de notre base de données.

**Conséquences positives :**
- Les données seront organisées dans des tables structurées.
- Les relations seront représentées par des clés étrangères.
- Les associations plusieurs-à-plusieurs seront représentées par des tables intermédiaires.
- Les contraintes SQL permettront de contrôler certaines valeurs.
- Les requêtes SQL permettront d'effectuer des recherches et des classements.

**Limites et compromis :**
- La structure de la base doit être définie à l'avance.
- Certaines recherches nécessiteront plusieurs jointures.
- Les fonctionnalités très dynamiques ou temporaires d'un MMORPG pourraient nécessiter d'autres technologies dans un projet réel.

## 6. Conclusion

PostgreSQL est le choix le plus adapté à notre projet, car il répond aux besoins de stockage, de relation et de cohérence des données.

Même si MongoDB et Redis présentent des avantages dans certains contextes, PostgreSQL correspond davantage à la structure relationnelle du MMORPG et aux objectifs du projet, notamment l'utilisation du langage SQL.