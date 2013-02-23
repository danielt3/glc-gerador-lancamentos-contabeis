SELECT
  a.chave AS chave,
  a.codigo AS codigo,
  a.descricao,
  b.chave as id_debitar,
  b.codigo_externo AS debitar,
  b.codigo AS cd_debitar,
  b.descricao AS no_debitar,
  c.chave AS id_creditar,
  c.codigo_externo AS creditar,
  c.codigo AS cd_creditar,
  c.descricao AS no_creditar,
  a.historico AS historico
FROM
  vinculadores a
  LEFT JOIN plano_contas b ON (
    b.empresa = a.empresa AND
    b.chave = a.debitar)
  LEFT JOIN plano_contas c ON (
    c.empresa = a.empresa AND
    c.chave = a.creditar)
where
  a.empresa = 11
