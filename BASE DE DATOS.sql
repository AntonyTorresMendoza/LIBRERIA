CREATE DATABASE DB_LIBRERIA
USE DB_LIBRERIA

-- Tabla para almacenar información de clientes
CREATE TABLE Clientes (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Nombre VARCHAR(20) NOT NULL,
  Genero VARCHAR(10) NOT NULL
);

-- Tabla para almacenar información de libros
CREATE TABLE Libros (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Titulo VARCHAR(50) NOT NULL,
  Tipo INT NOT NULL,
  FOREIGN KEY (Tipo) REFERENCES TiposLibros(ID)
);

-- Tabla auxiliar para tipos de libros
CREATE TABLE TiposLibros (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Descripcion VARCHAR(100) NOT NULL
);

select * from Clientes
-- Tabla para almacenar precios por tipo de libro
CREATE TABLE PreciosPorTipoLibro (
  TipoLibroID INT NOT NULL,
  Precio DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (TipoLibroID) REFERENCES TiposLibros(ID)
);

-- Insertar datos de tipos de libros
INSERT INTO TiposLibros (Descripcion) VALUES
  ('Ficción'),
  ('Novelas'),
  ('Cuentos'),
  ('Física Cuántica');

-- Insertar datos de precios por tipo de libro
INSERT INTO PreciosPorTipoLibro (TipoLibroID, Precio) VALUES
  (1, 90.00),
  (2, 100.00),
  (3, 80.00),
  (4, 150.00);

-- Insertar datos de clientes
INSERT INTO Clientes (Nombre, Genero) VALUES
  ('Juan Pérez', 'Masculino'),
  ('Ana García', 'Femenino'),
  ('Pedro López', 'Masculino');

-- Insertar datos de libros
INSERT INTO Libros (Titulo, Tipo) VALUES
  ('El Principito', 1),
  ('Sapiens: Una breve historia de la humanidad', 2),
  ('Cuentos de la selva', 3),
  ('Física cuántica para Dummies', 4);

  SELECT 
  Libros.ID,
  Libros.Titulo,
  TiposLibros.Descripcion AS Tipo
FROM Libros
INNER JOIN TiposLibros ON Libros.Tipo = TiposLibros.ID;

select * from TiposLibros

SELECT 
  Libros.ID,
  Libros.Titulo,
  TiposLibros.Descripcion AS Tipo,
  PreciosPorTipoLibro.Precio
FROM Libros
INNER JOIN TiposLibros ON Libros.Tipo = TiposLibros.ID
INNER JOIN PreciosPorTipoLibro ON TiposLibros.ID = PreciosPorTipoLibro.TipoLibroID;
