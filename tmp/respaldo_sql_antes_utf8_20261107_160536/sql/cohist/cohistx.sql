SELECT
co_hist.id AS "Folio",
co_hist.fcap AS "Fecha de captura",
co_hist.frec AS "Fecha de recepción",
co_hist.ncor AS "Nivel de correspondencia",
co_hist.tcor AS "Tipo de correspondencia",
co_hist.ccor AS "Clasificación de correspondencia",
co_hist.fofi AS "Fecha de oficio",
co_hist.nofi AS "Numero de Oficio",
co_hist.nhoj AS "Numero de hojas",
co_hist.rem_nombre AS "Nombre del remitente",
co_hist.rem_cargo AS "cargo del remitente",
co_hist.rem_deporg AS "Depto. U org. Del remitente",
co_hist.rem_dir AS "Dirección del Remitente",
co_hist.des AS "Descripcion de Oficio",
co_hist.seguimiento AS "Seguimiento",
co_hist.tur_nom AS "Nombre turnado",
co_hist.tur_cargo AS "Cargo turnado",
co_hist.tur_deporg AS "Depto. U organ. Del turnado",
co_hist.modifico
FROM
co_hist
WHERE
    (co_hist.archivo = "0")