SELECT
  a.vinculador,
  b.descricao
FROM
  vinculadores_layout a
  JOIN vinculadores b ON (
    b.chave = a.vinculador)
WHERE
<<<<<<< .mine
  a.layout = 1
=======
  a.layout = 9
>>>>>>> .r115
