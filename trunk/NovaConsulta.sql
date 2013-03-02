SELECT
  a.vinculador,
  b.descricao
FROM
  vinculadores_layout a
  JOIN vinculadores b ON (
    b.chave = a.vinculador)
WHERE
  a.layout = 18
