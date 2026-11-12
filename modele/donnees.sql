-- ============================================
-- ETERNAL REALMS
-- Données fictives pour tester le jeu en ligne
-- ============================================

-- 1. JOUEURS
INSERT INTO joueurs (pseudo, email)
VALUES
('Dragon75', 'dragon75@example.com'),
('Shadow92', 'shadow92@example.com'),
('MagicKing', 'magicking@example.com'),
('Warrior78', 'warrior78@example.com'),
('ArcherPro', 'archerpro@example.com');

-- 2. CLASSES
INSERT INTO classes (nom, description)
VALUES
('Guerrier', 'Spécialiste du combat rapproché'),
('Mage', 'Utilise des sorts magiques'),
('Archer', 'Spécialiste du combat à distance'),
('Paladin', 'Combattant utilisant la magie et les armes');

-- 3. GUILDES
INSERT INTO guildes (nom)
VALUES
('Les Dragons'),
('Les Ombres'),
('Les Gardiens');

-- 4. OBJETS
INSERT INTO objets
(nom, type, rarete, niveau_requis, caracteristiques)
VALUES
('Épée du Dragon', 'Arme', 'Légendaire', 20,
 '{"attaque": 150, "element": "feu"}'),

('Bâton Magique', 'Arme', 'Rare', 10,
 '{"magie": 100, "element": "glace"}'),

('Arc des Ombres', 'Arme', 'Épique', 15,
 '{"attaque": 120, "precision": 90}'),

('Armure du Gardien', 'Armure', 'Rare', 12,
 '{"defense": 100, "resistance": 50}'),

('Potion de soin', 'Consommable', 'Commun', 1,
 '{"soin": 50}');

-- 5. QUETES
INSERT INTO quetes (titre, niveau_recommande)
VALUES
('La forêt mystérieuse', 5),
('Le dragon oublié', 20),
('Le château des ombres', 15),
('La quête du cristal', 10);

-- 6. SAISONS
INSERT INTO saisons (numero, debut_le, fin_le)
VALUES
(1, '2026-01-01', '2026-03-31'),
(2, '2026-04-01', '2026-06-30'),
(3, '2026-07-01', '2026-09-30');

-- ============================================
-- 7. PERSONNAGES
-- ============================================

INSERT INTO personnages
(nom, niveau, xp, joueur_id, classe_id, guilde_id)
VALUES
('Drako', 25, 15000, 1, 1, 1),
('Shadow', 18, 8500, 2, 3, 2),
('Merlin', 30, 25000, 3, 2, 1),
('Thor', 15, 6000, 4, 4, 3),
('Legolas', 12, 4000, 5, 3, NULL),
('Phoenix', 22, 12000, 1, 2, 1);


-- ============================================
-- 8. INVENTAIRES
-- ============================================

INSERT INTO inventaires
(personnage_id, objet_id, quantite, equipe)
VALUES
(1, 1, 1, TRUE),
(1, 5, 5, FALSE),
(2, 3, 1, TRUE),
(3, 2, 1, TRUE),
(3, 5, 10, FALSE),
(4, 4, 1, TRUE),
(5, 3, 1, TRUE),
(6, 2, 1, TRUE);


-- ============================================
-- 9. PROGRESSIONS
-- ============================================

INSERT INTO progressions
(personnage_id, quete_id, statut, termine_le)
VALUES
(1, 1, 'terminee', CURRENT_TIMESTAMP),
(1, 2, 'en cours', NULL),
(2, 3, 'terminee', CURRENT_TIMESTAMP),
(3, 2, 'terminee', CURRENT_TIMESTAMP),
(4, 4, 'en cours', NULL),
(5, 1, 'terminee', CURRENT_TIMESTAMP),
(6, 4, 'en cours', NULL);


-- ============================================
-- 10. CLASSEMENTS
-- ============================================

INSERT INTO classements
(personnage_id, saison_id, score)
VALUES
(1, 1, 1500),
(2, 1, 950),
(3, 1, 2200),
(4, 1, 700),
(5, 1, 500),
(6, 1, 1300),
(1, 2, 1800),
(3, 2, 2500),
(6, 2, 1600),
(2, 3, 1100),
(4, 3, 900);