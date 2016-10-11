object fDM: TfDM
  OldCreateOrder = False
  Height = 182
  Width = 464
  object dsVisualizar: TDataSource
    DataSet = qrVisualizar
    Left = 408
    Top = 8
  end
  object qrVisualizar: TIBQuery
    Database = DB
    Transaction = Transacao
    SQL.Strings = (
      'SELECT SORTEIOS.RESULTADO'
      'FROM SORTEIOS'
      'WHERE SORTEIOS.DTRESULTADO BETWEEN :pDATAINI AND :pDATAFIM')
    Left = 344
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pDATAFIM'
        ParamType = ptUnknown
      end>
  end
  object DB: TIBDatabase
    DatabaseName = 'X:\Loteria\Win32\Debug\DADOS\LOTERIA.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 8
    Top = 8
  end
  object Transacao: TIBTransaction
    DefaultDatabase = DB
    Left = 56
    Top = 8
  end
  object qrVerifica: TIBQuery
    Database = DB
    Transaction = Transacao
    SQL.Strings = (
      'SELECT * FROM SEQUENCIAS'
      'WHERE NUMSORTEIO = :pSORTEIO')
    Left = 344
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSORTEIO'
        ParamType = ptUnknown
      end>
  end
  object tSORTEIOS: TIBDataSet
    Database = DB
    Transaction = Transacao
    SelectSQL.Strings = (
      'SELECT * FROM SORTEIOS')
    Left = 56
    Top = 72
    object tSORTEIOSCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Origin = '"SORTEIOS"."CONTADOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tSORTEIOSSORTEIO: TIntegerField
      FieldName = 'SORTEIO'
      Origin = '"SORTEIOS"."SORTEIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tSORTEIOSNUMBOLAO: TIntegerField
      FieldName = 'NUMBOLAO'
      Origin = '"SORTEIOS"."NUMBOLAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tSORTEIOSFIXOS: TIBStringField
      FieldName = 'FIXOS'
      Origin = '"SORTEIOS"."FIXOS"'
      Size = 149
    end
    object tSORTEIOSVARIAVEIS: TIBStringField
      FieldName = 'VARIAVEIS'
      Origin = '"SORTEIOS"."VARIAVEIS"'
      Size = 149
    end
    object tSORTEIOSDTBOLAO: TDateTimeField
      FieldName = 'DTBOLAO'
      Origin = '"SORTEIOS"."DTBOLAO"'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object tSORTEIOSDTDELETADO: TDateTimeField
      FieldName = 'DTDELETADO'
      Origin = '"SORTEIOS"."DTDELETADO"'
    end
    object tSORTEIOSDELETADO: TIBStringField
      FieldName = 'DELETADO'
      Origin = '"SORTEIOS"."DELETADO"'
      FixedChar = True
      Size = 1
    end
    object tSORTEIOSDTRESULTADO: TDateTimeField
      FieldName = 'DTRESULTADO'
      Origin = '"SORTEIOS"."DTRESULTADO"'
    end
    object tSORTEIOSRESULTADO: TIBStringField
      FieldName = 'RESULTADO'
      Origin = '"SORTEIOS"."RESULTADO"'
      Size = 149
    end
  end
end
