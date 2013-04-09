SELECT
  a.chave,
  b.debitar AS chave_debitar,
  c.codigo_externo AS debitar,
  c.descricao AS no_debitar,
  b.creditar AS chave_creditar,
  d.codigo_externo AS creditar,
  d.descricao AS no_creditar,
  a.data_pag AS data_pag,
  b.descricao AS no_vinculador,
  a.data AS data,
  a.entrada AS entrada,
  a.saida AS saida,
  a.historico AS historico,
  a.vinculador AS vinculador,
  CASE
    WHEN NOT a.historico IS NULL THEN a.historico
    WHEN NOT a.pago_por IS NULL THEN 'Pago por ' || a.pago_por
    WHEN NOT a.fornecedor IS NULL THEN 'Pago a ' || a.fornecedor
    WHEN NOT a.cliente IS NULL THEN 'Pago por ' || a.cliente
    WHEN NOT b.historico IS NULL THEN b.historico
    ELSE ''
  END as historico
FROM
  lancamentos a
  LEFT JOIN vinculadores b ON (
    b.chave = a.vinculador)
  LEFT JOIN plano_contas c ON (
    c.chave = b.debitar)
  LEFT JOIN plano_contas d ON (
    d.chave = b.creditar)
WHERE
  a.empresa = 1
  AND a.layout = 1

