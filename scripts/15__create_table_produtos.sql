CREATE TABLE IF NOT EXISTS produtos (
    id_produto SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor_compra DECIMAL(10,2) NOT NULL CHECK (valor_compra >= 0)
);
