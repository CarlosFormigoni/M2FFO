object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 
    'Rendenringsys                           M2 Tecnologia           ' +
    '        (p) 2020    Vers'#227'o 1.0R0'
  ClientHeight = 592
  ClientWidth = 1186
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 428
    Width = 31
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object Label2: TLabel
    Left = 32
    Top = 452
    Width = 31
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 573
    Width = 1186
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end>
  end
  object Panel1: TPanel
    Left = 56
    Top = 160
    Width = 289
    Height = 49
    Caption = 'Panel1'
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 333
    Top = 8
    Width = 364
    Height = 16
    Caption = 'Comunica'#231#227'o Ativa'
    Color = clLime
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 456
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 104
    object Cadastro1: TMenuItem
      Caption = 'Sistema'
      object Empresa1: TMenuItem
        Caption = 'Empresa'
        OnClick = Empresa1Click
      end
      object Usurioesenha1: TMenuItem
        Caption = 'Usu'#225'rio e senha'
        OnClick = Usurioesenha1Click
      end
      object Encerrar1: TMenuItem
        Caption = 'Encerrar'
        OnClick = Encerrar1Click
      end
    end
    object Monitoramento1: TMenuItem
      Caption = 'Ind'#250'stria'
      object Digestores: TMenuItem
        Caption = 'Digestores'
        OnClick = DigestoresClick
      end
      object Esterilizacao1: TMenuItem
        Caption = 'Esteriliza'#231#227'o'
        OnClick = Esterilizacao1Click
      end
      object Estoque1: TMenuItem
        Caption = 'Estoque'
        object Silos1: TMenuItem
          Caption = 'Silos'
        end
        object anques1: TMenuItem
          Caption = 'Tanques'
        end
      end
      object Prensas1: TMenuItem
        Caption = 'Prensas'
      end
      object Pesagens1: TMenuItem
        Caption = 'Pesagens'
        object Entrada1: TMenuItem
          Caption = 'Entrada'
        end
        object Ensacadeiras1: TMenuItem
          Caption = 'Ensacadeiras'
        end
        object Fluxo1: TMenuItem
          Caption = 'Fluxo processo'
        end
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Cozimento1: TMenuItem
        Caption = 'Cozimento'
        OnClick = Cozimento1Click
      end
      object relEsterilizacao: TMenuItem
        Caption = 'Esteriliza'#231#227'o'
        OnClick = relEsterilizacaoClick
      end
      object EficinciaOperacional1: TMenuItem
        Caption = 'Efici'#234'ncia Operacional'
        OnClick = EficinciaOperacional1Click
      end
      object empodeOperao1: TMenuItem
        Caption = 'Tempo de Opera'#231#227'o'
        OnClick = empodeOperao1Click
      end
      object empodeParadas1: TMenuItem
        Caption = 'Tempo de Paradas'
        OnClick = empodeParadas1Click
      end
    end
    object Engenharia1: TMenuItem
      Caption = 'Engenharia'
      object Calibragem1: TMenuItem
        Caption = 'Calibragem | Esterilizador'
        OnClick = Calibragem1Click
      end
      object Calibragem2: TMenuItem
        Caption = 'Calibragem | Digestores'
      end
      object ComunicaoDBA1: TMenuItem
        Caption = 'Comunica'#231#227'o DBA'
        OnClick = ComunicaoDBA1Click
      end
      object Drivercomunicao1: TMenuItem
        Caption = 'Driver comunica'#231#227'o | MODBUS'
        OnClick = Drivercomunicao1Click
      end
      object GerenciadorDBA1: TMenuItem
        Caption = 'Gerenciador DBA'
        OnClick = GerenciadorDBA1Click
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object ManualdoSoftware1: TMenuItem
        Caption = 'Manual do Software'
        OnClick = ManualdoSoftware1Click
      end
      object SobreoSistema1: TMenuItem
        Caption = 'Sobre o Sistema'
        OnClick = SobreoSistema1Click
      end
    end
  end
  object ConexaoPrincipal: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=m2db;Data Source=(local)\SQ' +
      'LEXPRESS;Initial File Name="";Server SPN="";'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 16
    Top = 508
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 80
    Top = 424
  end
end
