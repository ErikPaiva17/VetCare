CREATE TABLE IF NOT EXISTS tratamentos (
    id_tratamento SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    observacoes VARCHAR(255),
    id_consulta INTEGER NOT NULL,

    CONSTRAINT fk_tratamento_consulta
        FOREIGN KEY (id_consulta)
        REFERENCES consultas(id_consulta)
);
