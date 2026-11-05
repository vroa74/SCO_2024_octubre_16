SELECT 
  cat_gru.id_grupo,
  cat_gru.GRUPO,
  cat_gru.DESCRIPCION,
  grupo.id_user
FROM
 age
 INNER JOIN grupo ON (age.id_age=grupo.id_user)
 INNER JOIN cat_gru ON (cat_gru.id_grupo=grupo.id_grupo)
