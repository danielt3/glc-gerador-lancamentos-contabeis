SELECT
  a.chave,
  a.codigo_externo,
  a.codigo,
  a.descricao
FROM
  plano_contas a
WHERE
  a.empresa = 2
  AND a.sintetica = 'A'
ORDER BY
  a.codigo
