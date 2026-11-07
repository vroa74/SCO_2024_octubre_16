object Fabout: TFabout
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'SCO - Acerca de..'
  ClientHeight = 637
  ClientWidth = 1043
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
  object Panel1: TPanel
    Left = 0
    Top = 610
    Width = 1043
    Height = 27
    Align = alBottom
    TabOrder = 0
    OnClick = Panel1Click
    object Button1: TButton
      Left = 470
      Top = 0
      Width = 75
      Height = 24
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object BotonLicencia: TButton
      Left = 551
      Top = 0
      Width = 85
      Height = 24
      Caption = 'Licencia'
      TabOrder = 1
      OnClick = BotonLicenciaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1043
    Height = 89
    Align = alTop
    Caption = 'Sistema de Control de Oficios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 100
    Height = 521
    Align = alLeft
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 100
    Top = 89
    Width = 843
    Height = 521
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 169
    ExplicitWidth = 705
    object ScrollTexto: TScrollBox
      Left = 1
      Top = 1
      Width = 841
      Height = 519
      HorzScrollBar.Visible = False
      VertScrollBar.Tracking = True
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 841
        Height = 519
        Align = alTop
        AutoSize = True
        Caption =
          'El Sistema de Gesti'#243'n y Tr'#225'nsito Documental (SGTD) sustituye de ' +
          'manera formal al anterior Sistema de Control de Oficios. Ante la' +
          ' falta de atenci'#243'n institucional a las reiteradas notificaciones' +
          ' sobre la necesidad de esta migraci'#243'n tecnol'#243'gica, el desarrollo' +
          ' de esta nueva plataforma fue realizado de forma independiente p' +
          'or V'#237'ctor Rom'#225'n Ortiz Abreu durante su tiempo libre y fuera del ' +
          'horario de oficina, como una iniciativa para proteger y dar cont' +
          'inuidad t'#233'cnica al trabajo realizado.'#13#10#13#10'Caracter'#237'sticas Princip' +
          'ales'#13#10'Interfaz Intuitiva: Dise'#241'ada bajo criterios de usabilidad ' +
          'para optimizar la navegaci'#243'n y permitir un acceso r'#225'pido a las f' +
          'unciones operativas clave.'#13#10#13#10'Funcionalidad Optimizada: Incorpor' +
          'a mecanismos eficientes para la captura de informaci'#243'n, b'#250'squeda' +
          's de alta velocidad y estrictos controles que garantizan la inte' +
          'gridad y confiabilidad de los datos.'#13#10#13#10'Seguridad y Privacidad: ' +
          'Implementa barreras de protecci'#243'n de la informaci'#243'n, permitiendo' +
          ' el acceso exclusivamente a los usuarios designados a trav'#233's de '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        WordWrap = True
        ExplicitWidth = 840
        ExplicitHeight = 368
      end
    end
  end
  object Panel5: TPanel
    Left = 943
    Top = 89
    Width = 100
    Height = 521
    Align = alRight
    TabOrder = 4
    ExplicitLeft = 874
  end
end
