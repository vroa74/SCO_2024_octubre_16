object FConfig: TFConfig
  Left = 0
  Top = 0
  Caption = '[SCO] configuracion de logotipos...'
  ClientHeight = 283
  ClientWidth = 632
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
    Top = 0
    Width = 632
    Height = 197
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 202
      Height = 195
      Align = alLeft
      TabOrder = 0
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 200
        Height = 193
        Align = alClient
        Stretch = True
        ExplicitLeft = 96
        ExplicitTop = 64
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
    object Panel3: TPanel
      Left = 228
      Top = 1
      Width = 403
      Height = 195
      Align = alRight
      ParentBackground = False
      TabOrder = 1
      object Image2: TImage
        Left = 1
        Top = 1
        Width = 401
        Height = 193
        Align = alClient
        Stretch = True
        ExplicitWidth = 403
      end
    end
  end
  object Button1: TButton
    Left = 1
    Top = 212
    Width = 203
    Height = 25
    Caption = 'LOGOTIPO CONGRESO'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 229
    Top = 212
    Width = 395
    Height = 25
    Caption = 'LOGOTIPO LEGISLATURA'
    TabOrder = 2
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 264
    Width = 632
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 300
      end
      item
        Width = 300
      end>
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.png'
    Left = 248
    Top = 169
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 396
    Top = 145
  end
end
