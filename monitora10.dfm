object FRelatorioEst: TFRelatorioEst
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Esteriliza'#231#227'o'
  ClientHeight = 722
  ClientWidth = 1117
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
  object Label1: TLabel
    Left = 274
    Top = 362
    Width = 166
    Height = 16
    Caption = 'RESULTADO DA CONSULTA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 273
    Top = 64
    Width = 167
    Height = 16
    Caption = 'CURVA DE ESTERILIZACAO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
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
  object Label4: TLabel
    Left = 8
    Top = 64
    Width = 188
    Height = 16
    Caption = 'RELA'#199#195'O DE ESTERILIZA'#199#213'ES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tblDados: TDBGrid
    Left = 273
    Top = 384
    Width = 713
    Height = 313
    DataSource = srcConsulta
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
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
        FieldName = 'pressao'
        Title.Alignment = taCenter
        Title.Caption = 'PRESS'#195'O (bar)'
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
        Expanded = False
        FieldName = 'dh_processo'
        Title.Caption = 'INICIO PROCESSO'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marca1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marca2'
        Visible = True
      end>
  end
  object DBChart1: TDBChart
    Left = 273
    Top = 86
    Width = 720
    Height = 259
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
    TabOrder = 1
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
    object Series3: TLineSeries
      DataSource = qrConsulta
      SeriesColor = clBlack
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'datahora'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'marca1'
    end
    object Series4: TLineSeries
      DataSource = qrConsulta
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'datahora'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'marca2'
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 597
    Width = 233
    Height = 100
    Caption = ' Dados da consulta  '
    TabOrder = 2
    object Label3: TLabel
      Left = 10
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
    object txBatelada: TEdit
      Left = 106
      Top = 32
      Width = 111
      Height = 21
      Color = clCream
      TabOrder = 0
    end
    object btConsultar: TBitBtn
      Left = 154
      Top = 59
      Width = 63
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btConsultarClick
    end
  end
  object tblListaEst: TDBGrid
    Left = 8
    Top = 86
    Width = 233
    Height = 505
    DataSource = srcListaEst
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = tblListaEstCellClick
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
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dh_processo'
        Title.Alignment = taCenter
        Title.Caption = 'INICIO PROCESSO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end>
  end
  object srcConsulta: TDataSource
    DataSet = qrConsulta
    Left = 1000
    Top = 20
  end
  object qrConsulta: TADOQuery
    Connection = FPrincipal.ConexaoPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Esterilizacao')
    Left = 1056
    Top = 20
  end
  object srcListaEst: TDataSource
    DataSet = qrListaEst
    Left = 168
    Top = 12
  end
  object qrListaEst: TADOQuery
    Active = True
    Connection = FPrincipal.ConexaoPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select DISTINCT batelada, dh_processo from Esterilizacao ORDER B' +
        'Y batelada DESC')
    Left = 248
    Top = 12
  end
end
