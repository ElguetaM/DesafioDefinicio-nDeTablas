--1.Crear base de datos (desde SQL)--
CREATE DATABASE Peliculas

--Entrar a la base de datos--
\c Peliculas

--2.Crear tabla peliculas--
CREATE TABLE Peliculas (id int primary key not null, Pelicula varchar, Año_Estreno int, Director varchar);

--Crear tabla Reparto--
CREATE TABLE Reparto (id int not null, Reparto varchar, foreign key (id) references Peliculas(id));

--Cargar ambos archivos a su tabla correspondiente--

--Para Pelicula--
COPY Peliculas
FROM 'D:\Bootcamp\BaseDeDatos\ApoyoDesafioTop100\peliculas.csv'
DELIMITER ','
CSV HEADER;

--Para Reparto--
COPY Reparto
FROM 'D:\Bootcamp\BaseDeDatos\ApoyoDesafioTop100\reparto.csv'
DELIMITER ',';

--3.Obtener el ID de la película “Titanic”--
SELECT id FROM Peliculas WHERE Pelicula = 'Titanic';

--4.Listar a todos los actores que aparecen en la película "Titanic"--
SELECT Reparto.Reparto FROM Reparto INNER JOIN Peliculas USING(id) WHERE Pelicula = 'Titanic';

--5. Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT count(id) FROM Peliculas INNER JOIN Reparto USING(id) WHERE Reparto = 'Harrison Ford' LIMIT 100;

--6.Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente--
SELECT Peliculas.Pelicula FROM Peliculas WHERE Año_Estreno BETWEEN '1990' AND '1999' GROUP BY Pelicula ORDER BY Pelicula ASC;

--7.Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”--
SELECT Pelicula, LENGTH(Pelicula) AS longitud_titulo FROM Peliculas;

--8.Consultar cual es la longitud más grande entre todos los títulos de las películas--
SELECT LENGTH(Pelicula) FROM Peliculas ORDER BY LENGTH DESC limit 1;