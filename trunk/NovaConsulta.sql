SELECT
  a.chave,
  a.codigo_externo,
  a.codigo,
  a.descricao,
  a.sintetica
FROM
  plano_contas a
WHERE
  a.empresa = 2
  AND a.codigo >= '1122'
  AND a.descricao LIKE 'ADIA%'
ORDER BY
  a.codigo
