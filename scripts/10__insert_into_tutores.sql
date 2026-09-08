-- ============================================
-- INSERÇÃO DE TUTORES
-- ============================================

INSERT INTO tutores (nome, cpf, telefone, email)
SELECT 'João da Silva', '123.456.789-00', '(11) 99999-1111', 'joao@email.com'
WHERE NOT EXISTS (
    SELECT 1 FROM tutores WHERE cpf = '123.456.789-00'
);

INSERT INTO tutores (nome, cpf, telefone, email)
SELECT 'Maria Oliveira', '987.654.321-00', '(11) 98888-2222', 'maria@email.com'
WHERE NOT EXISTS (
    SELECT 1 FROM tutores WHERE cpf = '987.654.321-00'
);


-- ============================================
-- INSERÇÃO DE ANIMAIS
-- ============================================

INSERT INTO animais (nome, especie, raca, sexo, data_nascimento, id_tutor)
SELECT 'Rex', 'Cachorro', 'Labrador', 'Macho', '2020-05-10', id_tutor
FROM tutores
WHERE cpf = '123.456.789-00'
AND NOT EXISTS (
    SELECT 1
    FROM animais
    WHERE nome = 'Rex'
      AND id_tutor = tutores.id_tutor
);

INSERT INTO animais (nome, especie, raca, sexo, data_nascimento, id_tutor)
SELECT 'Mel', 'Gato', 'Siamês', 'Fêmea', '2021-08-15', id_tutor
FROM tutores
WHERE cpf = '987.654.321-00'
AND NOT EXISTS (
    SELECT 1
    FROM animais
    WHERE nome = 'Mel'
      AND id_tutor = tutores.id_tutor
);


-- ============================================
-- INSERÇÃO DE VETERINÁRIOS
-- ============================================

INSERT INTO veterinarios (nome, crmv, telefone, email, especialidade)
SELECT 'Dr. Carlos Mendes', 'CRMV-SP-12345', '(11) 97777-3333',
       'carlos@clinica.com', 'Clínica Geral'
WHERE NOT EXISTS (
    SELECT 1 FROM veterinarios WHERE crmv = 'CRMV-SP-12345'
);

INSERT INTO veterinarios (nome, crmv, telefone, email, especialidade)
SELECT 'Dra. Ana Souza', 'CRMV-SP-67890', '(11) 96666-4444',
       'ana@clinica.com', 'Dermatologia Veterinária'
WHERE NOT EXISTS (
    SELECT 1 FROM veterinarios WHERE crmv = 'CRMV-SP-67890'
);


-- ============================================
-- INSERÇÃO DE CONSULTAS
-- ============================================

INSERT INTO consultas (
    data_consulta,
    horario,
    motivo,
    diagnostico,
    id_animal,
    id_veterinario
)
SELECT
    '2026-09-01',
    '09:00',
    'Consulta de rotina',
    'Animal saudável',
    a.id_animal,
    v.id_veterinario
FROM animais a
JOIN tutores t ON t.id_tutor = a.id_tutor
JOIN veterinarios v ON v.crmv = 'CRMV-SP-12345'
WHERE a.nome = 'Rex'
  AND t.cpf = '123.456.789-00'
  AND NOT EXISTS (
      SELECT 1
      FROM consultas c
      WHERE c.data_consulta = '2026-09-01'
        AND c.horario = '09:00'
        AND c.id_animal = a.id_animal
        AND c.id_veterinario = v.id_veterinario
  );


-- ============================================
-- INSERÇÃO DE TRATAMENTOS
-- ============================================

INSERT INTO tratamentos (
    descricao,
    data_inicio,
    data_fim,
    observacoes,
    id_consulta
)
SELECT
    'Tratamento preventivo',
    '2026-09-01',
    '2026-09-10',
    'Acompanhamento durante o tratamento',
    c.id_consulta
FROM consultas c
JOIN animais a ON a.id_animal = c.id_animal
WHERE a.nome = 'Rex'
  AND c.data_consulta = '2026-09-01'
  AND NOT EXISTS (
      SELECT 1
      FROM tratamentos tr
      WHERE tr.descricao = 'Tratamento preventivo'
        AND tr.id_consulta = c.id_consulta
  );


-- ============================================
-- INSERÇÃO DE MEDICAMENTOS
-- ============================================

INSERT INTO medicamentos (
    nome,
    principio_ativo,
    fabricante,
    dosagem,
    observacoes
)
SELECT
    'Antibiótico Veterinário',
    'Amoxicilina',
    'Laboratório Veterinário',
    '250 mg',
    'Administrar conforme orientação veterinária'
WHERE NOT EXISTS (
    SELECT 1 FROM medicamentos
    WHERE nome = 'Antibiótico Veterinário'
);

INSERT INTO medicamentos (
    nome,
    principio_ativo,
    fabricante,
    dosagem,
    observacoes
)
SELECT
    'Anti-inflamatório Veterinário',
    'Meloxicam',
    'Laboratório Animal',
    '0,5 mg',
    'Uso sob orientação veterinária'
WHERE NOT EXISTS (
    SELECT 1 FROM medicamentos
    WHERE nome = 'Anti-inflamatório Veterinário'
);


-- ============================================
-- RELACIONAMENTO ENTRE TRATAMENTO E MEDICAMENTO
-- ============================================

INSERT INTO tratamentos_medicamentos (
    id_tratamento,
    id_medicamento,
    dosagem,
    frequencia,
    duracao_dias
)
SELECT
    tr.id_tratamento,
    m.id_medicamento,
    '250 mg',
    'A cada 12 horas',
    7
FROM tratamentos tr
JOIN consultas c ON c.id_consulta = tr.id_consulta
JOIN medicamentos m ON m.nome = 'Antibiótico Veterinário'
WHERE tr.descricao = 'Tratamento preventivo'
  AND NOT EXISTS (
      SELECT 1
      FROM tratamentos_medicamentos tm
      WHERE tm.id_tratamento = tr.id_tratamento
        AND tm.id_medicamento = m.id_medicamento
  );


-- ============================================
-- INSERÇÃO DE VACINAS
-- ============================================

INSERT INTO vacinas (
    nome,
    fabricante,
    descricao,
    doses
)
SELECT
    'Vacina Antirrábica',
    'Laboratório Animal',
    'Proteção contra raiva',
    1
WHERE NOT EXISTS (
    SELECT 1 FROM vacinas
    WHERE nome = 'Vacina Antirrábica'
);

INSERT INTO vacinas (
    nome,
    fabricante,
    descricao,
    doses
)
SELECT
    'Vacina Polivalente',
    'Laboratório Veterinário',
    'Proteção contra diversas doenças',
    3
WHERE NOT EXISTS (
    SELECT 1 FROM vacinas
    WHERE nome = 'Vacina Polivalente'
);


-- ============================================
-- RELACIONAMENTO ENTRE ANIMAL E VACINA
-- ============================================

INSERT INTO animais_vacinas (
    id_animal,
    id_vacina,
    data_aplicacao,
    proxima_dose
)
SELECT
    a.id_animal,
    v.id_vacina,
    '2026-09-01',
    '2027-09-01'
FROM animais a
JOIN tutores t ON t.id_tutor = a.id_tutor
JOIN vacinas v ON v.nome = 'Vacina Antirrábica'
WHERE a.nome = 'Rex'
  AND t.cpf = '123.456.789-00'
  AND NOT EXISTS (
      SELECT 1
      FROM animais_vacinas av
      WHERE av.id_animal = a.id_animal
        AND av.id_vacina = v.id_vacina
        AND av.data_aplicacao = '2026-09-01'
  );
