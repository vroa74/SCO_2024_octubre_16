SELECT
co.id AS "Folio",
co.fcap AS "Fecha de captura",
co.frec AS "Fecha de recepción",
co.ncor AS "Nivel de correspondencia",
co.tcor AS "Tipo de correspondencia",
co.ccor AS "Clasificación de correspondencia",
co.fofi AS "Fecha de oficio",
co.nofi AS "Numero de Oficio",
co.nhoj AS "Numero de hojas",
co.rem_nombre AS "Nombre del remitente",
co.rem_cargo AS "cargo del remitente",
co.rem_deporg AS "Depto. U org. Del remitente",
co.rem_dir AS "Dirección del Remitente",
co.des AS "Descripcion de Oficio",
co.seguimiento AS "Seguimiento",
co.tur_nom AS "Nombre turnado",
co.tur_cargo AS "Cargo turnado",
co.tur_deporg AS "Depto. U organ. Del turnado",
co.modifico
FROM
co
WHERE
    (co.archivo = "0")