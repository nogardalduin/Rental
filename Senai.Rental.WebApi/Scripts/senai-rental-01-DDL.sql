CREATE DATABASE M_Rental;
GO

USE M_Rental;
GO

CREATE TABLE EMPRESA(
	idEmpresa SMALLINT PRIMARY KEY IDENTITY(1,1),
	nomeEmpresa VARCHAR(20) NOT NULL UNIQUE
);
GO

CREATE TABLE MARCA(
	idMarca SMALLINT PRIMARY KEY IDENTITY(1,1),
	nomeMarca VARCHAR(20) NOT NULL UNIQUE
);
GO

CREATE TABLE MODELO(
	idModelo INT PRIMARY KEY IDENTITY(1,1),
	idMarca SMALLINT FOREIGN KEY REFERENCES MARCA(idMarca),
	nomeModelo VARCHAR(20) NOT NULL
);
GO

CREATE TABLE CLIENTE(
	idCliente INT PRIMARY KEY IDENTITY(1,1),
	nomeCliente VARCHAR(20) NOT NULL,
	sobrenomeCliente VARCHAR(20) NOT NULL,
	cpfCliente VARCHAR(10) NOT NULL UNIQUE
);
GO

CREATE TABLE ALUGUEL(
	idAluguel INT PRIMARY KEY IDENTITY(1,1),
	idCliente INT FOREIGN KEY REFERENCES CLIENTE(idCliente),
	dataRetirada DateTime,
	dataDevolucao DateTime
);
GO

CREATE TABLE VEICULO(
	idVeiculo INT PRIMARY KEY IDENTITY(1,1),
	idEmpresa SMALLINT FOREIGN KEY REFERENCES EMPRESA(idEmpresa),
	idModelo INT FOREIGN KEY REFERENCES MODELO(idModelo),
	idAluguel INT FOREIGN KEY REFERENCES ALUGUEL(idAluguel),
	placaVeiculo VARCHAR(7) NOT NULL,
);
GO

