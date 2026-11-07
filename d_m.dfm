object DM: TDM
  OldCreateOrder = False
  Height = 358
  Width = 606
  object MyConnection1: TMyConnection
    Database = 'sco'
    Username = 'root'
    Server = 'localhost'
    LoginPrompt = False
    Options.UseUnicode = True
    Left = 64
    Top = 16
  end
  object QCO: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT'
      'co.id AS "Folio",'
      'co.fcap AS "Fecha de captura",'
      'co.frec AS "Fecha de recepci'#243'n",'
      'co.ncor AS "Nivel de correspondencia",'
      'co.tcor AS "Tipo de correspondencia",'
      'co.ccor AS "Clasificaci'#243'n de correspondencia",'
      'co.fofi AS "Fecha de oficio",'
      'co.nofi AS "Numero de Oficio",'
      'co.nhoj AS "Numero de hojas",'
      'co.rem_nombre AS "Nombre del remitente",'
      'co.rem_cargo AS "cargo del remitente",'
      'co.rem_deporg AS "Depto. U org. Del remitente",'
      'co.rem_dir AS "Direcci'#243'n del Remitente",'
      'co.des AS "Descripcion de Oficio",'
      'co.seguimiento AS "Seguimiento",'
      'co.tur_nom AS "Nombre turnado",'
      'co.tur_cargo AS "Cargo turnado",'
      'co.tur_deporg AS "Depto. U organ. Del turnado",'
      'co.tramite AS "Tramite",'
      'co.FIAT AS "Fecha Inicio tramite",'
      'co.Q_TRA AS "Quien inicio el tramite",'
      'co.estatus AS "concluido",'
      'co.FCAT AS "fecha de conclusi'#243'n",'
      'co.Q_EST AS "Quien lo concluyo",'
      'co.archivo AS "Archivo",'
      'co.FAAT AS "Fecha de archivo",'
      'co.modifico,'
      'co.Q_ARC AS "Quien Archivo"'
      'FROM'
      'co'
      'WHERE'
      '    (co.archivo = "0")'
      'ORDER BY'
      '  co.id')
    Options.FieldOrigins = foNone
    Left = 16
    Top = 224
  end
  object QAGE: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT '
      '  age.titulo,'
      '  age.nombre,'
      '  age.apaterno,'
      '  age.amaterno,'
      '  age.cargo,'
      '  age.deporg,'
      '  age.telefono,'
      '  age.email,'
      '  age.dir,'
      '  age.id_age,  '
      '  age.modifico'
      'FROM'
      ' age')
    Options.FieldOrigins = foNone
    Left = 56
    Top = 224
  end
  object QCOH: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT'
      'co.id AS "Folio",'
      'co.fcap AS "Fecha de captura",'
      'co.frec AS "Fecha de recepci'#243'n",'
      'co.ncor AS "Nivel de correspondencia",'
      'co.tcor AS "Tipo de correspondencia",'
      'co.ccor AS "Clasificaci'#243'n de correspondencia",'
      'co.fofi AS "Fecha de oficio",'
      'co.nofi AS "Numero de Oficio",'
      'co.nhoj AS "Numero de hojas",'
      'co.rem_nombre AS "Nombre del remitente",'
      'co.rem_cargo AS "cargo del remitente",'
      'co.rem_deporg AS "Depto. U org. Del remitente",'
      'co.rem_dir AS "Direcci'#243'n del Remitente",'
      'co.des AS "Descripcion de Oficio",'
      'co.seguimiento AS "Seguimiento",'
      'co.tur_nom AS "Nombre turnado",'
      'co.tur_cargo AS "Cargo turnado",'
      'co.tur_deporg AS "Depto. U organ. Del turnado",'
      'co.tramite AS "Tramite",'
      'co.FIAT AS "Fecha Inicio tramite",'
      'co.Q_TRA AS "Quien inicio el tramite",'
      'co.estatus AS "concluido",'
      'co.FCAT AS "fecha de conclusi'#243'n",'
      'co.Q_EST AS "Quien lo concluyo",'
      'co.archivo AS "Archivo",'
      'co.FAAT AS "Fecha de archivo",'
      'co.Q_ARC AS "Quien Archivo"'
      'FROM'
      'co'
      'WHERE'
      '    (co.archivo = "1")'
      'ORDER BY'
      '  co.id')
    Options.FieldOrigins = foNone
    Left = 104
    Top = 224
  end
  object TGrupo: TMyTable
    TableName = 'grupo'
    OrderFields = 'id_grupo'
    Connection = MyConnection1
    Options.FieldOrigins = foNone
    Left = 480
    Top = 8
  end
  object DQCO: TMyDataSource
    DataSet = QCO
    Left = 16
    Top = 288
  end
  object DQAGE: TMyDataSource
    DataSet = QAGE
    Left = 56
    Top = 288
  end
  object DQCOH: TMyDataSource
    DataSet = QCOH
    Left = 104
    Top = 288
  end
  object DTco: TMyDataSource
    DataSet = TCO
    Left = 368
    Top = 64
  end
  object DTage: TMyDataSource
    DataSet = Tage
    Left = 424
    Top = 64
  end
  object DTGrupo: TMyDataSource
    DataSet = TGrupo
    Left = 480
    Top = 64
  end
  object QCAT_GRU: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM'
      ' cat_gru')
    Options.FieldOrigins = foNone
    Left = 160
    Top = 224
  end
  object DQCAT_GRU: TMyDataSource
    DataSet = QCAT_GRU
    Left = 160
    Top = 288
  end
  object QAUX: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT '
      '  cat_gru.id_grupo,'
      '  cat_gru.GRUPO,'
      '  cat_gru.DESCRIPCION,'
      '  grupo.id_grupo,'
      '  grupo.id_user'
      'FROM'
      ' cat_gru'
      ' LEFT JOIN grupo ON (cat_gru.id_grupo=grupo.id_grupo)'
      ' AND (GRUPO.id_user= 3)'
      ' WHERE GRUPO.id_grupo IS NULL'
      ' ORDER BY CAT_GRU.`id_grupo` ASC')
    Options.FieldOrigins = foNone
    Left = 280
    Top = 224
  end
  object QGRUPO: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT '
      '  grupo.id_user,'
      '  grupo.id_grupo'
      'FROM'
      ' grupo')
    Options.FieldOrigins = foNone
    Left = 224
    Top = 224
  end
  object DQGRUPO: TMyDataSource
    DataSet = QGRUPO
    Left = 224
    Top = 288
  end
  object DQAUX: TMyDataSource
    DataSet = QAUX
    Left = 280
    Top = 288
  end
  object TCAT_GRU: TMyTable
    TableName = 'cat_gru'
    OrderFields = 'id_grupo'
    Connection = MyConnection1
    Options.FieldOrigins = foNone
    Left = 544
    Top = 8
  end
  object DTCAT_GRU: TMyDataSource
    DataSet = QCAT_GRU
    Left = 544
    Top = 64
  end
  object MyBackup1: TMyBackup
    Connection = MyConnection1
    Duplicates = bdReplace
    FieldsTerminatedBy = '\t'
    EscapedBy = '\\'
    LinesTerminatedBy = '\n'
    Left = 144
    Top = 16
  end
  object QImpresion: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      'co'
      'WHERE'
      '    (co.archivo = "0")'
      'ORDER BY'
      '  co.id')
    Options.FieldOrigins = foNone
    Left = 336
    Top = 224
  end
  object DQImpresion: TMyDataSource
    DataSet = QImpresion
    Left = 336
    Top = 288
  end
  object TCO: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  `co`'
      'ORDER BY'
      '  `co`.`id` '
      ''
      '')
    Options.FieldOrigins = foNone
    Left = 368
    Top = 8
  end
  object Tage: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  `age`'
      '')
    Options.FieldOrigins = foNone
    Left = 424
    Top = 8
  end
  object TBitacora: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT '
      '  `bitacora`.`id_bitacora`,'
      '  `bitacora`.`user`,'
      '  `bitacora`.`creado`,'
      '  `bitacora`.`alta`,'
      '  `bitacora`.`edicion`,'
      '  `bitacora`.`status`'
      'FROM'
      '  `bitacora`'
      'LIMIT 1000')
    Options.FieldOrigins = foNone
    Left = 312
    Top = 8
  end
  object DTBitacora: TMyDataSource
    DataSet = TBitacora
    Left = 312
    Top = 64
  end
  object QRCA: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    Left = 248
    Top = 8
  end
  object DQRCA: TMyDataSource
    DataSet = QRCA
    Left = 248
    Top = 64
  end
  object Qco_his: TMyQuery
    FetchAll = False
    FetchRows = 50
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  `co_hist`'
      'ORDER BY'
      '  co_hist.id')
    Options.FieldOrigins = foNone
    Left = 16
    Top = 112
  end
  object Dco_his: TMyDataSource
    DataSet = Qco_his
    Left = 16
    Top = 176
  end
  object ncor: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  `ncor`')
    Options.FieldOrigins = foNone
    Left = 440
    Top = 232
  end
  object Dncor: TMyDataSource
    DataSet = ncor
    Left = 440
    Top = 288
  end
  object tcor: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  `tcor`')
    Options.FieldOrigins = foNone
    Left = 496
    Top = 232
  end
  object dtcor: TMyDataSource
    DataSet = tcor
    Left = 496
    Top = 288
  end
  object ccor: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  `ccor`')
    Options.FieldOrigins = foNone
    MasterFields = 'id'
    DetailFields = 'tcor'
    Left = 560
    Top = 232
  end
  object dccor: TMyDataSource
    DataSet = ccor
    Left = 560
    Top = 288
  end
  object MyTable1: TMyTable
    Connection = MyConnection1
    Left = 120
    Top = 128
  end
end
