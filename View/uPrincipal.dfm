object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 407
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 351
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 8
    Top = 351
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object DBGPessoa: TDBGrid
    Left = 5
    Top = 8
    Width = 593
    Height = 337
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtNumero: TEdit
    Left = 8
    Top = 370
    Width = 41
    Height = 21
    TabOrder = 1
  end
  object edtNome: TEdit
    Left = 64
    Top = 370
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnIncluir: TButton
    Left = 501
    Top = 368
    Width = 97
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = btnIncluirClick
  end
end
