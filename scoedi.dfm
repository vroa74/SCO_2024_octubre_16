object Fscoedi: TFscoedi
  Left = 0
  Top = 0
  Caption = 'SCO - Edici'#243'n'
  ClientHeight = 672
  ClientWidth = 483
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
  object Label17: TLabel
    Left = 410
    Top = 16
    Width = 29
    Height = 23
    Caption = 'No.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 214
    Width = 465
    Height = 315
    Caption = ' Remitente del Oficio '
    Color = clMoneyGreen
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label9: TLabel
      Left = 13
      Top = 24
      Width = 41
      Height = 13
      Caption = 'Nombre:'
    end
    object Label10: TLabel
      Left = 13
      Top = 51
      Width = 33
      Height = 13
      Caption = 'Cargo:'
    end
    object Label11: TLabel
      Left = 13
      Top = 74
      Width = 125
      Height = 13
      Caption = 'Dependencia u Organismo'
    end
    object Label12: TLabel
      Left = 13
      Top = 89
      Width = 101
      Height = 13
      Caption = 'Descripci'#243'n del Oficio'
    end
    object Label16: TLabel
      Left = 21
      Top = 200
      Width = 58
      Height = 13
      Caption = 'Seguimiento'
    end
    object Edit3: TEdit
      Left = 79
      Top = 17
      Width = 315
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 79
      Top = 43
      Width = 315
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 400
      Top = 69
      Width = 49
      Height = 19
      Caption = '...'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Edit5: TEdit
      Left = 152
      Top = 66
      Width = 242
      Height = 21
      TabOrder = 3
    end
    object Memo1: TMemo
      Left = 13
      Top = 103
      Width = 388
      Height = 89
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object Memo2: TMemo
      Left = 16
      Top = 215
      Width = 388
      Height = 92
      ScrollBars = ssVertical
      TabOrder = 5
    end
  end
  object Button2: TButton
    Left = 6
    Top = 638
    Width = 75
    Height = 25
    Caption = 'Guardar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 87
    Top = 638
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 2
    OnClick = Button3Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 7
    Width = 394
    Height = 201
    Caption = '  Datos de Identificaci'#243'n de Correspondencia   '
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 90
      Height = 13
      Caption = 'Fecha de Captura:'
    end
    object Label2: TLabel
      Left = 168
      Top = 21
      Width = 97
      Height = 13
      Caption = 'Fecha de recepci'#243'n:'
    end
    object Label3: TLabel
      Left = 16
      Top = 66
      Width = 131
      Height = 13
      Caption = 'Nivel de la correspondencia'
    end
    object Label4: TLabel
      Left = 200
      Top = 66
      Width = 134
      Height = 13
      Caption = 'Tipo de la Correspondencia:'
    end
    object Label5: TLabel
      Left = 16
      Top = 109
      Width = 172
      Height = 13
      Caption = 'Clasificacion de la Correspondencia:'
    end
    object Label6: TLabel
      Left = 232
      Top = 109
      Width = 142
      Height = 13
      Caption = 'Fecha del Oficio o Documento'
    end
    object Label7: TLabel
      Left = 16
      Top = 153
      Width = 62
      Height = 13
      Caption = 'No. de Oficio'
    end
    object Label8: TLabel
      Left = 213
      Top = 153
      Width = 62
      Height = 13
      Caption = 'No. de Hojas'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 16
      Top = 40
      Width = 113
      Height = 21
      Date = 41255.605594791670000000
      Time = 41255.605594791670000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 168
      Top = 40
      Width = 113
      Height = 21
      Date = 41255.605594791670000000
      Time = 41255.605594791670000000
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 85
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'Nivel de la correspondencia'
      Items.Strings = (
        'Urgente'
        'Ordinaria')
    end
    object ComboBox2: TComboBox
      Left = 200
      Top = 85
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'Nivel de la correspondencia'
      OnChange = ComboBox2Change
      Items.Strings = (
        'Correspondencia normal'
        'correspondencia especial'
        'Peticiones')
    end
    object ComboBox3: TComboBox
      Left = 16
      Top = 128
      Width = 172
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = 'Nivel de la correspondencia'
    end
    object DateTimePicker3: TDateTimePicker
      Left = 232
      Top = 128
      Width = 113
      Height = 21
      Date = 41255.605594791670000000
      Time = 41255.605594791670000000
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 16
      Top = 172
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object Edit2: TEdit
      Left = 213
      Top = 172
      Width = 121
      Height = 21
      TabOrder = 7
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 534
    Width = 465
    Height = 98
    Caption = '   Turnado a:   '
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    object Label13: TLabel
      Left = 13
      Top = 24
      Width = 41
      Height = 13
      Caption = 'Nombre:'
    end
    object Label14: TLabel
      Left = 13
      Top = 51
      Width = 33
      Height = 13
      Caption = 'Cargo:'
    end
    object Label15: TLabel
      Left = 13
      Top = 74
      Width = 125
      Height = 13
      Caption = 'Dependencia u Organismo'
    end
    object Edit6: TEdit
      Left = 79
      Top = 17
      Width = 315
      Height = 21
      TabOrder = 0
    end
    object Edit7: TEdit
      Left = 79
      Top = 43
      Width = 315
      Height = 21
      TabOrder = 1
    end
    object Button4: TButton
      Left = 400
      Top = 69
      Width = 49
      Height = 19
      Caption = '...'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Edit8: TEdit
      Left = 152
      Top = 66
      Width = 242
      Height = 21
      TabOrder = 3
    end
  end
  object CheckBox1: TCheckBox
    Left = 176
    Top = 642
    Width = 97
    Height = 17
    Caption = 'Concluido'
    TabOrder = 5
  end
end
