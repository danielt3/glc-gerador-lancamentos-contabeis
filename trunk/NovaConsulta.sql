SELECT
  (1) as indice,
  chave,
  nome
FROM
  layout_campos
WHERE
  layout = 0
  AND empresa = 21
  AND nome = 'data'
UNION
SELECT
  (2) as indice,
  chave,
  nome
FROM
  layout_campos
WHERE
  layout = 0
  AND empresa = 21
  AND nome <> 'data'
  AND nome <> 'vinculador'
UNION
SELECT
  (3) as indice,
  chave,
  nome
FROM
  layout_campos
WHERE
  layout = 0
  AND empresa = 21
  AND nome = 'vinculador'
ORDER BY 1, 2
