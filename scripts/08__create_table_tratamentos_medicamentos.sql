CREATE TABLE IF NOT EXISTS tratamentos_medicamentos (
    id_tratamento INTEGER NOT NULL,
    id_medicamento INTEGER NOT NULL,
    dosagem VARCHAR(100),
    frequencia VARCHAR(100),
    duracao_dias INTEGER,

    PRIMARY KEY (id_tratamento, id_medicamento),

    CONSTRAINT fk_tratamento_medicamento_tratamento
        FOREIGN KEY (id_tratamento)
        REFERENCES tratamentos(id_tratamento),

    CONSTRAINT fk_tratamento_medicamento_medicamento
        FOREIGN KEY (id_medicamento)
        REFERENCES medicamentos(id_medicamento)
);
