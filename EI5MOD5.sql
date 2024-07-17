CREATE DATABASE ei5mod5;

CREATE USER 'adminej5'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON ei5mod5.* TO 'adminej5'@'localhost';
FLUSH PRIVILEGES;

USE ei5mod5;

CREATE TABLE  usuarios(
	id_usuario INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    apellido VARCHAR (40),
    contraseña VARCHAR(30),
    zona_horaria VARCHAR(20) DEFAULT 'UTC-3',
    genero ENUM ('femenino', 'masculino', 'otro'),
    telefono BIGINT,
    PRIMARY KEY (id_usuario)
    );
    
CREATE TABLE Fecha_hora_ingreso(
	id_ingreso INT AUTO_INCREMENT,
    id_usuario INT,
    fecha_hora_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_ingreso),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    );
    
CREATE TABLE visitas(
	id_usuario INT,
    cantidad_visitas INT DEFAULT 1,
    ultima_visita TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    );
    
INSERT INTO usuarios (nombre, apellido, contraseña, zona_horaria, genero, telefono) VALUES
('Juan', 'Pérez', 'clave123', 'UTC-3', 'Masculino', '1234567890'),
('María', 'González', 'password456', 'UTC-4', 'Femenino', '987654321'),
('Carlos', 'López', 'segura789', 'UTC-5', 'Masculino', '1122334455'),
('Ana', 'Martínez', 'supersegura', 'UTC-3', 'Femenino', '9988776655'),
('Pedro', 'Sánchez', 'mipass123', 'UTC-4', 'Masculino', '6677889900'),
('Laura', 'Ramírez', 'laurita123', 'UTC-5', 'Femenino', '5544332211'),
('Javier', 'Rodríguez', 'clave123', 'UTC-3', 'Masculino', '1122334455'),
('Sofía', 'López', 'password123', 'UTC-4', 'Otro', '9988776655');

DROP TABLE usuarios;
INSERT INTO fecha_hora_ingreso (id_usuario, fecha_hora_ingreso) VALUES
(1, '2024-06-10 08:30:00'),
(2, '2024-05-25 09:15:00'),
(3, '2024-07-10 10:00:00'),
(4, '2024-06-20 10:45:00'),
(5, '2024-02-09 11:30:00'),
(6, '2024-04-05 12:15:00'),
(7, '2024-06-27 13:00:00'),
(8, '2024-07-18 13:45:00');

INSERT INTO visitas (id_usuario, cantidad_visitas, ultima_visita) VALUES
(1, 5, '2024-07-18 08:30:00'),
(2, 10, '2024-07-17 09:15:00'),
(3, 3, '2024-07-18 10:00:00'),
(4, 1, '2024-07-16 11:45:00'),
(5, 20, '2024-07-17 11:30:00'),
(6, 8, '2024-07-18 12:15:00'),
(7, 15, '2024-07-17 13:00:00'),
(8, 1, '2024-07-18 13:45:00');

DROP TABLE visitas;