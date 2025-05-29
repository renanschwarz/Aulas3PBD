CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Especialidade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE Profissional (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    especialidade_id INT,
    data_contratacao DATE,
    FOREIGN KEY (especialidade_id) REFERENCES Especialidade(id)
);

CREATE TABLE Servico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    duracao_minutos INT,
    profissional_id INT,
    FOREIGN KEY (profissional_id) REFERENCES Profissional(id)
);

CREATE TABLE Pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_pago DECIMAL(10,2) NOT NULL,
    metodo_pagamento VARCHAR(50),
    status VARCHAR(20) DEFAULT 'confirmado',
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (servico_id) REFERENCES Servico(id)
);
