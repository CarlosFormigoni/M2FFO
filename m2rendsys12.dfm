object FGerenciadorEst: TFGerenciadorEst
  Left = 0
  Top = 0
  Caption = 'Gerenciador Bateladas'
  ClientHeight = 616
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 61
    Width = 91
    Height = 13
    Caption = 'C'#243'digo Batelada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 136
    Top = 61
    Width = 27
    Height = 13
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 247
    Top = 61
    Width = 64
    Height = 13
    Caption = 'Hora Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 136
    Top = 106
    Width = 81
    Height = 13
    Caption = 'Confirma Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 247
    Top = 107
    Width = 81
    Height = 13
    Caption = 'Confirma Hora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 376
    Top = 61
    Width = 82
    Height = 13
    Caption = 'Press'#227'o Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 496
    Top = 61
    Width = 72
    Height = 13
    Caption = 'Temp. Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPrincipal: TSpeedButton
    Left = 8
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
  object btnGerarEst: TBitBtn
    Left = 656
    Top = 177
    Width = 121
    Height = 33
    Caption = 'GERAR'
    Enabled = False
    TabOrder = 5
    OnClick = btnGerarEstClick
  end
  object ConfDataEst: TEdit
    Left = 136
    Top = 121
    Width = 105
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object ConfHoraEst: TEdit
    Left = 247
    Top = 121
    Width = 105
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object SelDataEst: TDateTimePicker
    Left = 136
    Top = 80
    Width = 105
    Height = 21
    Date = 44001.826001342590000000
    Time = 44001.826001342590000000
    TabOrder = 1
    OnChange = SelDataEstChange
  end
  object SelHoraEst: TDateTimePicker
    Left = 247
    Top = 80
    Width = 105
    Height = 21
    Date = 44001.826001342590000000
    Format = 'hh:mm'
    Time = 44001.826001342590000000
    Kind = dtkTime
    TabOrder = 2
    OnChange = SelHoraEstChange
  end
  object txNumBatelada: TEdit
    Left = 8
    Top = 80
    Width = 105
    Height = 21
    Color = clCream
    TabOrder = 0
    OnExit = txNumBateladaExit
  end
  object grDadosInseridos: TDBGrid
    Left = 8
    Top = 216
    Width = 769
    Height = 337
    DataSource = srcConsultaEstg
    TabOrder = 8
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
        FieldName = 'dh_processo'
        Title.Alignment = taCenter
        Title.Caption = 'INICIO'
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
        FieldName = 'datahora'
        Title.Alignment = taCenter
        Title.Caption = 'DATA/HORA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 110
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
      end>
  end
  object txSpPressaoEstg: TEdit
    Left = 376
    Top = 80
    Width = 105
    Height = 21
    Color = clCream
    TabOrder = 3
    OnChange = txSpPressaoEstgChange
  end
  object txSpTempEstg: TEdit
    Left = 496
    Top = 80
    Width = 105
    Height = 21
    Color = clCream
    TabOrder = 4
    OnChange = txSpTempEstgChange
  end
  object btnValidarEst: TBitBtn
    Left = 656
    Top = 78
    Width = 105
    Height = 25
    Caption = 'VALIDAR'
    TabOrder = 9
    OnClick = btnValidarEstClick
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 559
    Width = 145
    Height = 34
    Caption = 'CONS. ULTIMO PROCESSO'
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object srcInsertEst: TDataSource
    DataSet = qrInsertEst
    Left = 549
    Top = 172
  end
  object qrInsertEst: TADOQuery
    Connection = FPrincipal.ConexaoPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 477
    Top = 172
  end
  object qrConsultaEstg: TADOQuery
    Connection = FPrincipal.ConexaoPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 637
    Top = 564
  end
  object srcConsultaEstg: TDataSource
    DataSet = qrConsultaEstg
    Left = 717
    Top = 564
  end
end
