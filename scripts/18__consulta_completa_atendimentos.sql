-- =========================================
-- 18 - CONSULTA COMPLETA DOS ATENDIMENTOS
-- =========================================

SELECT
    c.id_consulta,
    c.data_consulta,
    c.horario,

    t.nome AS tutor,
    t.telefone AS telefone_tutor,

    a.nome AS animal,
    a.especie,
    a.raca,

    at.nome AS atendente,

    v.nome AS veterinario,
    v.especialidade,

    c.motivo,
    c.diagnostico,

    ai.tipo_item,
    ai.descricao AS item_utilizado,
    ai.valor

FROM consultas c

INNER JOIN animais a
    ON c.id_animal = a.id_animal

INNER JOIN tutores t
    ON a.id_tutor = t.id_tutor

INNER JOIN veterinarios v
    ON c.id_veterinario = v.id_veterinario

LEFT JOIN atendentes at
    ON c.id_atendente = at.id_atendente

LEFT JOIN atendimento_itens ai
    ON c.id_consulta = ai.id_consulta

ORDER BY
    c.data_consulta,
    c.horario,
    a.nome;
