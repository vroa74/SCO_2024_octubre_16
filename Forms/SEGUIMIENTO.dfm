object FSEGUIMIENTO: TFSEGUIMIENTO
  Left = 0
  Top = 0
  Caption = 'SCO - SEGUIMIENTO'
  ClientHeight = 495
  ClientWidth = 843
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
    Width = 843
    Height = 129
    Align = alTop
    TabOrder = 0
    object JvRollOut3: TJvRollOut
      Left = 151
      Top = 4
      Width = 143
      Height = 113
      Caption = '             Estatus'
      Colors.ButtonColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      FAWidth = 145
      FAHeight = 113
      FCWidth = 22
      FCHeight = 22
      object RadioButton4: TRadioButton
        Left = 21
        Top = 88
        Width = 113
        Height = 17
        Caption = 'SIN TR'#193'MITE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = RadioButton4Click
      end
      object RadioButton5: TRadioButton
        Left = 21
        Top = 51
        Width = 113
        Height = 17
        Caption = 'CONCLUIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = RadioButton5Click
      end
      object RadioButton6: TRadioButton
        Left = 21
        Top = 70
        Width = 113
        Height = 17
        Caption = 'EN PROCESO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = RadioButton6Click
      end
      object RadioButton3: TRadioButton
        Left = 21
        Top = 32
        Width = 113
        Height = 17
        Caption = 'TODOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = RadioButton5Click
      end
    end
    object JvRollOut1: TJvRollOut
      Left = 8
      Top = 4
      Width = 137
      Height = 113
      Caption = 'Periodo del'
      Colors.ButtonColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      FAWidth = 145
      FAHeight = 113
      FCWidth = 22
      FCHeight = 22
      object Label1: TLabel
        Left = 51
        Top = 74
        Width = 8
        Height = 13
        Caption = 'al'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DateTimePicker1: TDateTimePicker
        Left = 12
        Top = 51
        Width = 106
        Height = 21
        Date = 41284.312301608800000000
        Time = 41284.312301608800000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DateTimePicker1Change
      end
      object DateTimePicker2: TDateTimePicker
        Left = 12
        Top = 87
        Width = 106
        Height = 21
        Date = 41284.312301608800000000
        Time = 41284.312301608800000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = DateTimePicker2Change
      end
      object CheckBox1: TCheckBox
        Left = 12
        Top = 27
        Width = 97
        Height = 17
        Caption = 'Habilitar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox1Click
      end
    end
    object JvRollOut2: TJvRollOut
      Left = 300
      Top = 4
      Width = 143
      Height = 80
      Caption = 'Folio del Documento'
      Colors.ButtonColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      FAWidth = 145
      FAHeight = 80
      FCWidth = 22
      FCHeight = 22
      object Edit1: TEdit
        Left = 9
        Top = 36
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
    end
    object Memo1: TMemo
      Left = 601
      Top = 4
      Width = 238
      Height = 113
      Lines.Strings = (
        'Memo1')
      ScrollBars = ssVertical
      TabOrder = 3
      Visible = False
    end
    object JvRollOut4: TJvRollOut
      Left = 449
      Top = 4
      Width = 143
      Height = 80
      Caption = 'Cambio de Estatus'
      Colors.ButtonColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      FAWidth = 145
      FAHeight = 80
      FCWidth = 22
      FCHeight = 22
      object RadioButton2: TRadioButton
        Left = 16
        Top = 27
        Width = 113
        Height = 17
        Caption = 'Concluido'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object RadioButton1: TRadioButton
        Left = 16
        Top = 50
        Width = 113
        Height = 17
        Caption = 'No concluido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object BitBtn1: TBitBtn
      Left = 309
      Top = 90
      Width = 25
      Height = 25
      TabOrder = 5
      OnClick = BitBtn1Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000FF0000
        00FF000000FF000000FF000000FFEEDD9DFFF7E8AFFFF3E3A0FFF4E095FFF5E3
        A0FFF5E7AEFFEEDA9BFF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FFD1AD48FFF6EBB1FFFBE68FFFF4D04EFFE8BC28FFE4B71DFFE8BD
        28FFF4CF4EFFFBE68FFFF6EAB2FFD3AF4FFF000000FF000000FF000000FF0000
        00FFE2BC5EFFF9EBAFFFFBDC64FFDBAB06FFDDB00CFFDEB316FFDCB017FFDDB2
        16FFDEB10DFFDCAB06FFFBDC62FFF9EBB0FFDBB860FF000000FF000000FF0000
        00FFF1E2A9FFFEDE64FFDDAD05FFE3BA1EFFD59E13FFC97F06FFC57503FFC87C
        05FFD39911FFE2B81DFFDDAE05FFFEDE62FFF1E2A8FF000000FF000000FFECD9
        97FFFFEE91FFE2B40DFFE5BD21FFD1900EFFC46D00FFCE870BFFD79C16FFD18E
        11FFC77100FFD08C0FFFE6C029FFE3B711FFFFEE90FFECD796FF000000FFF3E4
        AAFFFDDC54FFE8C01BFFDDAE1EFFC57100FFDBA51BFFEECF33FFF0D33CFFF1D5
        44FFE3B834FFCD7D06FFDCA725FFEBC930FFFEE05DFFF3E3ABFFAA5500FFF4E3
        9FFFF4CF35FFEBC529FFEDCA30FFE8C42FFFF0D03AFFF1D345FFF2D650FFF3D8
        58FFF7E163FFDFAA30FFD69318FFEED14BFFF8D84CFFF5E6A6FFAF7F0FFFF4E3
        98FFF4CF31FFF1D237FFE3B628FFDAA11DFFF4D94EFFF6DD5CFFF5DE66FFF6E1
        70FFF9E87CFFEBC757FFD9961CFFF0D45DFFFADD57FFF6E7A4FF993300FFF5E5
        A0FFFBDC44FFE3B92CFFD08102FFD38100FFDDA92DFFF6E16EFFF9E67DFFF9E8
        87FFFCF29EFFEAC25CFFE0A630FFF5E076FFFEE770FFF6E8AFFF000000FFF3E4
        A9FFFFEC68FFEBC838FFE0AC27FFD48500FFE2B43EFFF9EC88FFFDF29AFFFEF6
        ACFFF6E39AFFE5AE40FFEDCA6BFFFAEC8FFFFFF897FFF5E8B5FF000000FFE9D6
        95FFFFFB9DFFF7DB44FFF7E15CFFDFA726FFDA9108FFE8BA44FFF0D270FFEDC9
        68FFE6B141FFECC46BFFFBF2B4FFFCED92FFFFFFC1FFEFDC9FFF000000FF9966
        00FFF4E4A8FFFFF886FFF8E15AFFF9E878FFEAC353FFE1A628FFE0A424FFE5B1
        3BFFEFD17CFFFBF5C1FFFDF4B1FFFFFFC0FFF6EAB9FFAA7F00FF000000FF0000
        00FFE0BC67FFF8EFB3FFFFFC94FFFBEA78FFFEF59DFFFCF2A8FFFAEDA9FFFCF4
        B8FFFFFAC4FFFFF6B6FFFFFFCBFFF9F3C9FFE2CA73FF000000FF000000FF0000
        00FF000000FFDDB65EFFF6EBB1FFFFFFB9FFFFFFB3FFFFFDBAFFFFFEC4FFFFFF
        C8FFFFFFCEFFFFFFD8FFF7F0C3FFE3C86CFF000000FF000000FF000000FF0000
        00FF000000FF000000FF7F0000FFEBD790FFF5E8ABFFFAEFB6FFFAF0BCFFFAF0
        BDFFF8ECB8FFEDDC9DFF912400FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FFBB5500FFE8B416FFAF5F
        00FF000000FF000000FF000000FF000000FF000000FF000000FF}
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 129
    Width = 843
    Height = 366
    Align = alClient
    DataSource = DM.DQCO
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
end
