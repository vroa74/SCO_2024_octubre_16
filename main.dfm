object Fmain: TFmain
  Left = -1
  Top = -1
  Caption = 'Sistema de Correspondencia del Congreso del Estado de Campeche'
  ClientHeight = 498
  ClientWidth = 828
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
  PixelsPerInch = 96
  TextHeight = 13
  object sfFlashPlayer1: TsfFlashPlayer
    Left = 0
    Top = 0
    Width = 828
    Height = 479
    Align = alClient
    Volume = 100
    VolumeControl = False
    FLVPlaybackSkin = flvclearskin
    ExplicitLeft = 280
    ExplicitTop = 200
    ExplicitWidth = 192
    ExplicitHeight = 192
    ControlData = {
      6755665500090000D8130000D813000008000200000000000800000000000800
      000000000800180000005400720061006E00730070006100720065006E007400
      00000800060000002D00310000000800060000002D003100000008000A000000
      4800690067006800000008000200000000000800060000002D00310000000800
      000000000800020000000000080010000000530068006F00770041006C006C00
      0000080004000000300000000800040000003000000008000200000000000800
      0000000008000200000000000D00000000000000000000000000000000000800
      0400000031000000080004000000300000000800000000000800040000003000
      000008000800000061006C006C00000008000C000000660061006C0073006500
      0000}
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 479
    Width = 828
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
    Date = 41256.377127812500000000
    Time = 41256.377127812500000000
    TabOrder = 1
    Visible = False
  end
  object DateTimePicker2: TDateTimePicker
    Left = 520
    Top = 363
    Width = 186
    Height = 21
    Date = 41256.377127812500000000
    Time = 41256.377127812500000000
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
  object Timer1: TTimer
    Interval = 100000
    OnTimer = Timer1Timer
    Left = 608
    Top = 56
  end
  object MainMenu1: TMainMenu
    Left = 560
    Top = 48
    object Loguin1: TMenuItem
      Caption = 'Login'
      object Loguin2: TMenuItem
        Caption = 'Login'
        OnClick = Loguin2Click
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
      object A1: TMenuItem
        Caption = 'Alta por Grupo'
        OnClick = A1Click
      end
      object Busqueda1: TMenuItem
        Caption = 'Editar'
        Visible = False
        OnClick = Busqueda1Click
      end
      object Reportes1: TMenuItem
        Caption = 'Impresi'#243'n de volantes'
        Visible = False
        OnClick = Reportes1Click
      end
      object consultas1: TMenuItem
        Caption = 'Reportes generales'
        OnClick = consultas1Click
      end
      object Reportes2: TMenuItem
        Caption = 'Seguimiento a Tr'#225'mite de Respuesta'
        Visible = False
        OnClick = Reportes2Click
      end
    end
    object Archivo2: TMenuItem
      Caption = 'Archivo'
      object SCOArchivar1: TMenuItem
        Caption = 'SCO - Archivar'
        OnClick = SCOArchivar1Click
      end
      object SeguimientoaTrmitedeRespuesta1: TMenuItem
        Caption = 'SCO - Seguimiento Archivo'
        OnClick = SeguimientoaTrmitedeRespuesta1Click
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
    object grupos1: TMenuItem
      Caption = 'Grupos'
      object G1: TMenuItem
        Caption = 'Grupos'
        OnClick = G1Click
      end
      object AGENDAGRUPO1: TMenuItem
        Caption = 'AGENDA -> GRUPO'
        OnClick = AGENDAGRUPO1Click
      end
      object GRUPOPERSONA1: TMenuItem
        Caption = 'GRUPO -> PERSONA'
        OnClick = GRUPOPERSONA1Click
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
end
