SELECT 
  grupo.id_grupo,
  age.id_age,
  age.titulo,
  age.nombre,
  age.apaterno,
  age.amaterno,
  age.cargo,
  age.deporg,
  age.telefono,
  age.email,
  age.dir,
  age.modifico
FROM
 age
 INNER JOIN grupo ON (age.id_age=grupo.id_user)