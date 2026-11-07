object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 522
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 522
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 301
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 703
      Top = 47
      Width = 31
      Height = 13
      Caption = 'Label2'
    end
    object Edit1: TEdit
      Left = 8
      Top = 8
      Width = 201
      Height = 21
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 8
      Top = 35
      Width = 201
      Height = 60
      TabOrder = 1
    end
    object Button1: TButton
      Left = 391
      Top = 4
      Width = 75
      Height = 25
      Caption = 'ejecutar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Memo2: TMemo
      Left = 223
      Top = 35
      Width = 162
      Height = 60
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 223
      Top = 8
      Width = 162
      Height = 21
      TabOrder = 4
    end
    object Edit10: TEdit
      Left = 391
      Top = 66
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object DateTimePicker1: TDateTimePicker
      Left = 518
      Top = 66
      Width = 98
      Height = 21
      Date = 46318.000000000000000000
      Time = 0.718965000000025600
      TabOrder = 6
    end
    object Button8: TButton
      Left = 391
      Top = 35
      Width = 52
      Height = 25
      Caption = 'Button8'
      TabOrder = 7
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 449
      Top = 35
      Width = 49
      Height = 25
      Caption = 'Button9'
      TabOrder = 8
      OnClick = Button9Click
    end
    object Memo5: TMemo
      Left = 1
      Top = 320
      Width = 776
      Height = 201
      Align = alBottom
      ScrollBars = ssVertical
      TabOrder = 9
    end
    object Button6: TButton
      Left = 504
      Top = 35
      Width = 74
      Height = 25
      Caption = 'guardarJson'
      TabOrder = 10
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 607
      Top = 4
      Width = 130
      Height = 25
      Caption = 'CargarJsonDescifrados'
      TabOrder = 11
      OnClick = Button7Click
    end
    object Button10: TButton
      Left = 472
      Top = 4
      Width = 129
      Height = 25
      Caption = 'GuardarJsonCifrados'
      TabOrder = 12
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 622
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Run'
      TabOrder = 13
      OnClick = Button11Click
    end
    object Edit6: TEdit
      Left = 622
      Top = 66
      Width = 115
      Height = 21
      TabOrder = 14
      Visible = False
    end
    object Version: TEdit
      Left = 8
      Top = 101
      Width = 363
      Height = 21
      TabOrder = 15
    end
    object Densidad: TEdit
      Left = 8
      Top = 128
      Width = 363
      Height = 21
      TabOrder = 16
    end
    object Temperatura: TEdit
      Left = 8
      Top = 155
      Width = 363
      Height = 21
      TabOrder = 17
    end
    object pin: TEdit
      Left = 8
      Top = 182
      Width = 363
      Height = 21
      TabOrder = 18
    end
    object Fecha: TEdit
      Left = 8
      Top = 209
      Width = 363
      Height = 21
      TabOrder = 19
    end
    object Pon: TEdit
      Left = 8
      Top = 236
      Width = 363
      Height = 21
      TabOrder = 20
    end
    object PinTexto: TEdit
      Left = 8
      Top = 263
      Width = 363
      Height = 21
      TabOrder = 21
    end
    object Memo3: TMemo
      Left = 377
      Top = 106
      Width = 384
      Height = 164
      ScrollBars = ssVertical
      TabOrder = 22
    end
    object Button2: TButton
      Left = 56
      Top = 289
      Width = 25
      Height = 25
      Caption = '<'
      TabOrder = 23
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 80
      Top = 289
      Width = 25
      Height = 25
      Caption = '>'
      TabOrder = 24
      OnClick = Button3Click
    end
  end
  object SHA3Hash1: TSHA3Hash
    Left = 640
    Top = 240
  end
  object AESEncryption1: TAESEncryption
    Version = '4.3.1.0'
    AType = atOFB
    Left = 576
    Top = 224
  end
end
