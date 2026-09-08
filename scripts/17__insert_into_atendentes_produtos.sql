-- =========================================
-- 17 - DADOS DE ATENDENTES E PRODUTOS
-- =========================================

-- ATENDENTES

INSERT INTO atendentes (nome, cpf, telefone, email)
SELECT
    'Fernanda Santos',
    '111.222.333-44',
    '(11) 95555-1111',
    'fernanda@clinica.com'
WHERE NOT EXISTS (
    SELECT 1
    FROM atendentes
    WHERE cpf = '111.222.333-44'
);


INSERT INTO atendentes (nome, cpf, telefone, email)
SELECT
    'Lucas Ferreira',
    '555.666.777-88',
    '(11) 94444-2222',
    'lucas@clinica.com'
WHERE NOT EXISTS (
    SELECT 1
    FROM atendentes
    WHERE cpf = '555.666.777-88'
);


-- PRODUTOS

INSERT INTO produtos (tipo, marca, descricao, valor_compra)
SELECT
    'Medicamento',
    'Laboratório Animal',
    'Antibiótico veterinário',
    35.00
WHERE NOT EXISTS (
    SELECT 1
    FROM produtos
    WHERE descricao = 'Antibiótico veterinário'
);


INSERT INTO produtos (tipo, marca, descricao, valor_compra)
SELECT
    'Higiene',
    'PetCare',
    'Shampoo veterinário',
    25.00
WHERE NOT EXISTS (
    SELECT 1
    FROM produtos
    WHERE descricao = 'Shampoo veterinário'
);


INSERT INTO produtos (tipo, marca, descricao, valor_compra)
SELECT
    'Vacina',
    'Laboratório Veterinário',
    'Vacina antirrábica',
    40.00
WHERE NOT EXISTS (
    SELECT 1
    FROM produtos
    WHERE descricao = 'Vacina antirrábica'
);


-- =========================================
-- VINCULAR UM ATENDENTE A UMA CONSULTA
-- =========================================

UPDATE consultas
SET id_atendente = (
    SELECT id_atendente
    FROM atendentes
    WHERE cpf = '111.222.333-44'
)
WHERE id_consulta = (
    SELECT c.id_consulta
    FROM consultas c
    INNER JOIN animais a
        ON c.id_animal = a.id_animal
    WHERE a.nome = 'Rex'
    ORDER BY c.id_consulta
    LIMIT 1
);


-- =========================================
-- INSERIR PRODUTO UTILIZADO NO ATENDIMENTO
-- =========================================

INSERT INTO atendimento_itens (
    id_consulta,
    id_produto,
    tipo_item,
    descricao,
    valor
)
SELECT
    c.id_consulta,
    p.id_produto,
    'PRODUTO',
    p.descricao,
    50.00
FROM consultas c
INNER JOIN animais a
    ON c.id_animal = a.id_animal
INNER JOIN produtos p
    ON p.descricao = 'Antibiótico veterinário'
WHERE a.nome = 'Rex'
  AND NOT EXISTS (
      SELECT 1
      FROM atendimento_itens ai
      WHERE ai.id_consulta = c.id_consulta
        AND ai.id_produto = p.id_produto
  )
LIMIT 1;


-- =========================================
-- INSERIR SERVIÇO UTILIZADO NO ATENDIMENTO
-- =========================================

INSERT INTO atendimento_itens (
    id_consulta,
    id_produto,
    tipo_item,
    descricao,
    valor
)
SELECT
    c.id_consulta,
    NULL,
    'SERVICO',
    'Consulta veterinária',
    100.00
FROM consultas c
INNER JOIN animais a
    ON c.id_animal = a.id_animal
WHERE a.nome = 'Rex'
  AND NOT EXISTS (
      SELECT 1
      FROM atendimento_itens ai
      WHERE ai.id_consulta = c.id_consulta
        AND ai.tipo_item = 'SERVICO'
        AND ai.descricao = 'Consulta veterinária'
  )
LIMIT 1;
