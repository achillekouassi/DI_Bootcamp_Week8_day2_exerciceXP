<-- 1- Tous les articles, classés par prix (du plus bas au plus élevé)
SELECT * FROM items ORDER BY price ASC;

<-- 2- Articles dont le prix est supérieur à 80 (80 inclus), classés par prix (du plus élevé au plus bas)
SELECT * FROM items WHERE price >= 80 ORDER BY price DESC;

<-- 3- Les 3 premiers clients par ordre alphabétique du prénom (AZ) – exclure la colonne clé primaire des résultats.
SELECT first_name, last_name FROM customers ORDER BY first_name ASC LIMIT 3;

<-- 4- Tous les noms de famille (pas d'autres colonnes !), dans l'ordre alphabétique inverse (ZA)
SELECT last_name FROM customers ORDER BY last_name DESC;


