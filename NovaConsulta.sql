SELECT
  a.chave,
  a.nome
FROM
  layouts a
  JOIN vinculadores_layout b ON (
    b.layout = a.chave)
WHERE
  a.empresa = 2 AND
  b.vinculador = 4
ORDER BY
  a.nome
