object FormMenu: TFormMenu
  Left = 0
  Top = 0
  Caption = 'ABACO - RetaguardaSy'
  ClientHeight = 520
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 501
    Width = 920
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 540
    Top = 0
    Width = 380
    Height = 501
    Align = alRight
    BevelOuter = bvLowered
    Caption = 'Panel1'
    Constraints.MinWidth = 380
    TabOrder = 1
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 378
      Height = 499
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 424
      ExplicitHeight = 501
      ControlData = {
        4C00000011270000933300000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 112
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        object CadastrodeClientes1: TMenuItem
          Caption = 'Cadastro de Clientes'
          OnClick = CadastrodeClientes1Click
        end
      end
      object Empresa1: TMenuItem
        Caption = 'Empresa'
        object CadastrodeEmpresa1: TMenuItem
          Caption = 'Cadastro de Empresa'
          OnClick = CadastrodeEmpresa1Click
        end
      end
    end
    object Utilitrios1: TMenuItem
      Caption = 'Utilit'#225'rios'
      object AtualizaBancodeDados1: TMenuItem
        Caption = 'Atualiza Banco de Dados'
        OnClick = AtualizaBancodeDados1Click
      end
    end
  end
end
