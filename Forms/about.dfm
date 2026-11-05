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
    Width = 169
    Height = 521
    Align = alLeft
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 169
    Top = 89
    Width = 705
    Height = 521
    Align = alClient
    TabOrder = 3
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 703
      Height = 519
      Align = alClient
      Caption = 
        'Esta aplicaci'#243'n fue desarrollada por V'#237'ctor Rom'#225'n Ortiz Abreu du' +
        'rante su tiempo libre, combinando pasi'#243'n y dedicaci'#243'n para crear' +
        ' el Sistema de Control de Oficios.'#13#10#13#10#13#10'Caracter'#237'sticas Principa' +
        'les:'#13#10#8226#9'Interfaz Intuitiva: Dise'#241'ada para facilitar su uso, perm' +
        'itiendo a los usuarios navegar y acceder r'#225'pidamente a las funci' +
        'onalidades clave.'#13#10#8226#9'Funcionalidad Personalizada: Los usuarios p' +
        'ueden facilidad de captura de informaci'#243'n, b'#250'squedas r'#225'pidas y c' +
        'onfiabilidad e integridad de la informaci'#243'n.'#13#10#8226#9'Seguridad y Priv' +
        'acidad: Con un enfoque en proteger la informaci'#243'n del usuario, s' +
        'e han implementado medidas de seguridad como ya que solo pue de ' +
        'ser accedida por los usuarios designados a trav'#233's de una aplicac' +
        'i'#243'n de canal cerrado.'#13#10#13#10#13#10'Derechos de Autor y Licencia:'#13#10'Esta a' +
        'plicaci'#243'n est'#225' registrada bajo la licencia de software a nombre ' +
        'de V'#237'ctor Rom'#225'n Ortiz Abreu, quien retiene y conserva todos los ' +
        'derechos de autor. El uso, distribuci'#243'n o modificaci'#243'n del softw' +
        'are est'#225' sujeto a las condiciones establecidas en dicha licencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ExplicitWidth = 700
      ExplicitHeight = 437
    end
  end
  object Panel5: TPanel
    Left = 874
    Top = 89
    Width = 169
    Height = 521
    Align = alRight
    TabOrder = 4
  end
end
