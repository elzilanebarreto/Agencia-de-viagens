-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Reserva (
id_reserva INTEGER PRIMARY KEY,
data_reserva DATETIME,
id_cliente INTEGER
)

CREATE TABLE Destino (
id_destino INTEGER PRIMARY KEY,
cidade VARCHAR(100),
país VARCHAR(100),
descricao VARCHAR(100)
)

CREATE TABLE Pacote (
id_pacote INTEGER PRIMARY KEY,
preco DECIMAL(5,2),
duracao_dias INTEGER,
descricao VARCHAR(10),
quantidade_disponivel INTEGER,
id_destino INTEGER,
id_reserva INTEGER,
FOREIGN KEY(id_destino) REFERENCES Destino (id_destino),
FOREIGN KEY(id_reserva) REFERENCES Reserva (id_reserva)
)

CREATE TABLE Pagamento (
metodo VARCHAR(11),
data_pagamento DATETIME,
id_pagamento INTEGER PRIMARY KEY,
total DECIMAL(5,2),
stauts VARCHAR(15),
id_cliente INTEGER,
id_pacote INTEGER,
FOREIGN KEY(id_pacote) REFERENCES Pacote (id_pacote)
)

CREATE TABLE Cliente (
id_cliente INTEGER PRIMARY KEY,
nome_cliente VARCHAR(100),
endereco VARCHAR(150),
cpf VARCHAR(10),
data_cadastro DATETIME,
senha VARCHAR(10),
email VARCHAR(150),
telefone VARCHAR(15)
)

ALTER TABLE Reserva ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
ALTER TABLE Pagamento ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
