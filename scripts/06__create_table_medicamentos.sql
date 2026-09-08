CREATE TABLE IF NOT EXISTS medicamentos (
    id_medicamento SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    principio_ativo VARCHAR(150) NOT NULL,
    fabricante VARCHAR(100),
    dosagem VARCHAR(50),
    observacoes VARCHAR(255)
);
