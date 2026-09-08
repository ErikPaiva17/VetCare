CREATE TABLE IF NOT EXISTS veterinarios (
    id_veterinario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crmv VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    especialidade VARCHAR(100)
);
