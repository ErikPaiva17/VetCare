-- Remove o relacionamento do animal com a vacina
DELETE FROM animais_vacinas
WHERE id_animal = (
    SELECT a.id_animal
    FROM animais a
    JOIN tutores t ON t.id_tutor = a.id_tutor
    WHERE a.nome = 'Rex'
      AND t.cpf = '123.456.789-00'
)
AND id_vacina = (
    SELECT id_vacina
    FROM vacinas
    WHERE nome = 'Vacina Antirrábica'
)
AND data_aplicacao = '2026-09-01';
