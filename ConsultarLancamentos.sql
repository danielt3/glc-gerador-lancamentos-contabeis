SELECT
  a.*,
  b.descricao AS no_vinculador
FROM
  lancamentos a
  LEFT JOIN vinculadores b ON (
    a.vinculador = b.chave)
WHERE
  a.empresa = 9
  AND a.layout = 9
