SELECT
  a.chave,
  a.nome
FROM
  layouts a
  JOIN vinculadores_layout b ON (
    b.layout = a.chave)
WHERE
  a.empresa = 1 AND
  b.vinculador = 1
ORDER BY
  a.nome
