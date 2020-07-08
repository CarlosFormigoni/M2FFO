object Form7: TForm7
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Verifica'#231#227'o DBA'
  ClientHeight = 370
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 155
    Top = 19
    Width = 217
    Height = 25
    Caption = 'Checar integridade do banco de dados'
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 24
    Top = 56
    Width = 497
    Height = 233
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 299
    Width = 89
    Height = 25
    Caption = 'Limpar texto'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 493
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = Button3Click
  end
end
