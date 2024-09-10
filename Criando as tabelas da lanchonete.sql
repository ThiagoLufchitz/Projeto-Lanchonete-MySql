CREATE DATABASE Lanchonete;
USE Lanchonete;

CREATE TABLE Cliente(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR(45) NOT NULL,
telefone_cliente VARCHAR(11) NOT NULL,
endereco_cliente VARCHAR(20) NOT NULL
);

CREATE TABLE Entregador(
id_entregador INT AUTO_INCREMENT PRIMARY KEY,
nome_entregador VARCHAR(45) NOT NULL,
telefone_entregador VARCHAR(11)
);

CREATE TABLE Lanches(
id_lanches INT AUTO_INCREMENT PRIMARY KEY,
nome_lanche VARCHAR(45) NOT NULL,
preco DECIMAL(5,2) NOT NULL
);

CREATE TABLE Pedido(
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
data_emissao DATETIME DEFAULT CURRENT_TIMESTAMP,
status_entrega VARCHAR(10),
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE Pedido_Lanches(
id_pedido_lanches INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
id_lanches INT,
FOREIGN KEY (id_lanches) REFERENCES Lanches(id_lanches)
);

CREATE TABLE Entrega(
id_entrega INT AUTO_INCREMENT PRIMARY KEY,
horario DATETIME DEFAULT CURRENT_TIMESTAMP,
id_entregador INT,
FOREIGN KEY (id_entregador) REFERENCES Entregador(id_entregador),
id_pedido INT,
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

INSERT INTO Cliente (nome_cliente, telefone_cliente, endereco_cliente) VALUES 
('João Silva', '11987654321', 'Rua A, 123'),
('Maria Oliveira', '11998765432', 'Rua B, 456'),
('Carlos Santos', '11991234567', 'Rua C, 789'),
('Ana Costa', '11993456789', 'Rua D, 101'),
('Paulo Souza', '11994567890', 'Rua E, 202');

INSERT INTO Entregador (nome_entregador, telefone_entregador) VALUES 
('Pedro Lima', '11981234567'),
('Lucas Almeida', '11982345678'),
('Fernanda Rocha', '11983456789'),
('Rafael Martins', '11984567890'),
('Juliana Ribeiro', '11985678901');

INSERT INTO Lanches (nome_lanche, preco) VALUES 
('Hamburguer', 15.50),
('Cheeseburger', 18.00),
('Hot Dog', 12.00),
('Pizza', 25.00),
('Salada', 10.00);

INSERT INTO Pedido (status_entrega, id_cliente) VALUES 
('Pendente', 1),
('Enviado', 2),
('Pendente', 3),
('Cancelado', 4),
('Entregue', 5);

INSERT INTO Pedido_Lanches (id_pedido, id_lanches) VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

INSERT INTO Entrega (id_entregador, id_pedido) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

SELECT nome_cliente, status_entrega, nome_lanche, nome_entregador
FROM Cliente
JOIN Pedido ON Pedido.id_cliente = Cliente.id_cliente
JOIN Pedido_Lanches ON Pedido_Lanches.id_pedido = Pedido.id_pedido
JOIN Lanches ON Lanches.id_lanches = Pedido_Lanches.id_lanches
JOIN Entrega ON Entrega.id_pedido = Pedido.id_pedido
JOIN Entregador ON Entregador.id_entregador = Entrega.id_entregador
WHERE status_entrega LIKE 'Pendente';
