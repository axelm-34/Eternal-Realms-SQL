-- ============================================
-- TP ETERNAL REALMS
-- Conception et architecture des données
-- Création de la base de données PostgreSQL
-- ============================================

-- 1. JOUEURS
CREATE TABLE joueurs (
    id SERIAL PRIMARY KEY,
    pseudo VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    inscrit_le TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. CLASSES
CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    description TEXT
);

-- 3. GUILDES
CREATE TABLE guildes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    date_creation DATE DEFAULT CURRENT_DATE
);

-- 4. OBJETS
CREATE TABLE objets (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    rarete VARCHAR(30),
    niveau_requis INTEGER CHECK (niveau_requis >= 1),
    caracteristiques JSONB
);

-- 5. QUETES
CREATE TABLE quetes (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(150) NOT NULL,
    niveau_recommande INTEGER CHECK (niveau_recommande >= 1)
);

-- 6. SAISONS
CREATE TABLE saisons (
    id SERIAL PRIMARY KEY,
    numero INTEGER UNIQUE NOT NULL,
    debut_le DATE NOT NULL,
    fin_le DATE NOT NULL,
    CHECK (fin_le > debut_le)
);

-- 7. PERSONNAGES
CREATE TABLE personnages (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    niveau INTEGER NOT NULL DEFAULT 1
        CHECK (niveau BETWEEN 1 AND 100),
    xp INTEGER NOT NULL DEFAULT 0
        CHECK (xp >= 0),
    cree_le TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    joueur_id INTEGER NOT NULL REFERENCES joueurs(id),
    classe_id INTEGER NOT NULL REFERENCES classes(id),
    guilde_id INTEGER REFERENCES guildes(id)
);

-- 8. INVENTAIRES
CREATE TABLE inventaires (
    personnage_id INTEGER NOT NULL REFERENCES personnages(id),
    objet_id INTEGER NOT NULL REFERENCES objets(id),
    quantite INTEGER NOT NULL CHECK (quantite > 0),
    equipe BOOLEAN DEFAULT FALSE,
    obtenu_le TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (personnage_id, objet_id)
);

-- 9. PROGRESSIONS
CREATE TABLE progressions (
    personnage_id INTEGER NOT NULL REFERENCES personnages(id),
    quete_id INTEGER NOT NULL REFERENCES quetes(id),
    commence_le TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    termine_le TIMESTAMP,
    statut VARCHAR(20) NOT NULL
        CHECK (statut IN ('en cours', 'terminee')),

    PRIMARY KEY (personnage_id, quete_id),
    CHECK (termine_le IS NULL OR termine_le >= commence_le)
);

-- 10. CLASSEMENTS
CREATE TABLE classements (
    personnage_id INTEGER NOT NULL REFERENCES personnages(id),
    saison_id INTEGER NOT NULL REFERENCES saisons(id),
    score INTEGER NOT NULL DEFAULT 0 CHECK (score >= 0),

    PRIMARY KEY (personnage_id, saison_id)
);