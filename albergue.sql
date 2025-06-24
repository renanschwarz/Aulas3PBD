CREATE DATABASE IF NOT EXISTS albergue;
USE albergue;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf CHAR(11) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE Quarto (
    id_quarto INT PRIMARY KEY AUTO_INCREMENT,
    capacidade INT CHECK (capacidade IN (4, 8, 12)),
    possui_banheiro BOOLEAN
);

CREATE TABLE Vaga (
    id_vaga INT PRIMARY KEY AUTO_INCREMENT,
    id_quarto INT,
    tipo_cama ENUM('beliche_superior', 'beliche_inferior', 'comum'),
    perto_janela BOOLEAN,
    perto_porta BOOLEAN,
    sol_da_manha BOOLEAN,
    pega_sol BOOLEAN,
    FOREIGN KEY (id_quarto) REFERENCES Quarto(id_quarto)
);

CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_inicio DATETIME,
    data_fim DATETIME,
    data_reserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('ativa', 'cancelada') DEFAULT 'ativa',
    pagamento_confirmado BOOLEAN,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Reserva_Vaga (
    id_reserva INT,
    id_vaga INT,
    PRIMARY KEY (id_reserva, id_vaga),
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
    FOREIGN KEY (id_vaga) REFERENCES Vaga(id_vaga)
);

INSERT INTO Cliente (nome, cpf, email, telefone) VALUES ('João Silva', '12345678901', 'joao@email.com', '21999999999');

INSERT INTO Quarto (capacidade, possui_banheiro) VALUES (4, TRUE);

INSERT INTO Vaga (id_quarto, tipo_cama, perto_janela, perto_porta, sol_da_manha, pega_sol)
VALUES (1, 'beliche_inferior', TRUE, FALSE, TRUE, TRUE);

INSERT INTO Reserva (id_cliente, data_inicio, data_fim, pagamento_confirmado)
VALUES (1, '2025-07-01 12:00:00', '2025-07-05 12:00:00', TRUE);

INSERT INTO Reserva_Vaga (id_reserva, id_vaga) VALUES (1, 1);

UPDATE Cliente SET telefone = '21988887777' WHERE id_cliente = 1;

UPDATE Reserva SET status = 'cancelada' WHERE id_reserva = 1;

DELETE FROM Cliente WHERE id_cliente = 1;

DELETE FROM Reserva WHERE id_reserva = 1;

SELECT * FROM Cliente;

SELECT * FROM Reserva;

SELECT * FROM Vaga;

SELECT * FROM Cliente WHERE id_cliente = 1;

SELECT * FROM Reserva WHERE id_reserva = 1;

SELECT V.*
FROM Vaga V
LEFT JOIN Reserva_Vaga RV ON V.id_vaga = RV.id_vaga
LEFT JOIN Reserva R ON R.id_reserva = RV.id_reserva
    AND R.status = 'ativa'
    AND '2025-07-01 12:00:00' BETWEEN R.data_inicio AND R.data_fim
WHERE R.id_reserva IS NULL;

SELECT V.*
FROM Vaga V
JOIN Reserva_Vaga RV ON V.id_vaga = RV.id_vaga
JOIN Reserva R ON R.id_reserva = RV.id_reserva
WHERE R.status = 'ativa'
  AND '2025-07-01 12:00:00' BETWEEN R.data_inicio AND R.data_fim;
