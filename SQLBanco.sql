--CREATE DATABASE Banco

USE Banco


CREATE TABLE Usuario (
    ID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
);

INSERT INTO Usuario (ID, Nombre)
VALUES
    (1, 'Juan Pérez'),
    (2, 'María García'),
    (3, 'Luis Rodríguez'),
    (4, 'Ana Martínez'),
    (5, 'Pedro Sánchez');

CREATE TABLE Tarjeta (
    ID INT PRIMARY KEY,
    ID_Usuario INT,
    Numero_Tarjeta NVARCHAR(16),
    Pin NVARCHAR(4),
    Saldo DECIMAL(10, 2),
    Bloqueada BIT,
    Fecha_Bloqueo DATETIME,
    Fecha_Ultima_Extraccion DATETIME,
    IntentosFallidos INT DEFAULT 0,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID)
);

INSERT INTO Tarjeta (ID, ID_Usuario, Numero_Tarjeta, Pin, Saldo, Bloqueada, Fecha_Bloqueo, Fecha_Ultima_Extraccion)
VALUES
    (1, 1, '1234567890123456', '1234', 1000.00, 0, NULL, '2024-04-20 09:30:00'),
    (2, 2, '2345678901234567', '2345', 1500.50, 0, NULL, '2024-04-19 14:45:00'),
    (3, 3, '3456789012345678', '3456', 500.75, 1, '2024-04-18 11:20:00', '2024-04-17 11:10:00'),
    (4, 4, '4567890123456789', '4567', 200.00, 0, NULL, '2024-04-16 16:55:00'),
    (5, 5, '5678901234567890', '5678', 3000.25, 0, NULL, '2024-04-15 08:00:00');

CREATE TABLE Operacion (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ID_Tarjeta INT,
    Tipo NVARCHAR(50),
    Monto DECIMAL(10, 2),
    Fecha DATETIME,
    FOREIGN KEY (ID_Tarjeta) REFERENCES Tarjeta(ID)
);

INSERT INTO Operacion (ID_Tarjeta, Tipo, Monto, Fecha)
VALUES
    (1, 'Login', 0.00, '2024-04-20 09:30:00'),
    (1, 'Extracción', 50.00, '2024-04-20 10:15:00'),
    (2, 'Login', 0.00, '2024-04-19 14:45:00'),
    (3, 'Login', 0.00, '2024-04-18 11:20:00'),
    (5, 'Extracción', 200.00, '2024-04-15 08:30:00');

	--SELECT * FROM Usuario	
	--SELECT * FROM Tarjeta	
	--SELECT * FROM Operacion