CREATE TABLE IF NOT EXISTS vacinas (
    id_vacina SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100),
    descricao VARCHAR(255),
    doses INTEGER NOT NULL
);
