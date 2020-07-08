object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = '   Identifica'#231#227'o de usu'#225'rio'
  ClientHeight = 211
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 27
    Width = 54
    Height = 19
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 128
    Top = 81
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
  object Button1: TButton
    Left = 352
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Encerrar'
    ModalResult = 2
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 128
    Top = 48
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object MaskEdit1: TMaskEdit
    Left = 128
    Top = 104
    Width = 164
    Height = 21
    EditMask = '!99999;1;*'
    MaxLength = 5
    TabOrder = 2
    Text = '     '
  end
  object Button2: TButton
    Left = 222
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Login'
    Default = True
    TabOrder = 3
    OnClick = Button2Click
  end
end
