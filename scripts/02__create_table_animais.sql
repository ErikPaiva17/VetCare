CREATE TABLE IF NOT EXISTS animais (
    id_animal SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raca VARCHAR(100),
    sexo VARCHAR(10),
    data_nascimento DATE,
    id_tutor INTEGER NOT NULL,

    CONSTRAINT fk_animal_tutor
        FOREIGN KEY (id_tutor)
        REFERENCES tutores(id_tutor)
);
