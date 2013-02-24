select
  CHAVE,
  CODIGO_EXTERNO as codigo,
  CODIGO as classificacao,
  DESCRICAO as descricao,
  SINTETICA as sintetica
from
  PLANO_CONTAS
where
  EMPRESA = 13
