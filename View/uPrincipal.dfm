object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 357
  ClientWidth = 614
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
  object Button1: TButton
    Left = 480
    Top = 24
    Width = 121
    Height = 33
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGPessoa: TDBGrid
    Left = 8
    Top = 63
    Width = 593
    Height = 244
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnAbrirTab: TButton
    Left = 488
    Top = 313
    Width = 113
    Height = 33
    Caption = 'Abrir Tabela'
    TabOrder = 2
    OnClick = btnAbrirTabClick
  end
  object FDConnection1: TFDConnection
    LoginPrompt = False
    Left = 40
    Top = 8
  end
end
