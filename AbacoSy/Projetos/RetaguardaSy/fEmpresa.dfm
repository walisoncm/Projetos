object FormEmpresa: TFormEmpresa
  Left = 0
  Top = 0
  Caption = 'FormEmpresa'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = Edit1
  end
  object Label2: TLabel
    Left = 136
    Top = 11
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = Edit2
  end
  object Edit1: TEdit
    Left = 55
    Top = 8
    Width = 65
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 169
    Top = 8
    Width = 288
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Memo1: TMemo
    Left = 89
    Top = 58
    Width = 368
    Height = 223
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
