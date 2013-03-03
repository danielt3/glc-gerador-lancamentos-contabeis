SELECT
  a.chave,
  a.nome
FROM
  layouts a
  JOIN vinculadores_layout b ON (
    b.layout = a.chave)
WHERE
  a.empresa = 19 AND
  b.vinculador = 11
ORDER BY
  a.nome
