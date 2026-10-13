-- 2. Importer le CSV depuis Blob dans une table vide.
-- Reprise des blocs SQL query 4, 3 et 5 dans leur ordre de dependance.
-- Executer les blocs separement comme dans les onglets Azure.
-- Ne pas relancer la creation des objets ni cet import dans la base deja remplie.
-- Les secrets sont remplaces par des parametres. SAS : sans ? initial ni URL complete.

-- A. Cle principale : SQL query 4.
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'REMPLACER_PAR_UN_MOT_DE_PASSE_FORT';

-- B. Autorisation SAS et source externe : SQL query 3.
-- Le caractere 2 isole apres la derniere instruction a ete retire.
CREATE DATABASE SCOPED CREDENTIAL BlackFridaySAS
WITH
    IDENTITY = 'SHARED ACCESS SIGNATURE',
    SECRET = 'REMPLACER_PAR_LE_JETON_SAS_SANS_POINT_INTERROGATION';

CREATE EXTERNAL DATA SOURCE BlackFridayBlob
WITH (
    TYPE = BLOB_STORAGE,
    LOCATION = 'https://stblackfriday241095.blob.core.windows.net/blackfriday-data',
    CREDENTIAL = BlackFridaySAS
);

-- C. Import et comptage : SQL query 5.
BULK INSERT dbo.BlackFriday
FROM 'black_friday_clean.csv'
WITH (
    DATA_SOURCE = 'BlackFridayBlob',
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    KEEPNULLS
);

SELECT COUNT(*) AS Nombre_de_lignes
FROM dbo.BlackFriday;
