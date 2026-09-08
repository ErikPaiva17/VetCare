-- =========================================
-- 16 - ITENS UTILIZADOS NOS ATENDIMENTOS
-- =========================================

CREATE TABLE IF NOT EXISTS atendimento_itens (
    id_item SERIAL PRIMARY KEY,
    id_consulta INTEGER NOT NULL,
    id_produto INTEGER,
    tipo_item VARCHAR(20) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0),

    CONSTRAINT fk_item_consulta
        FOREIGN KEY (id_consulta)
        REFERENCES consultas(id_consulta),

    CONSTRAINT fk_item_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto),

    CONSTRAINT ck_tipo_item
        CHECK (tipo_item IN ('PRODUTO', 'SERVICO'))
);
