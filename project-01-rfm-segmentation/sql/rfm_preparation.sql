-- ----------------------------------------------------
-- Projet 1 — Segmentation client orientée valeur (RFM)
-- Étape SQL : Nettoyage des données transactionnelles
--
-- Objectif :
-- Préparer une table transactionnelle propre et exploitable
-- pour l'analyse comportementale client (RFM).
--
-- Les agrégations client et la segmentation finale sont
-- volontairement réalisées dans R afin de conserver une
-- plus grande flexibilité analytique et métier.
--
-- Source des données : Online Retail (UCI)
-- ----------------------------------------------------

CREATE TABLE transactions_valides AS
SELECT 
    CustomerID,
    InvoiceNo,
    InvoiceDate,
    Quantity * UnitPrice AS total
FROM online_retail_raw
WHERE 
    CustomerID IS NOT NULL      -- conservation uniquement des clients identifiés
    AND Quantity > 0            -- exclusion des retours / annulations
    AND UnitPrice > 0;          -- exclusion des prix non valides

