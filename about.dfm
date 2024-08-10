object Fabout: TFabout
  Left = 0
  Top = 0
  Caption = 'SCO - Acerca de..'
  ClientHeight = 392
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 365
    Width = 673
    Height = 27
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Label1'
      Visible = False
    end
    object Button1: TButton
      Left = 294
      Top = 6
      Width = 75
      Height = 18
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
