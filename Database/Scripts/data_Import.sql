USE db;

CREATE TEMPORARY TABLE temp_data (
    `nom` VARCHAR(255),
    `spécialités` VARCHAR(255),
    `note` DECIMAL(2,1),
    `ville`VARCHAR(45),
    `a_propos` TEXT,
    `email` VARCHAR(255),
    `site` VARCHAR(255),
    `catégorie` VARCHAR(45),
    `top` VARCHAR(45)
)
ENGINE = InnoDB;

LOAD DATA INFILE '/Users/mathieumenin/mysql_import/data.csv'
INTO TABLE temp_data
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO Catégories(nom_Catégorie) SELECT DISTINCT catégorie FROM temp_data;
INSERT INTO Spécialités(nom_Spécialité, Catégories_id_Catégorie) SELECT DISTINCT t.spécialités, c.id_Catégorie
FROM temp_data t
INNER JOIN Catégories c ON c.nom_Catégorie = t.catégorie;
INSERT INTO Top(top_Value) SELECT DISTINCT top FROM temp_data;
INSERT INTO Villes(nom_Ville) SELECT DISTINCT ville FROM temp_data;
INSERT INTO Artisans(nom, email, site_web, A_propos, note, Spécialités_id_Spécialité, Villes_id_Ville, Top_id_Top) 
SELECT nom, email, NULLIF(TRIM(site), ''), a_propos, note, s.id_Spécialité, v.id_Ville, t.id_Top 
FROM temp_data
INNER JOIN Spécialités s ON s.nom_Spécialité = temp_data.spécialités
INNER JOIN Villes v ON v.nom_Ville = temp_data.ville
INNER JOIN Top t ON t.top_Value = temp_data.top;