object Fmain: TFmain
  Left = -1
  Top = -1
  Caption = 'Sistema de Gesti'#243'n y Tr'#225'nsito Documental'
  ClientHeight = 619
  ClientWidth = 1052
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 600
    Width = 1052
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 250
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object DateTimePicker1: TDateTimePicker
    Left = 520
    Top = 336
    Width = 186
    Height = 21
    Date = 41256.000000000000000000
    Time = 0.377127812498656600
    TabOrder = 1
    Visible = False
  end
  object DateTimePicker2: TDateTimePicker
    Left = 520
    Top = 363
    Width = 186
    Height = 21
    Date = 41256.000000000000000000
    Time = 0.377127812498656600
    TabOrder = 2
    Visible = False
  end
  object ListBox1: TListBox
    Left = 544
    Top = 208
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object bg: TDBImage
    Left = 0
    Top = 0
    Width = 1052
    Height = 576
    Align = alClient
    Stretch = True
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 576
    Width = 1052
    Height = 24
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 5
    object Button1: TButton
      Left = 976
      Top = 1
      Width = 75
      Height = 22
      Align = alRight
      Caption = 'Validar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 1
      Top = 1
      Width = 975
      Height = 22
      Align = alClient
      Color = clSkyBlue
      TabOrder = 1
      ExplicitHeight = 21
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 648
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 592
    Top = 16
    object Loguin1: TMenuItem
      Caption = 'Login'
      object Loguin2: TMenuItem
        Caption = 'Login'
        OnClick = Loguin2Click
      end
      object c1: TMenuItem
        Caption = 'config'
        OnClick = c1Click
      end
      object Salir1: TMenuItem
        Caption = 'Salir'
        OnClick = Salir1Click
      end
    end
    object Oficios1: TMenuItem
      Caption = 'Oficios'
      object Alta1: TMenuItem
        Caption = 'Alta'
        OnClick = Alta1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object A1: TMenuItem
        Caption = 'Alta por Grupo'
        Enabled = False
        Visible = False
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object C2: TMenuItem
        Caption = 'Catalogos'
        OnClick = C2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object consultas1: TMenuItem
        Caption = 'Reportes generales'
        OnClick = consultas1Click
      end
      object Reportes2: TMenuItem
        Caption = 'Seguimiento a Tr'#225'mite de Respuesta'
        Visible = False
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Reportesgenerales1: TMenuItem
        Caption = 'Reportes generales historicos'
        OnClick = Reportesgenerales1Click
      end
    end
    object Catalogos1: TMenuItem
      Caption = 'Agenda'
      object Alta2: TMenuItem
        Caption = 'Alta'
        OnClick = Alta2Click
      end
      object Busqueda2: TMenuItem
        Caption = 'Busqueda'
        Visible = False
        OnClick = Busqueda2Click
      end
    end
    object Acerca1: TMenuItem
      Caption = 'Acerca'
      object de1: TMenuItem
        Caption = 'de ...'
        OnClick = de1Click
      end
    end
  end
  object SHA3Hash1: TSHA3Hash
    Left = 616
    Top = 248
  end
end
