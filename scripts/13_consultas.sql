-- ============================================================
-- CONSULTAS DO BANCO DE DADOS - CUIDADOS VETERINÁRIOS
-- ============================================================


-- ============================================================
-- 1. LISTAR TODOS OS TUTORES E SEUS ANIMAIS
-- ============================================================

SELECT
    t.id_tutor,
    t.nome AS tutor,
    a.id_animal,
    a.nome AS animal,
    a.especie,
    a.raca
FROM tutores t
LEFT JOIN animais a
    ON a.id_tutor = t.id_tutor
ORDER BY t.nome, a.nome;


-- ============================================================
-- 2. LISTAR OS ANIMAIS COM SEUS RESPECTIVOS TUTORES
-- ============================================================

SELECT
    a.id_animal,
    a.nome AS animal,
    a.especie,
    a.raca,
    a.sexo,
    a.data_nascimento,
    t.nome AS tutor,
    t.telefone
FROM animais a
INNER JOIN tutores t
    ON a.id_tutor = t.id_tutor
ORDER BY a.nome;


-- ============================================================
-- 3. LISTAR TODAS AS CONSULTAS COM ANIMAL E VETERINÁRIO
-- ============================================================

SELECT
    c.id_consulta,
    c.consulta_de_dados,
    c.horário,
    c.motivo,
    c.diagnóstico,
    a.nome AS animal,
    v.nome AS veterinario,
    v.especialidade
FROM consultas c
INNER JOIN animais a
    ON c.id_animal = a.id_animal
INNER JOIN veterinarios v
    ON c.id_veterinario = v.id_veterinario
ORDER BY c.consulta_de_dados, c.horário;


-- ============================================================
-- 4. LISTAR OS TRATAMENTOS REALIZADOS
-- ============================================================

SELECT
    tr.id_tratamento,
    tr.descrição,
    tr.data_inicio,
    tr.data_fim,
    tr.observações,
    a.nome AS animal,
    c.consulta_de_dados
FROM tratamentos tr
INNER JOIN consultas c
    ON tr.id_consulta = c.id_consulta
INNER JOIN animais a
    ON c.id_animal = a.id_animal
ORDER BY tr.data_inicio;


-- ============================================================
-- 5. LISTAR OS MEDICAMENTOS UTILIZADOS EM CADA TRATAMENTO
-- ============================================================

SELECT
    tr.id_tratamento,
    tr.descrição AS tratamento,
    m.nome AS medicamento,
    tm.dosagem,
    tm.frequência,
    tm.duracao_dias
FROM tratamentos_medicamentos tm
INNER JOIN tratamentos tr
    ON tm.id_tratamento = tr.id_tratamento
INNER JOIN medicamentos m
    ON tm.id_medicamento = m.id_medicamento
ORDER BY tr.id_tratamento, m.nome;


-- ============================================================
-- 6. LISTAR AS VACINAS APLICADAS EM CADA ANIMAL
-- ============================================================

SELECT
    a.id_animal,
    a.nome AS animal,
    v.nome AS vacina,
    v.produtor,
    av.data_aplicacao,
    av.dose_proximal
FROM animais_vacinas av
INNER JOIN animais a
    ON av.id_animal = a.id_animal
INNER JOIN vacinas v
    ON av.id_vacina = v.id_vacina
ORDER BY a.nome, av.data_aplicacao;


-- ============================================================
-- 7. HISTÓRICO COMPLETO DE UM ANIMAL
-- ============================================================

SELECT
    a.nome AS animal,
    t.nome AS tutor,
    c.consulta_de_dados,
    c.horário,
    c.motivo,
    c.diagnóstico,
    v.nome AS veterinario,
    tr.descrição AS tratamento,
    tr.data_inicio,
    tr.data_fim,
    tr.observações
FROM animais a
INNER JOIN tutores t
    ON a.id_tutor = t.id_tutor
LEFT JOIN consultas c
    ON c.id_animal = a.id_animal
LEFT JOIN veterinarios v
    ON c.id_veterinario = v.id_veterinario
LEFT JOIN tratamentos tr
    ON tr.id_consulta = c.id_consulta
WHERE a.nome = 'Rex'
ORDER BY c.consulta_de_dados;


-- ============================================================
-- 8. LISTAR VETERINÁRIOS POR ESPECIALIDADE
-- ============================================================

SELECT
    id_veterinario,
    nome,
    crmv,
    telefone,
    email,
    especialidade
FROM veterinarios
ORDER BY especialidade, nome;


-- ============================================================
-- 9. LISTAR TODOS OS ANIMAIS DE UMA ESPÉCIE
-- ============================================================

SELECT
    a.id_animal,
    a.nome,
    a.especie,
    a.raca,
    a.sexo,
    t.nome AS tutor
FROM animais a
INNER JOIN tutores t
    ON a.id_tutor = t.id_tutor
WHERE a.especie = 'Cachorro'
ORDER BY a.nome;


-- ============================================================
-- 10. LISTAR TRATAMENTOS E SEUS MEDICAMENTOS
-- ============================================================

SELECT
    a.nome AS animal,
    tr.descrição AS tratamento,
    m.nome AS medicamento,
    tm.dosagem,
    tm.frequência,
    tm.duracao_dias
FROM tratamentos tr
INNER JOIN consultas c
    ON tr.id_consulta = c.id_consulta
INNER JOIN animais a
    ON c.id_animal = a.id_animal
INNER JOIN tratamentos_medicamentos tm
    ON tr.id_tratamento = tm.id_tratamento
INNER JOIN medicamentos m
    ON tm.id_medicamento = m.id_medicamento
ORDER BY a.nome, tr.data_inicio;


-- ============================================================
-- FIM DAS CONSULTAS
-- ============================================================
