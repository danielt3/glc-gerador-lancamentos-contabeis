SELECT
  a.chave,
  a.codigo_externo,
  a.codigo,
  a.descricao,
  a.sintetica
FROM
  plano_contas a
WHERE
  a.empresa = 1
  AND a.codigo >= '213'
ORDER BY
  a.codigo
