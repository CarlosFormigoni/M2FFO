object FRelatorioDigestores: TFRelatorioDigestores
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Cozimentos'
  ClientHeight = 785
  ClientWidth = 1071
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object btnPrincipal: TSpeedButton
    Left = 10
    Top = 8
    Width = 105
    Height = 33
    Caption = 'PRINCIPAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnPrincipalClick
  end
  object DBChart1: TDBChart
    Left = 209
    Top = 61
    Width = 840
    Height = 328
    BottomAxis.LabelsAngle = 90
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.Maximum = 200.000000000000000000
    LeftAxis.Title.Caption = 'Temperatura ('#186'C)'
    Legend.Visible = False
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    RightAxis.Maximum = 10.000000000000000000
    RightAxis.Title.Caption = 'Press'#227'o (bar)'
    View3D = False
    BevelOuter = bvNone
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Marks.Font.Height = -9
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = qrConsulta
      SeriesColor = clRed
      Title = 'Temperatura'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'datahora'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'temperatura'
    end
    object Series2: TLineSeries
      Active = False
      Marks.Font.Height = -9
      Marks.Transparent = True
      Marks.Visible = True
      Marks.Style = smsValue
      DataSource = qrConsulta
      SeriesColor = clBlue
      Title = 'Pressao'
      VertAxis = aRightAxis
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'datahora'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'pressao'
    end
  end
  object TblDados: TDBGrid
    Left = 216
    Top = 400
    Width = 833
    Height = 329
    DataSource = srcConsulta
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'digestor'
        Title.Alignment = taCenter
        Title.Caption = 'DIGESTOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'batelada'
        Title.Alignment = taCenter
        Title.Caption = 'BATELADA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'datahora'
        Title.Alignment = taCenter
        Title.Caption = 'DATA / HORA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pressao'
        Title.Alignment = taCenter
        Title.Caption = 'PRESS'#195'O (bar)'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'temperatura'
        Title.Alignment = taCenter
        Title.Caption = 'TEMPERATURA ('#186'C)'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fase'
        Title.Alignment = taCenter
        Title.Caption = 'FASE PROCESSO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dh_inicio'
        Title.Alignment = taCenter
        Title.Caption = 'INCIO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dh_final'
        Title.Alignment = taCenter
        Title.Caption = 'FINAL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 61
    Width = 185
    Height = 92
    Caption = ' 01 - Filtro por Digestor '
    TabOrder = 2
    object Label4: TLabel
      Left = 10
      Top = 35
      Width = 64
      Height = 13
      Caption = 'N'#186' Digestor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txDigestor: TEdit
      Left = 106
      Top = 32
      Width = 63
      Height = 21
      Color = clCream
      TabOrder = 0
    end
    object btConsultarDigestor: TBitBtn
      Left = 106
      Top = 59
      Width = 63
      Height = 25
      Caption = 'FILTRAR'
      TabOrder = 1
      OnClick = btConsultarDigestorClick
    end
  end
  object grBateladasCozimento: TDBGrid
    Left = 8
    Top = 283
    Width = 187
    Height = 294
    DataSource = srcListagemCozimento
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'batelada'
        Title.Alignment = taCenter
        Title.Caption = 'BATELADA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dh_inicio'
        Title.Alignment = taCenter
        Title.Caption = 'HORARIO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 596
    Width = 185
    Height = 133
    Caption = ' 03 - Filtro por Batelada '
    TabOrder = 4
    object Label3: TLabel
      Left = 12
      Top = 35
      Width = 77
      Height = 13
      Caption = 'C'#243'd. Batelada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 12
      Top = 62
      Width = 64
      Height = 13
      Caption = 'N'#186' Digestor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txBatelada: TEdit
      Left = 108
      Top = 32
      Width = 63
      Height = 21
      Color = clCream
      TabOrder = 0
    end
    object btConsultarBatelada: TBitBtn
      Left = 108
      Top = 97
      Width = 63
      Height = 25
      Caption = 'FILTRAR'
      TabOrder = 1
      OnClick = btConsultarBateladaClick
    end
    object txDigestor1: TEdit
      Left = 108
      Top = 59
      Width = 63
      Height = 21
      Color = clCream
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 159
    Width = 185
    Height = 118
    Caption = ' 02 - Filtro por Data '
    TabOrder = 5
    object Label1: TLabel
      Left = 12
      Top = 27
      Width = 64
      Height = 13
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 54
      Width = 56
      Height = 13
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txDataInicial: TEdit
      Left = 108
      Top = 24
      Width = 63
      Height = 21
      Color = clCream
      TabOrder = 0
    end
    object txDataFinal: TEdit
      Left = 108
      Top = 51
      Width = 63
      Height = 21
      Color = clCream
      TabOrder = 1
    end
    object btConsultarData: TBitBtn
      Left = 108
      Top = 83
      Width = 63
      Height = 25
      Caption = 'FILTRAR'
      TabOrder = 2
      OnClick = btConsultarDataClick
    end
  end
  object srcConsulta: TDataSource
    DataSet = qrConsulta
    Left = 984
    Top = 740
  end
  object qrConsulta: TADOQuery
    Active = True
    Connection = FPrincipal.ConexaoPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cozimento')
    Left = 904
    Top = 740
  end
  object qrListagemCozimento: TADOQuery
    Active = True
    Connection = FPrincipal.ConexaoPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cozimento')
    Left = 248
    Top = 740
  end
  object srcListagemCozimento: TDataSource
    DataSet = qrListagemCozimento
    Left = 360
    Top = 740
  end
end
