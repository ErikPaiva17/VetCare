CREATE TABLE IF NOT EXISTS consultas (
    id_consulta SERIAL PRIMARY KEY,
    data_consulta DATE NOT NULL,
    horario TIME NOT NULL,
    motivo VARCHAR(255),
    diagnostico VARCHAR(255),
    id_animal INTEGER NOT NULL,
    id_veterinario INTEGER NOT NULL,

    CONSTRAINT fk_consulta_animal
        FOREIGN KEY (id_animal)
        REFERENCES animais(id_animal),

    CONSTRAINT fk_consulta_veterinario
        FOREIGN KEY (id_veterinario)
        REFERENCES veterinarios(id_veterinario)
);
