SELECT
  a.chave,
  b.debitar AS chave_debitar,
  c.codigo_externo AS debitar,
  c.descricao AS no_debitar,
  b.creditar AS chave_creditar,
  d.codigo_externo AS creditar,
  d.descricao AS no_creditar,
  CASE
    WHEN COALESCE(a.valor, 0) > 0 THEN a.valor
    WHEN COALESCE(a.entrada, 0) > 0 THEN a.entrada
    WHEN COALESCE(a.saida, 0) > 0 THEN a.saida
    ELSE 0
  END as valor,
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
  JOIN vinculadores b ON (
    b.chave = a.vinculador)
  JOIN plano_contas c ON (
    c.chave = b.debitar)
  JOIN plano_contas d ON (
    d.chave = b.creditar)
WHERE
  a.empresa = 2

