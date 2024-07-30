CREATE TABLE Lanches(
    Codigo INT PRIMARY KEY,
    NomeLanche VARCHAR(100),
    Preco DECIMAL(5,2)
);

CREATE TABLE Cliente(
    Codigo INT PRIMARY KEY,
    NomeCliente VARCHAR(100),
    Telefone VARCHAR(15),
    Endereco VARCHAR(255)
);

CREATE TABLE Cliente(
    Codigo INT PRIMARY KEY,
    NomeCliente VARCHAR(100),
    Telefone VARCHAR(15),
    Endereco VARCHAR(255)
);

CREATE TABLE Pedido(
    Codigo INT PRIMARY KEY,
    DataEmissao DATE,
    Status INT,
    ClienteCodigo INT,
    FOREIGN KEY (ClienteCodigo) REFERENCES Cliente(Codigo)
);

CREATE TABLE ItempPedido();