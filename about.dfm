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
  object sfFlashPlayer1: TsfFlashPlayer
    Left = 0
    Top = 0
    Width = 673
    Height = 365
    Align = alClient
    Volume = 100
    VolumeControl = False
    FLVPlaybackSkin = flvclearskin
    ExplicitLeft = 328
    ExplicitTop = 144
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
