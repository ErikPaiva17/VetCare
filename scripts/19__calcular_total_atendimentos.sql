-- =========================================
-- 19 - TOTAL DOS ATENDIMENTOS
-- =========================================

SELECT
    c.id_consulta,
    c.data_consulta,
    a.nome AS animal,
    t.nome AS tutor,
    v.nome AS veterinario,
    COALESCE(SUM(ai.valor), 0) AS valor_total
FROM consultas c

INNER JOIN animais a
    ON c.id_animal = a.id_animal

INNER JOIN tutores t
    ON a.id_tutor = t.id_tutor

INNER JOIN veterinarios v
    ON c.id_veterinario = v.id_veterinario

LEFT JOIN atendimento_itens ai
    ON c.id_consulta = ai.id_consulta

GROUP BY
    c.id_consulta,
    c.data_consulta,
    a.nome,
    t.nome,
    v.nome

ORDER BY
    c.data_consulta,
    c.id_consulta;
