SELECT TOP (1000) [Id]
      ,[Descripcion]
  FROM [CATALOGO_P3_DB].[dbo].[MARCAS]

use [CATALOGO_P3_DB]
  -- Crear la tabla con la columna ID como identity
ALTER TABLE Marcas 
ADD IDCategoria INT Foreign Key references CATEGORIAS(Id)

INSERT INTO CATEGORIAS (Descripcion)
VALUES 
    ('Electr�nica y Tecnolog�a'),
    ('Moda y Accesorios'),
    ('Hogar y Jard�n'),
    ('Salud y Belleza'),
    ('Arte y Artesan�a'),
    ('Deportes y Ocio'),
    ('Veh�culos'),
    ('Otros');




-- Electr�nica y Tecnolog�a (IDCategoria = 1)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Apple', 1),
    ('Samsung', 1),
    ('Sony', 1),
    ('Microsoft', 1),
    ('Dell', 1),
    ('Otro', 1);  -- Agregar 'Otro' a la categor�a 1

GO

-- Moda y Accesorios (IDCategoria = 2)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Zara', 2),
    ('H&M', 2),
    ('Gucci', 2),
    ('Nike', 2),
    ('Adidas', 2),
    ('Otro', 2);  -- Agregar 'Otro' a la categor�a 2

GO

-- Hogar y Jard�n (IDCategoria = 3)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('IKEA', 3),
    ('Home Depot', 3),
    ('Pottery Barn', 3),
    ('Bed Bath & Beyond', 3),
    ('Crate & Barrel', 3),
    ('Otro', 3);  -- Agregar 'Otro' a la categor�a 3

GO

-- Salud y Belleza (IDCategoria = 4)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('L''Or�al', 4),
    ('Dove', 4),
    ('Colgate', 4),
    ('Clarins', 4),
    ('Nivea', 4),
    ('Otro', 4);  -- Agregar 'Otro' a la categor�a 4

GO

-- Arte y Artesan�a (IDCategoria = 5)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Etsy', 5),
    ('Society6', 5),
    ('Art.com', 5),
    ('Redbubble', 5),
    ('Saatchi Art', 5),
    ('Otro', 5);  -- Agregar 'Otro' a la categor�a 5

GO

-- Deportes y Ocio (IDCategoria = 6)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Nike', 6),
    ('Adidas', 6),
    ('Decathlon', 6),
    ('REI', 6),
    ('Under Armour', 6),
    ('Otro', 6);  -- Agregar 'Otro' a la categor�a 6

GO

-- Veh�culos (IDCategoria = 7)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Ford', 7),
    ('Toyota', 7),
    ('BMW', 7),
    ('Honda', 7),
    ('Tesla', 7),
    ('Otro', 7);  -- Agregar 'Otro' a la categor�a 7

GO

-- Otros (IDCategoria = 8)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Amazon', 8),
    ('eBay', 8),
    ('Alibaba', 8),
    ('MercadoLibre', 8),
    ('Etsy', 8),
    ('Otro', 8);  -- Agregar 'Otro' a la categor�a 8

GO
