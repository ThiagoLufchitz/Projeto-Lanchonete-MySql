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

CREATE TABLE Pedido(
    Codigo INT PRIMARY KEY,
    DataEmissao DATE,
    Status INT,
    CodigoCliente INT,
    FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
);

CREATE TABLE ItempPedido(
    CodigoPedido INT,
    CodigoLanches INT,
    Quantidade INT,
    PRIMARY KEY (CodigoPedido,CodigoLanches),
    FOREIGN KEY (CodigoPedido) REFERENCES Pedido(Codigo),
    FOREIGN KEY (CodigoLanches) REFERENCES Lanches(Codigo)
);

CREATE TABLE Entregador(
    Codigo INT PRIMARY KEY,
    Nome VARCHAR (100),
    Telefone VARCHAR(15)
);

CREATE TABLE Entrega(
    CodigoPedido INT PRIMARY KEY,
    CodigoEntregador INT,
    FOREIGN KEY (CodigoPedido) REFERENCES Pedido(Codigo),
    FOREIGN KEY (CodigoEntregador) REFERENCES Entregador
);