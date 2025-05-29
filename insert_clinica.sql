USE sistema_agendamentos;

INSERT INTO Cliente (nome, email, telefone) VALUES 
('Lucas Andrade', 'lucas@email.com', '21999990001'),
('Mariana Lima', 'mariana@email.com', '21999990002');

INSERT INTO Especialidade (nome, descricao) VALUES 
('Cabeleireiro', 'Serviços de corte, coloração e hidratação capilar'),
('Manicure', 'Cuidados com unhas, cutículas e esmaltação'),
('Massoterapeuta', 'Terapias corporais e massagens relaxantes');

INSERT INTO Profissional (nome, email, telefone, especialidade_id, data_contratacao) VALUES 
('Bruno Souza', 'bruno@email.com', '21999990003', 1, '2024-01-15'),
('Camila Rocha', 'camila@email.com', '21999990004', 2, '2024-02-20'),
('Renata Dias', 'renata@email.com', '21999990005', 3, '2024-03-05');

INSERT INTO Servico (nome, descricao, preco, duracao_minutos, profissional_id) VALUES 
('Corte Masculino', 'Corte de cabelo para homens', 40.00, 30, 1),
('Corte Feminino', 'Corte de cabelo para mulheres', 60.00, 45, 1),
('Esmaltação Completa', 'Limpeza, lixamento e esmaltação', 35.00, 30, 2),
('Massagem Relaxante', 'Sessão de massagem para relaxamento muscular', 90.00, 60, 3);

INSERT INTO Pagamento (cliente_id, servico_id, valor_pago, metodo_pagamento, status) VALUES 
(1, 1, 40.00, 'pix', 'confirmado'),
(2, 4, 90.00, 'cartao', 'confirmado');
