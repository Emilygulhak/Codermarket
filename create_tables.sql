CREATE DATABASE CoderMarket;

use CoderMarket;

CREATE TABLE endereco (
	id_endereco INT AUTO_INCREMENT PRIMARY KEY,
	logadouro VARCHAR(255) NOT NULL,
    cep VARCHAR(15) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE pagamento (
	id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    forma_de_pagamento VARCHAR(50),
	status_do_pagamento VARCHAR(15)
);


CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	cpf VARCHAR(20) NOT NULL,
	email VARCHAR(255),
	telefone VARCHAR(25),
	primeiro_nome VARCHAR(255),
    sobrenome VARCHAR(255),
-- CRIAR OS RELACIONAMENTOS
	endereco_cliente INT, -- ENDEREÇO
	FOREIGN KEY (endereco_cliente) REFERENCES endereco(id_endereco),
    pagamento_cliente INT, -- pagamento
    FOREIGN KEY (pagamento_cliente) REFERENCES pagamento(id_pagamento),
    pedido_cliente INT,
	FOREIGN KEY (pedido_cliente) REFERENCES pedido(id_pedido)
);

CREATE TABLE produto (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
	valor INT,
    categoria_produto VARCHAR(20),
	codigo_do_produto VARCHAR(20),
	descricao VARCHAR(225),
	pedido_produto INT,-- Pedido
    FOREIGN KEY (pedido_produto) REFERENCES pedido(id_pedido),
	estoque_produto INT, -- estoque
	FOREIGN KEY (estoque_produto) REFERENCES estoque(id_estoque)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_status_pedido INT, -- Define a coluna antes de usá-la como chave estrangeira
    FOREIGN KEY (id_status_pedido) REFERENCES status_do_pedido(id_status_pedido)
);

CREATE TABLE status_do_pedido (
	id_status_pedido INT AUTO_INCREMENT PRIMARY KEY,
    status_do_pedido BOOLEAN,
	data_do_pedido DATETIME
);

CREATE TABLE fornecedor (
	id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(50),
    nome VARCHAR(255),
	email VARCHAR(255),
    telefone VARCHAR(255),
    endereco VARCHAR(255)
);

CREATE TABLE estoque (
	id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT,
    localizacao VARCHAR(255),
	estoque_fornecedor INT,
    FOREIGN KEY (estoque_fornecedor) REFERENCES fornecedor(id_fornecedor)

);