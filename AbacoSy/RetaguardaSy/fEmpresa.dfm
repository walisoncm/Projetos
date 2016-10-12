object FormEmpresa: TFormEmpresa
  Left = 617
  Top = 309
  Caption = 'FormEmpresa'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = edtCodEmpresa
  end
  object Label2: TLabel
    Left = 136
    Top = 11
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = edtNomeEmpresa
  end
  object edtCodEmpresa: TEdit
    Left = 55
    Top = 8
    Width = 65
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
  end
  object edtNomeEmpresa: TEdit
    Left = 169
    Top = 8
    Width = 288
    Height = 21
    TabOrder = 1
  end
  object btnNovo: TBitBtn
    Left = 8
    Top = 266
    Width = 75
    Height = 25
    Caption = '&Novo'
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnSalvar: TBitBtn
    Left = 89
    Top = 266
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnAlterar: TBitBtn
    Left = 170
    Top = 266
    Width = 75
    Height = 25
    Caption = '&Alterar'
    TabOrder = 4
    OnClick = btnAlterarClick
  end
end
