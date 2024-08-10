object DM: TDM
  OldCreateOrder = False
  Height = 230
  Width = 571
  object MyConnection1: TMyConnection
    Database = 'sco'
    Password = 'vroa1974'
    Server = '192.168.1.68'
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object QCO: TMyQuery
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
      '    (co.archivo = "0")'
      'ORDER BY'
      '  co.id')
    Left = 16
    Top = 104
  end
  object QAGE: TMyQuery
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
    Left = 56
    Top = 104
  end
  object QCOH: TMyQuery
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
    Left = 104
    Top = 104
  end
  object TCO: TMyTable
    TableName = 'co'
    OrderFields = 'id'
    Connection = MyConnection1
    Filtered = True
    Filter = 'archivo = 0'
    Left = 376
  end
  object Tage: TMyTable
    TableName = 'age'
    OrderFields = 'id_age'
    Connection = MyConnection1
    Left = 416
  end
  object TGrupo: TMyTable
    TableName = 'grupo'
    OrderFields = 'id_grupo'
    Connection = MyConnection1
    Left = 464
  end
  object DQCO: TMyDataSource
    DataSet = QCO
    Left = 16
    Top = 168
  end
  object DQAGE: TMyDataSource
    DataSet = QAGE
    Left = 56
    Top = 168
  end
  object DQCOH: TMyDataSource
    DataSet = QCOH
    Left = 104
    Top = 168
  end
  object DTco: TMyDataSource
    DataSet = TCO
    Left = 376
    Top = 64
  end
  object DTage: TMyDataSource
    DataSet = Tage
    Left = 416
    Top = 64
  end
  object DTGrupo: TMyDataSource
    DataSet = TGrupo
    Left = 464
    Top = 64
  end
  object QCAT_GRU: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM'
      ' cat_gru')
    Left = 160
    Top = 104
  end
  object DQCAT_GRU: TMyDataSource
    DataSet = QCAT_GRU
    Left = 160
    Top = 168
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
    Left = 280
    Top = 104
  end
  object QGRUPO: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT '
      '  grupo.id_user,'
      '  grupo.id_grupo'
      'FROM'
      ' grupo')
    Left = 224
    Top = 104
  end
  object DQGRUPO: TMyDataSource
    DataSet = QGRUPO
    Left = 224
    Top = 168
  end
  object DQAUX: TMyDataSource
    DataSet = QAUX
    Left = 280
    Top = 168
  end
  object TCAT_GRU: TMyTable
    TableName = 'cat_gru'
    OrderFields = 'id_grupo'
    Connection = MyConnection1
    Left = 520
  end
  object DTCAT_GRU: TMyDataSource
    DataSet = QCAT_GRU
    Left = 520
    Top = 64
  end
  object MyBackup1: TMyBackup
    Connection = MyConnection1
    Duplicates = bdReplace
    FieldsTerminatedBy = '\t'
    EscapedBy = '\\'
    LinesTerminatedBy = '\n'
    Left = 152
    Top = 24
  end
  object QImpresion: TMyQuery
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
    Left = 384
    Top = 120
  end
  object DQImpresion: TMyDataSource
    DataSet = QImpresion
    Left = 384
    Top = 168
  end
end
