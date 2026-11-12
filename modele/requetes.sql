-- ============================================
-- ETERNAL REALMS
-- Requêtes SQL de démonstration
-- ============================================

-- 1. Afficher tous les joueurs
SELECT *
FROM joueurs;


-- 2. Afficher les personnages avec leurs joueurs et leurs classes
SELECT
    p.nom AS personnage,
    j.pseudo AS joueur,
    c.nom AS classe,
    p.niveau,
    p.xp
FROM personnages p
JOIN joueurs j ON p.joueur_id = j.id
JOIN classes c ON p.classe_id = c.id
ORDER BY p.niveau DESC;


-- 3. Afficher les personnages et leurs guildes
SELECT
    p.nom AS personnage,
    g.nom AS guilde
FROM personnages p
LEFT JOIN guildes g ON p.guilde_id = g.id
ORDER BY p.nom;


-- 4. Afficher l'inventaire des personnages
SELECT
    p.nom AS personnage,
    o.nom AS objet,
    i.quantite,
    i.equipe,
    o.rarete
FROM inventaires i
JOIN personnages p ON i.personnage_id = p.id
JOIN objets o ON i.objet_id = o.id
ORDER BY p.nom;


-- 5. Afficher la progression des quêtes
SELECT
    p.nom AS personnage,
    q.titre AS quete,
    pr.statut,
    pr.commence_le,
    pr.termine_le
FROM progressions pr
JOIN personnages p ON pr.personnage_id = p.id
JOIN quetes q ON pr.quete_id = q.id
ORDER BY p.nom;


-- 6. Afficher le classement des personnages par saison
SELECT
    s.numero AS saison,
    p.nom AS personnage,
    c.score,
    RANK() OVER (
        PARTITION BY s.id
        ORDER BY c.score DESC
    ) AS rang
FROM classements c
JOIN personnages p ON c.personnage_id = p.id
JOIN saisons s ON c.saison_id = s.id
ORDER BY s.numero, rang;


-- 7. Compter le nombre de personnages par classe
SELECT
    c.nom AS classe,
    COUNT(p.id) AS nombre_personnages
FROM classes c
LEFT JOIN personnages p ON p.classe_id = c.id
GROUP BY c.id, c.nom
ORDER BY nombre_personnages DESC;


-- 8. Afficher les 3 personnages ayant le plus d'expérience
SELECT
    nom,
    niveau,
    xp
FROM personnages
ORDER BY xp DESC
LIMIT 3;