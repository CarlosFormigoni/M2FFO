object FConfiguracaoDriver: TFConfiguracaoDriver
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o Driver'
  ClientHeight = 343
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
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
  end
  object Label1: TLabel
    Left = 8
    Top = 74
    Width = 165
    Height = 13
    Caption = 'TIPO DE PROTOCOLO MODBUS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 263
    Width = 92
    Height = 13
    Caption = 'Selecionada porta  '
  end
  object Label5: TLabel
    Left = 114
    Top = 263
    Width = 25
    Height = 13
    Caption = 'COM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ListaProtocolos: TComboBox
    Left = 8
    Top = 93
    Width = 165
    Height = 21
    TabOrder = 0
    Items.Strings = (
      'MODBUS RTU'
      'MODBUS TCP/IP')
  end
  object TabbedNotebook1: TTabbedNotebook
    Left = 8
    Top = 136
    Width = 300
    Height = 121
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    TabOrder = 1
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Serial/RS485'
      object Label2: TLabel
        Left = 4
        Top = 21
        Width = 45
        Height = 13
        Caption = 'PORTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object combo_listacoms: TComboBox
        Left = 4
        Top = 40
        Width = 145
        Height = 21
        TabOrder = 0
        OnChange = combo_listacomsChange
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Ethernet'
      object Label4: TLabel
        Left = 4
        Top = 21
        Width = 12
        Height = 13
        Caption = 'IP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object tx_ipcom: TEdit
        Left = 4
        Top = 40
        Width = 137
        Height = 21
        TabOrder = 0
        Text = 'tx_ipcom'
      end
    end
  end
  object Button1: TButton
    Left = 74
    Top = 294
    Width = 153
    Height = 25
    Caption = 'Iniciar Comunica'#231#227'o'
    Enabled = False
    TabOrder = 2
    OnClick = Button1Click
  end
end
