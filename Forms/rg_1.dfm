object Frg_1: TFrg_1
  Left = 0
  Top = 0
  Caption = 'SCO - Reportes generales'
  ClientHeight = 253
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBMemo1: TDBMemo
    Left = 0
    Top = 53
    Width = 234
    Height = 200
    Align = alLeft
    Color = clMoneyGreen
    DataField = 'Descripcion de Oficio'
    DataSource = DM.DQCO
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 53
    Align = alTop
    Caption = 
      'Descripci'#243'n                                                     ' +
      '                                                    Seguimiento'
    TabOrder = 1
    OnDblClick = Panel1DblClick
    object Label1: TLabel
      Left = 200
      Top = 12
      Width = 28
      Height = 19
      Caption = 'ID :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 234
      Top = 12
      Width = 65
      Height = 17
      DataField = 'Folio'
      DataSource = DM.DQCO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBMemo2: TDBMemo
    Left = 240
    Top = 53
    Width = 241
    Height = 200
    Align = alRight
    Color = clSkyBlue
    DataField = 'Seguimiento'
    DataSource = DM.DQCO
    TabOrder = 2
  end
end
