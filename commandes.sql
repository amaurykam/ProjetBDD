SELECT id_secteur, COUNT(*) AS total_offres
FROM offre
GROUP BY id_secteur;

SELECT nom_offre
FROM offre
ORDER BY nom_offre ASC;

SELECT postulant.nom, offre.nom_offre
FROM postuler
JOIN postulant ON postuler.id_postulant = postulant.id_postulant
JOIN offre ON postuler.id_offre = offre.id_offre;

UPDATE utilisateur
SET droits = 'super_admin'
WHERE username = 'kamaury';

DELETE FROM utilisateur
WHERE id_user = 3;

SELECT id_secteur, COUNT(*) AS total_offres
FROM offre
GROUP BY id_secteur
HAVING COUNT(*) > 2;

SELECT nom FROM offre
UNION
SELECT nom_secteur FROM secteur;

ALTER TABLE offres
DROP nom_offre;
ALTER TABLE offres ADD nom_poste VARCHAR(42);

DROP TABLE cv;

SELECT * FROM postulant
LIMIT 5;

SELECT DISTINCT id_secteur FROM offre;

SELECT * FROM utilisateur
WHERE username LIKE 'a%';

SELECT * FROM offre
WHERE id_secteur IN (1, 2);

SELECT * FROM utilisateur
WHERE id_user BETWEEN 1 AND 3;

SELECT nom, 
  CASE 
    WHEN id_secteur = 1 THEN 'Cybersécurité'
    WHEN id_secteur = 2 THEN 'Centre de contact'
    ELSE 'Autre' 
  END AS secteur
FROM offre;

SELECT nom, 
  CASE 
    WHEN id_secteur = 1 THEN 'Cybersécurité'
    WHEN id_secteur = 2 THEN 'Centre de contact'
    ELSE 'Autre' 
  END AS secteur
FROM offre;

TRUNCATE TABLE authentification;

EXPLAIN SELECT * FROM utilisateur WHERE id_user = 1;

BEGIN TRANSACTION;

UPDATE utilisateur
SET droits = 'super_admin'
WHERE username = 'kamaury';

COMMIT;


