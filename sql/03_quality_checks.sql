-- 3. Verifier le nombre de lignes et afficher un apercu.
-- Reprise de SQL query 2 et SQL query 6. Lectures uniquement.
-- Les autres controles qualite sont realises dans le notebook Python.

SELECT COUNT(*) AS Nombre_de_lignes
FROM dbo.BlackFriday;

SELECT TOP (5) *
FROM dbo.BlackFriday
ORDER BY Transaction_ID;
