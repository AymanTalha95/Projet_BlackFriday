-- Etape 4 sur 4 : vues et indicateurs.
-- Exécuter chaque bloc séparé par GO, ou utiliser un outil qui traite GO.
-- Ces vues sont proposées pour retrouver les indicateurs en SQL.
-- Le rapport Power BI réalisé utilise directement dbo.BlackFriday.
CREATE OR ALTER VIEW dbo.vw_BlackFridayPowerBI AS
SELECT Transaction_ID, User_ID, Product_ID, Gender, Age, Occupation,
       City_Category, Stay_In_Current_City_Years, Marital_Status,
       Product_Category_1, Product_Category_2, Product_Category_3,
       Purchase, Gender_Label, Marital_Status_Label
FROM dbo.BlackFriday;
GO

-- BIGINT évite le dépassement de capacité pour la somme des montants.
-- La moyenne est calculée en décimal pour conserver les fractions.
CREATE OR ALTER VIEW dbo.vw_KPI AS
SELECT COUNT_BIG(*) AS Nombre_lignes_achat,
       COUNT(DISTINCT User_ID) AS Nombre_clients,
       COUNT(DISTINCT Product_ID) AS Nombre_produits,
       SUM(CAST(Purchase AS BIGINT)) AS Montant_total_des_achats,
       AVG(CAST(Purchase AS DECIMAL(18,2))) AS Montant_moyen_un_achat
FROM dbo.BlackFriday;
GO

CREATE OR ALTER VIEW dbo.vw_AgePerformance AS
SELECT Age, COUNT_BIG(*) AS Nombre_lignes_achat,
       SUM(CAST(Purchase AS BIGINT)) AS Montant_total_des_achats,
       AVG(CAST(Purchase AS DECIMAL(18,2))) AS Montant_moyen_un_achat
FROM dbo.BlackFriday
GROUP BY Age;
GO

-- Même regroupement par produit que dans le notebook.
CREATE OR ALTER VIEW dbo.vw_ProductPerformance AS
SELECT Product_ID, COUNT_BIG(*) AS Nombre_lignes_achat,
       SUM(CAST(Purchase AS BIGINT)) AS Montant_total_des_achats,
       AVG(CAST(Purchase AS DECIMAL(18,2))) AS Montant_moyen_un_achat
FROM dbo.BlackFriday
GROUP BY Product_ID;
GO
