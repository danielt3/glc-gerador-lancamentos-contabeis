SELECT
  a.chave,
  a.nome
FROM
  layouts a
  JOIN vinculadores_layout b ON (
    b.layout = a.chave)
WHERE
  a.empresa = 13 AND
  b.vinculador = 6
ORDER BY
  a.nome
