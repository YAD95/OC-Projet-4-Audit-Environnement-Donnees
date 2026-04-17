-- ==============================================================================
-- SUPERSMARTMARKET : AUDIT D'UN ENVIRONNEMENT DE DONNÉES
-- SUPERSMARTMARKET: DATA ENVIRONMENT AUDIT
-- ==============================================================================

-- 1. Chiffre d’affaires total du 14 août 2024
-- 1. Total revenue on August 14, 2024
SELECT
  SUM(p.prix) AS chiffre_affaires_total
FROM ventes v
JOIN produits p
  ON v.ean = p.ean
WHERE v.date_achat = '14/08/2024';


-- 2. Top 10 des clients par chiffre d’affaires le 14 août 2024
-- 2. Top 10 customers by revenue on August 14, 2024
SELECT
  v.customer_id,
  SUM(p.prix) AS chiffre_affaires_client
FROM ventes v
JOIN produits p
  ON v.ean = p.ean
WHERE v.date_achat = '14/08/2024'
GROUP BY v.customer_id
ORDER BY chiffre_affaires_client DESC
LIMIT 10;


-- 3. Part du chiffre d’affaires encaissé par employé le 14 août 2024
-- 3. Revenue share per employee on August 14, 2024
SELECT
  v.id_employe,
  ROUND(SUM(p.prix), 2) AS chiffre_affaires_employe,
  ROUND(
    100.0 * SUM(p.prix) /
    (
      SELECT SUM(p2.prix)
      FROM ventes v2
      JOIN produits p2
        ON v2.ean = p2.ean
      WHERE v2.date_achat = '14/08/2024'
    ),
    2
  ) AS part_ca_pourcent
FROM ventes v
JOIN produits p
  ON v.ean = p.ean
WHERE v.date_achat = '14/08/2024'
GROUP BY v.id_employe
ORDER BY chiffre_affaires_employe DESC;


-- 4. Calcul de l’écart de chiffre d’affaires causé par les insertions tardives
-- 4. Revenue gap caused by late data insertions
SELECT
  SUM(produits.prix) AS ecart
FROM logs
LEFT JOIN produits
  ON logs.detail = produits.ean
WHERE logs.champs = 'EAN'
  AND logs.id_ligne IN (
    SELECT id_ligne
    FROM logs
    WHERE action = 'INSERT'
      AND date = '45519'
  );
