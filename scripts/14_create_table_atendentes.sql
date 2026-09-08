-- =========================================
-- 14 - CRIAÇÃO DA TABELA DE ATENDENTES
-- =========================================

CREATE TABLE atendentes (
    id_atendente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

-- =========================================
-- RELACIONAMENTO ENTRE ATENDENTES E CONSULTAS
-- =========================================

ALTER TABLE consultas
ADD COLUMN id_atendente INTEGER;

ALTER TABLE consultas
ADD CONSTRAINT fk_consultas_atendentes
FOREIGN KEY (id_atendente)
REFERENCES atendentes(id_atendente);
