SELECT
  a.chave,
  a.nome
FROM
  layouts a
  LEFT JOIN vinculadores_layout b ON (
    b.layout = a.chave AND
    b.vinculador = 2)
WHERE
  a.empresa = 2
ORDER BY
  a.nome
