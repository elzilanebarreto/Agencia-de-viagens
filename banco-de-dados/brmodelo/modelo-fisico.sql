-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

CREATE TABLE Destino (
cidade VARCHAR(100),
descricao VARCHAR(10),
pa�s VARCHAR(100),
nome_destino VARCHAR(100),
id_destino INTEGER PRIMARY KEY
);

CREATE TABLE Pacote (
descricao VARCHAR(10),
id_pacote INTEGER PRIMARY KEY,
preco DECIMAL(5,2),
id_destino INTEGER,
FOREIGN KEY(id_destino) REFERENCES Destino (id_destino)
);

CREATE TABLE Pagamento (
metodo VARCHAR(11),
data_pagamento DATETIME,
id_pagamento INTEGER PRIMARY KEY,
total DECIMAL(5,2),
stauts VARCHAR(15),
id_cliente INTEGER,
id_reserva INTEGER
);

CREATE TABLE Reserva_Pacote (
id_reserva INTEGER,
id_pacote INTEGER,
quantidade INTEGER,
FOREIGN KEY(id_pacote) REFERENCES Pacote (id_pacote)
);

CREATE TABLE Cliente (
email VARCHAR(150),
senha VARCHAR(10),
id_cliente INTEGER PRIMARY KEY,
nome_cliente VARCHAR(100),
endereco VARCHAR(150),
cpf VARCHAR(10),
data_cadastro DATETIME
);

CREATE TABLE Reserva (
id_pacote VARCHAR(10),
data_reserva DATETIME,
status VARCHAR(15),
id_reserva INTEGER PRIMARY KEY,
id_cliente INTEGER,
FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
);

ALTER TABLE Pagamento ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente);
ALTER TABLE Pagamento ADD FOREIGN KEY(id_reserva) REFERENCES Reserva (id_reserva);
ALTER TABLE Reserva_Pacote ADD FOREIGN KEY(id_reserva) REFERENCES Reserva (id_reserva);
