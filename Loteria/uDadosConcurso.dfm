object fDadosConcurso: TfDadosConcurso
  Left = 140
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fDadosConcurso - DADOS DO CONCURSO'
  ClientHeight = 422
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 422
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 547
      Top = 12
      Width = 100
      Height = 29
      Caption = 'N'#186' Bol'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 399
      Top = 294
      Width = 116
      Height = 29
      Caption = 'Resultado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 399
      Top = 190
      Width = 103
      Height = 29
      Caption = 'Vari'#225'veis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 399
      Top = 86
      Width = 63
      Height = 29
      Caption = 'Fixos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 399
      Top = 12
      Width = 112
      Height = 29
      Caption = 'Concurso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 243
      Top = 12
      Width = 100
      Height = 29
      Caption = 'N'#186' Bol'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 15
      Top = 86
      Width = 361
      Height = 307
      DataSource = dsSORTEIO
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CONTADOR'
          Title.Caption = 'Cod.'
          Width = 39
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DELETADO'
          Title.Caption = 'Del.'
          Width = 24
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMBOLAO'
          Title.Caption = 'N'#186' Bol'#227'o'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SORTEIO'
          Title.Caption = 'Concurso'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTBOLAO'
          Title.Caption = 'Dt. Bol'#227'o'
          Width = 147
          Visible = True
        end>
    end
    object Radio1: TRadioGroup
      Left = 135
      Top = 12
      Width = 90
      Height = 68
      Caption = ' Consultar por '
      ItemIndex = 0
      Items.Strings = (
        'N'#186' Bol'#227'o'
        'Concurso')
      TabOrder = 2
      OnClick = Radio1Click
    end
    object Edit1: TEdit
      Left = 243
      Top = 43
      Width = 133
      Height = 37
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'Edit1'
      OnExit = Edit1Exit
      OnKeyUp = Edit1KeyUp
    end
    object DBMemo1: TDBMemo
      Left = 399
      Top = 323
      Width = 281
      Height = 70
      Color = 11075583
      DataField = 'RESULTADO'
      DataSource = dsSORTEIO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object DBMemo2: TDBMemo
      Left = 399
      Top = 219
      Width = 281
      Height = 70
      Color = 11075583
      DataField = 'VARIAVEIS'
      DataSource = dsSORTEIO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object DBMemo3: TDBMemo
      Left = 399
      Top = 115
      Width = 281
      Height = 70
      Color = 11075583
      DataField = 'FIXOS'
      DataSource = dsSORTEIO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit1: TDBEdit
      Left = 399
      Top = 43
      Width = 133
      Height = 37
      BiDiMode = bdRightToLeft
      Color = 11075583
      DataField = 'SORTEIO'
      DataSource = dsSORTEIO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 547
      Top = 43
      Width = 133
      Height = 37
      BiDiMode = bdRightToLeft
      Color = 11075583
      DataField = 'NUMBOLAO'
      DataSource = dsSORTEIO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object Radio2: TRadioGroup
      Left = 15
      Top = 12
      Width = 106
      Height = 68
      Caption = ' Deletados '
      ItemIndex = 1
      Items.Strings = (
        'Mostrar'
        'N'#227'o Mostrar')
      TabOrder = 1
      OnClick = Radio2Click
    end
  end
  object dsSORTEIO: TDataSource
    DataSet = qrSORTEIO
    Left = 288
    Top = 184
  end
  object qrSORTEIO: TIBQuery
    Database = fDM.DB
    Transaction = fDM.Transacao
    SQL.Strings = (
      'SELECT * FROM SORTEIOS')
    Left = 216
    Top = 184
  end
end
