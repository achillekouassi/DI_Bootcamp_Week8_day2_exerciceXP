-- 1- Dans la base de données dvdrental, écrivez une requête pour sélectionner toutes les colonnes de la table « client »
SELECT * FROM customer;

-- 2- Écrivez une requête pour afficher les noms ( first_name , last_name ) en utilisant un alias nommé « full_name »
SELECT first_name || ' ' || last_name AS full_name FROM customer;

-- 3- Permet d'obtenir toutes les dates auxquelles les comptes ont été créés. Écrivez une requête pour sélectionner tous les create_date de la table « client » (il ne doit pas y avoir de doublons).
SELECT DISTINCT create_date FROM customer;

-- 4- Écrivez une requête pour obtenir tous les détails du client à partir de la table des clients, elle doit être affichée dans l'ordre décroissant de leur prénom.
SELECT * FROM customer ORDER BY first_name DESC;

-- 5- Rédigez une requête pour obtenir l'ID du film, le titre, la description, l'année de sortie et le tarif de location par ordre croissant en fonction de leur tarif de location.
SELECT film_id, title, description, release_year, rental_rate FROM film ORDER BY rental_rate ASC;

-- 6- Écrivez une requête pour obtenir l'adresse et le numéro de téléphone de tous les clients vivant dans le district du Texas, ces détails peuvent être trouvés dans le tableau "adresse".
SELECT address, phone FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'United States' AND city.city = 'Laredo';

-- 7- Écrivez une requête pour récupérer tous les détails du film où l'identifiant du film est 15 ou 150.
SELECT * FROM film WHERE film_id IN (15, 150);

-- 8- Écrivez une requête qui devrait vérifier si votre film préféré existe dans la base de données. Demandez à votre requête d'obtenir l'ID du film, le titre, la description, la durée et le tarif de location, ces détails peuvent être trouvés dans le tableau "film".
SELECT film_id, title, description, length, rental_rate FROM film WHERE title = 'your favorite movie';

-- 9-Pas de chance de trouver votre film ? Peut-être avez-vous fait une erreur dans l'orthographe du nom. Écrivez une requête pour obtenir l'ID du film, le titre, la description, la durée et le tarif de location de tous les films commençant par les deux premières lettres de votre film préféré.
SELECT film_id, title, description, length, rental_rate FROM film WHERE title LIKE 'your favorite movie%';

-- 10- Écrivez une requête qui trouvera les 10 films les moins chers.
SELECT title, rental_rate FROM film ORDER BY rental_rate ASC LIMIT 10;

-- 11- Pas satisfait des résultats. Écrivez une requête qui trouvera les 10 prochains films les moins chers.
SELECT title, rental_rate FROM film 
WHERE rental_rate = (
  SELECT DISTINCT rental_rate FROM film ORDER BY rental_rate ASC LIMIT 10 OFFSET 10
) ORDER BY rental_rate ASC;

-- 12- Écrivez une requête qui joindra les données de la table des clients et de la table des paiements. Vous souhaitez obtenir le prénom et le nom de la table client, ainsi que le montant et la date de chaque paiement effectué par un client, classé par son identifiant (de 1 à…)
SELECT customer.first_name, customer.last_name, payment.amount, payment.payment_date
FROM customer JOIN payment ON customer.customer_id = payment.customer_id
ORDER BY customer.customer_id;

-- 13- Vous devez vérifier votre inventaire. Écrivez une requête pour obtenir tous les films qui ne sont pas dans l'inventaire.
SELECT film.film_id, title FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL;

-- 14- Rédigez une requête pour trouver quelle ville se trouve dans quel pays
SELECT city.city, country.country FROM city JOIN country ON city.country_id = country.country_id;

-- 15- Écrivez une requête pour obtenir l'identifiant du client, ses noms (prénom et nom), le montant et la date de paiement commandé par l'identifiant du membre du personnel qui lui a vendu le dvd
SELECT customer.customer_id, customer.first_name, customer.last_name, payment.amount, payment.payment_date, staff.staff_id
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
JOIN staff ON payment.staff_id = staff.staff_id
ORDER BY staff.staff_id;




