object Form6: TForm6
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Usu'#225'rio e senha'
  ClientHeight = 307
  ClientWidth = 570
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
  object label1: TLabel
    Left = 104
    Top = 19
    Width = 42
    Height = 19
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 59
    Width = 133
    Height = 19
    Caption = #218'ltimo Sobrenome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 25
    Top = 171
    Width = 121
    Height = 19
    Caption = 'Nome de usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 103
    Top = 203
    Width = 43
    Height = 19
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 104
    Top = 99
    Width = 42
    Height = 19
    Caption = 'Cargo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 110
    Top = 141
    Width = 36
    Height = 19
    Caption = 'Perfil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 152
    Top = 21
    Width = 249
    Height = 21
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 152
    Top = 61
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 152
    Top = 101
    Width = 193
    Height = 21
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 152
    Top = 139
    Width = 217
    Height = 21
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 152
    Top = 173
    Width = 193
    Height = 21
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 152
    Top = 201
    Width = 193
    Height = 21
    TabOrder = 5
  end
  object Button1: TButton
    Left = 482
    Top = 262
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 6
    OnClick = Button1Click
  end
  object DBNavigator1: TDBNavigator
    Left = 121
    Top = 254
    Width = 280
    Height = 33
    Hints.Strings = (
      'Vai para 1o registro'
      'Vai para registro anterior'
      'Vai para proximo registro'
      'Vai para o '#250'ltimo registro'
      'Inserir novo registro'
      'Apagar registro do cadastro'
      'Editar dados'
      'Gravar altera'#231#245'es'
      'Cancelar edi'#231#227'o'
      'Atualizar dados na tela'
      'Apply updates  '
      'Cancel updates')
    TabOrder = 7
  end
end
