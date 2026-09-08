CREATE TABLE IF NOT EXISTS animais_vacinas (
    id_animal INTEGER NOT NULL,
    id_vacina INTEGER NOT NULL,
    data_aplicacao DATE NOT NULL,
    proxima_dose DATE,

    PRIMARY KEY (id_animal, id_vacina, data_aplicacao),

    CONSTRAINT fk_animal_vacina_animal
        FOREIGN KEY (id_animal)
        REFERENCES animais(id_animal),

    CONSTRAINT fk_animal_vacina_vacina
        FOREIGN KEY (id_vacina)
        REFERENCES vacinas(id_vacina)
);
