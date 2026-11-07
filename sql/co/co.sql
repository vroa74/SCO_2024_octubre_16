SELECT
co.id AS "Folio",
co.fcap AS "Fecha de captura",
co.frec AS "Fecha de recepción",
co.ncor AS "Nivel de correspondencia",
co.tcor AS "Tipo de correspondencia",
co.ccor AS "Tipo de correspondencia",
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
co.tramite AS "Tramite",
co.FIAT AS "Fecha Inicio tramite",
co.Q_TRA AS "Quien inicio el tramite",
co.estatus AS "concluido",
co.FCAT AS "fecha de conclusión",
co.Q_EST AS "Quien lo concluyo",
co.archivo AS "Archivo",
co.FAAT AS "Fecha de archivo",
co.Q_ARC AS "Quien Archivo",
co.modifico AS "modifico"
FROM
co
WHERE
    (co.archivo = "0")