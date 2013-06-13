SELECT
  MAX(CAST(codigo_externo AS INT)) as codigo
FROM
  plano_contas a
WHERE
  empresa = 3 AND
  codigo_externo <= '999999'
