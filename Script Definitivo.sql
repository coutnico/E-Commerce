
-- 
INSERT INTO CATEGORIAS (Descripcion)
VALUES 
    ('Electrónica y Tecnología'),
    ('Moda y Accesorios'),
    ('Hogar y Jardín'),
    ('Salud y Belleza'),
    ('Arte y Artesanía'),
    ('Deportes y Ocio'),
    ('Vehículos'),
    ('Otros');




-- Electrónica y Tecnología (IDCategoria = 1)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Apple', 1),
    ('Samsung', 1),
    ('Sony', 1),
    ('Microsoft', 1),
    ('Dell', 1),
    ('Otro', 1);  -- Agregar 'Otro' a la categoría 1

GO

-- Moda y Accesorios (IDCategoria = 2)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Zara', 2),
    ('H&M', 2),
    ('Gucci', 2),
    ('Nike', 2),
    ('Adidas', 2),
    ('Otro', 2);  -- Agregar 'Otro' a la categoría 2

GO

-- Hogar y Jardín (IDCategoria = 3)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('IKEA', 3),
    ('Home Depot', 3),
    ('Pottery Barn', 3),
    ('Bed Bath & Beyond', 3),
    ('Crate & Barrel', 3),
    ('Otro', 3);  -- Agregar 'Otro' a la categoría 3

GO

-- Salud y Belleza (IDCategoria = 4)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('L''Oréal', 4),
    ('Dove', 4),
    ('Colgate', 4),
    ('Clarins', 4),
    ('Nivea', 4),
    ('Otro', 4);  -- Agregar 'Otro' a la categoría 4

GO

-- Arte y Artesanía (IDCategoria = 5)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Etsy', 5),
    ('Society6', 5),
    ('Art.com', 5),
    ('Redbubble', 5),
    ('Saatchi Art', 5),
    ('Otro', 5);  -- Agregar 'Otro' a la categoría 5

GO

-- Deportes y Ocio (IDCategoria = 6)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Nike', 6),
    ('Adidas', 6),
    ('Decathlon', 6),
    ('REI', 6),
    ('Under Armour', 6),
    ('Otro', 6);  -- Agregar 'Otro' a la categoría 6

GO

-- Vehículos (IDCategoria = 7)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Ford', 7),
    ('Toyota', 7),
    ('BMW', 7),
    ('Honda', 7),
    ('Tesla', 7),
    ('Otro', 7);  -- Agregar 'Otro' a la categoría 7

GO

-- Otros (IDCategoria = 8)
INSERT INTO [dbo].[MARCAS] (Descripcion, IDCategoria)
VALUES 
    ('Personalizado', 8),
    ('xx', 8),
    ('xx', 8),
    ('xx', 8),
    ('xx', 8),
    ('xx', 8);  -- Agregar 'Otro' a la categoría 8

GO

-- Insertar Usuarios
INSERT INTO [dbo].[USUARIOS] (Usuario, Pass, TipoUser, EMAIL)
VALUES 
    ('admin', 'adminpass', 2, 'admin@gmail.com'),  -- Admin
    ('juanperez', 'juanpass', 1, 'juan.perez@gmail.com'),  -- Usuario 1
    ('mariagomez', 'mariapass', 1, 'maria.gomez@gmail.com'),  -- Usuario 2
    ('carloslopez', 'carlospass', 1, 'carlos.lopez@gmail.com');  -- Usuario 3

-- Insertar Datos Personales
INSERT INTO [dbo].[DATOS_PERSONALES] (Nombres, Apellido, Genero, Telefono, Telefono_Aux, Documento, ID_USUARIO)
VALUES 
    ('Admin', 'Admin', 'Masculino', 123456789, NULL, 12345678, 1),
    ('Juan', 'Perez', 'Masculino', 234567890, NULL, 23456789, 2),
    ('Maria', 'Gomez', 'Femenino', 345678901, NULL, 34567890, 3),
    ('Carlos', 'Lopez', 'Masculino', 456789012, NULL, 45678901, 4);

-- Insertar Localidades
INSERT INTO [dbo].[LOCALIDADES] (Nombre)
VALUES 
    ('San Isidro'),
    ('Vicente López'),
    ('Tigre'),
    ('San Fernando'),
    ('Pilar'),
    ('San Martín'),
    ('Escobar'),
    ('San Miguel'),
    ('José C. Paz'),
    ('Malvinas Argentinas');

-- Insertar Direcciones
INSERT INTO [dbo].[DOMICILIOS] (ID_Usuario, Calle, Altura, Localidad, Observacion)
VALUES 
    (1, 'Calle Falsa', 123, 1, 'Cerca de la plaza'),
    (2, 'Av. Siempre Viva', 742, 2, 'Casa amarilla'),
    (3, 'Calle de la Amargura', 123, 3, 'Departamento B'),
    (4, 'Boulevard de los Sueños Rotos', 456, 4, 'Casa azul');

-- Insertar Artículos
INSERT INTO [dbo].[ARTICULOS] (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio)
VALUES 
    ('A001', 'iPhone 12', 'iPhone 12 color negro, 64GB.', 1, 1, 1000.99),
    ('A002', 'MacBook Pro ', 'Poco uso, escucho ofertas!!', 2, 2, 1200.99),
    ('A003', 'Remeras Nike ', 'Elegir al momento de haber realizado la compra', 3, 3, 500.99),
    ('A004', 'Playstation 3', 'vendo mi play, esta chipeada, con 500gb de memoria y 3 jostin, un caño!!!', 4, 4, 200.99);

INSERT INTO [dbo].[IMAGENES] (IdArticulo, ImagenUrl)
VALUES
    (1, 'https://imgs.search.brave.com/wSFbvLHY34QzJjnKLSfryRGF7S9GdjFJfcnlcw1_JYE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzYxeFhlTzZvalBM/LmpwZw'),
    (2, 'https://imgs.search.brave.com/nqk_6x2iMwrmF3xSFNXSLi4Qqe6FH0Dq-DT76gut67k/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTIz/NTcyODkwMy9waG90/by9hLTEzLWluY2gt/YXBwbGUtbWFjYm9v/ay1wcm8tbGFwdG9w/LWNvbXB1dGVyLXRh/a2VuLW9uLWphbnVh/cnktMjAtMjAyMS5q/cGc_cz02MTJ4NjEy/Jnc9MCZrPTIwJmM9/aFlSYnYxZThCNlk5/TWF2UVpfX29ibGhr/S0hUbVVyS2pXc0hs/QTNxZHppWT0'),
	(3, 'https://http2.mlstatic.com/D_NQ_NP_953383-MLA75658021072_042024-O.webp'),
    (3, 'https://http2.mlstatic.com/D_NQ_NP_989718-MLA76881525225_062024-O.webp'),
	(3, 'https://http2.mlstatic.com/D_NQ_NP_987891-MLA75611885745_042024-O.webp'),
    (4, 'https://http2.mlstatic.com/D_NQ_NP_906079-MLA77387126874_072024-O.webp'),
	(4, 'https://http2.mlstatic.com/D_NQ_NP_609443-MLA77603222373_072024-O.webp');



-- Insertar Publicaciones
INSERT INTO [dbo].[PUBLICACIONES] (IdUsuario, IdArticulo, Stock, Pausada, Baja_Logica)
VALUES 
    (2, 1, 10, 0, 0),  -- Publicación de Juan Perez
    (3, 2, 5, 0, 0),   -- Publicación de Maria Gomez
    (4, 3, 2, 0, 0),   -- Publicación de Carlos Lopez
    (2, 4, 1, 0, 0);   -- Publicación de Juan Perez





