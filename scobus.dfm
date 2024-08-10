object Fscobus: TFscobus
  Left = -1
  Top = -1
  Caption = 'SCO - Busqueda'
  ClientHeight = 512
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 722
    Height = 476
    Align = alClient
    DataSource = DM.DQCO
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 476
    Width = 722
    Height = 36
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 5
      Width = 701
      Height = 29
      Caption = 'De doble click sobre cualquier regl'#243'n de datos, para editar.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
