//***CRIAR PROPRIEDADE DEPENDENCIA NA "TTabela" PARA ARMAZENAR AS DEPENDECIAS
//*  NO CREATE DO "TBanco" ORDENAR A PROPRIEDADE "Tabela" COM BASE NAS
//   DEPENDENCIAS. PARA QUE NÃO DÊ ERRO DE DEPENDÊNCIA AO EXCLUIR UMA TABELA.
unit uComunicaDB;

interface

uses
  Classes, SqlExpr, uDB, uFuncoes;

const
  ID_YES = 6;

type
  TTabela = class(uDB.TTabela)
  private
    function CheckFields: Boolean;
    procedure AddField(AField: TCampo);
    procedure DropField(AField: String);
    procedure AlterField(AField: TCampo);
    function InserirRegistro: Boolean;
    function EditarRegistro: Boolean;
    procedure CheckChaveE;
    procedure CheckChaveP;
  public
    procedure Atualizar;
    function Salvar: Boolean;
  end;

  TBanco = class(TList)
  private
    FLOG: TStrings;
    FQuery: TSQLQuery;
    FTabelas: TStrings;
    function Get(Index: Integer): TTabela;
    procedure Put(Index: Integer; const Value: TTabela);
    function CreateTable(ATabela: TTabela): Boolean;
    procedure SetQuery(const Value: TSQLQuery);
    function CheckDependencies(ATabela: TTabela): Boolean;
    procedure SetTabelas(const Value: TStrings);
  published
    property LOG: TStrings read FLOG;
    property Query: TSQLQuery read FQuery write SetQuery;
    property Tabelas: TStrings read FTabelas write SetTabelas;
  public
    constructor Create;
    destructor Destroy;

    property Items[Index: Integer]: TTabela read Get write Put; default;
    procedure AddTable(ATabela: TTabela);
    function DropTable(ATabela: String): Boolean;

    procedure CheckTables;
    procedure AtualizaDB;
  end;

  TPos = (pLeft, pRigth);

  function Conectado: Boolean;

var
  WBanco          : TBanco;
  WSQLConnection  : TSQLConnection;
  WTransactionDesc: TTransactionDesc;

implementation

uses SysUtils, DBXFirebird, DB, Windows;

function AddChar(AString: String; AChar: Char; ALength: Integer;
  APos: TPos = pLeft): String;
var
  I, Z: Integer;
begin
  Result := AString;

  while Length(Result) < ALength do
  begin
    if APos = pLeft then
       Result := Result + AChar
    else if APos = pRigth then
       Result := AChar + Result;
  end;
end;

function Conectado: Boolean;
begin
  WSQLConnection := TSQLConnection.Create(Nil);

  WSQLConnection.ConnectionName      := 'ABACO';
  WSQLConnection.LoadParamsOnConnect := False;
  WSQLConnection.LoginPrompt         := False;
  WSQLConnection.DriverName          := 'Firebird';
  WSQLConnection.LibraryName         := 'dbxint.dll';
  WSQLConnection.VendorLib           := 'GDS32.DLL';
  WSQLConnection.LocaleCode          := 0;

  WSQLConnection.Params.Add('DriverName=Firebird');
  WSQLConnection.Params.Add('DriverUnit=Data.DBXFirebird');
  WSQLConnection.Params.Add(  '');
  WSQLConnection.Params.Add(  'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver240.');
  WSQLConnection.Params.Add(  'bpl');
  WSQLConnection.Params.Add(  '');
  WSQLConnection.Params.Add(  'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla');
  WSQLConnection.Params.Add(  'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK');
  WSQLConnection.Params.Add(  'eyToken=91d62ebb5b0d1b1b');
  WSQLConnection.Params.Add(  '');
  WSQLConnection.Params.Add(  'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire');
  WSQLConnection.Params.Add(  'birdDriver240.bpl');
  WSQLConnection.Params.Add(  '');
  WSQLConnection.Params.Add(  'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF');
  WSQLConnection.Params.Add(  'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n');
  WSQLConnection.Params.Add(  'eutral,PublicKeyToken=91d62ebb5b0d1b1b');
  WSQLConnection.Params.Add('LibraryName=dbxfb.dll');
  WSQLConnection.Params.Add('LibraryNameOsx=libsqlfb.dylib');
  WSQLConnection.Params.Add('VendorLib=fbclient.dll');
  WSQLConnection.Params.Add('VendorLibWin64=fbclient.dll');
  WSQLConnection.Params.Add('VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird');
  WSQLConnection.Params.Add('User_Name=sysdba');
  WSQLConnection.Params.Add('Password=masterkey');
  WSQLConnection.Params.Add('Role=RoleName');
  WSQLConnection.Params.Add('MaxBlobSize=-1');
  WSQLConnection.Params.Add('LocaleCode=0000');
  WSQLConnection.Params.Add('IsolationLevel=ReadCommitted');
  WSQLConnection.Params.Add('SQLDialect=3');
  WSQLConnection.Params.Add('CommitRetain=False');
  WSQLConnection.Params.Add('WaitOnLocks=True');
  WSQLConnection.Params.Add('TrimChar=False');
  WSQLConnection.Params.Add('BlobSize=-1');
  WSQLConnection.Params.Add('ErrorResourceFile=');
  WSQLConnection.Params.Add('RoleName=RoleName');
  WSQLConnection.Params.Add('ServerCharSet=');
  WSQLConnection.Params.Add('Trim Char=False');
  WSQLConnection.Params.Add('Database=E:\Projetos\Banco\DADOS.FDB');

  WSQLConnection.Open;

  Result := WSQLConnection.Connected;
end;

{ TTabelas }

procedure TTabela.AddField(AField: TCampo);
begin
  WTransactionDesc.TransactionID  := 1;
  WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
  WSQLConnection.StartTransaction(WTransactionDesc);

  try
    WSQLConnection.ExecuteDirect('ALTER TABLE ' + Nome + ' ADD ' +
                                 AField.Nome + ' ' + AField.Tipo);
    WSQLConnection.Commit(WTransactionDesc);
    FLOG.Add('Campo ' + AField.Nome + ' adicionado com sucesso!');
  except
    on E: Exception do
    begin
      WSQLConnection.Rollback(WTransactionDesc);

      FLOG.Add('Erro ao adicionar o campo ' + AField.Nome +
               '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
    end;
  end;
end;

procedure TTabela.AlterField(AField: TCampo);
begin
  WTransactionDesc.TransactionID  := 1;
  WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
  WSQLConnection.StartTransaction(WTransactionDesc);

  try
    WSQLConnection.ExecuteDirect('ALTER TABLE ' + Nome + ' ALTER ' +
                                 AField.Nome + ' TYPE ' + AField.Tipo);
    WSQLConnection.Commit(WTransactionDesc);
    FLOG.Add('Campo ' + AField.Nome + ' alterado com sucesso!');
  except
    on E: Exception do
    begin
      WSQLConnection.Rollback(WTransactionDesc);

      FLOG.Add('Erro ao alterar o campo ' + AField.Nome +
               '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
    end;
  end;
end;

procedure TTabela.DropField(AField: String);
begin
  WTransactionDesc.TransactionID  := 1;
  WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
  WSQLConnection.StartTransaction(WTransactionDesc);

  try
    WSQLConnection.ExecuteDirect('ALTER TABLE ' + Nome + ' DROP ' + AField);
    WSQLConnection.Commit(WTransactionDesc);
    FLOG.Add('Campo ' + AField + ' removido com sucesso!');
  except
    on E: Exception do
    begin
      WSQLConnection.Rollback(WTransactionDesc);

      FLOG.Add('Erro ao remover o campo ' + AField +
               '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
    end;
  end;
end;

function TTabela.InserirRegistro: Boolean;
var
  I: Integer;
begin
  Result := False;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('INSERT INTO ' + Nome + ' (');

  for I := 0 to Pred(Campos.Count) do
  begin
    if I = Pred(Campos.Count) then
       Query.SQL.Add(Campos.Campo[I].Nome + ') VALUES (')
    else if not (Campos.Campo[I].Nome = Contador) then
       Query.SQL.Add(Campos.Campo[I].Nome + ',');
  end;

  for I := 0 to Pred(Campos.Count) do
  begin
    if I = Pred(Campos.Count) then
       Query.SQL.Add('''' + Campos.Campo[I].AsString + ''')')
    else if not (Campos.Campo[I].Nome = Contador) then
       Query.SQL.Add('''' + Campos.Campo[I].AsString + ''',');
  end;

  WTransactionDesc.TransactionID  := 1;
  WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
  WSQLConnection.StartTransaction(WTransactionDesc);

  try
    WSQLConnection.ExecuteDirect(Query.SQL.Text);
    WSQLConnection.Commit(WTransactionDesc);
    FLOG.Add('Inserido com sucesso!');
    Result := True;
  except
    on E: Exception do
    begin
      WSQLConnection.Rollback(WTransactionDesc);

      FLOG.Add('Erro ao inserir. ' +
               E.ClassName + ': ' + '(' + E.Message + ')');
    end;
  end;
end;

function TTabela.EditarRegistro: Boolean;
var
  I: Integer;
begin
  Result := False;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('UPDATE ' + Nome + ' SET ');

  for I := 0 to Campos.Count -2 do
  begin
    if I = Pred(Campos.Count) then
       Query.SQL.Add(Campos.Campo[I].Nome + ' = ' + Campos.Campo[I].AsString)
    else if not (Campos.Campo[I].Nome = Contador) then
       Query.SQL.Add(Campos.Campo[I].Nome + ' = ' + Campos.Campo[I].AsString + ',');
  end;

  Query.SQL.Add('WHERE');

  for I := 0 to ChaveP.Count -2 do
  begin
    if I = Pred(Campos.Count) then
       Query.SQL.Add(ChaveP[I] + ' = ' + Campos.Obj(ChaveP[I]).AsString)
    else
       Query.SQL.Add(ChaveP[I] + ' = ' + Campos.Obj(ChaveP[I]).AsString + ' AND ');
  end;

  Query.SQL.Add(Contador + ' = ' + Campos.Obj(Contador).AsString);

  WTransactionDesc.TransactionID  := 1;
  WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
  WSQLConnection.StartTransaction(WTransactionDesc);

  try
    WSQLConnection.ExecuteDirect(Query.SQL.Text);
    WSQLConnection.Commit(WTransactionDesc);
    FLOG.Add('Inserido com sucesso!');
    Result := True;
  except
    on E: Exception do
    begin
      WSQLConnection.Rollback(WTransactionDesc);

      FLOG.Add('Erro ao inserir. ' +
               E.ClassName + ': ' + '(' + E.Message + ')');
    end;
  end;
end;

function TTabela.Salvar: Boolean;
begin
  Result := False;

  if not CheckFields then
     Exit;

  if Estado = tbInsert then
  begin
    if not InserirRegistro then
       Exit;
  end
  else if Estado = tbEdit then
    if not EditarRegistro then
       Exit;

  Result := True;
end;

procedure TTabela.CheckChaveE;
var
  I: Integer;
  xAchou: Boolean;

  procedure DropChaveE;
  begin
    WTransactionDesc.TransactionID  := 1;
    WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
    WSQLConnection.StartTransaction(WTransactionDesc);

    try
      WSQLConnection.ExecuteDirect('ALTER TABLE ' + Nome + ' ' +
                                   'DROP CONSTRAINT FK_' + ChaveE[I].Nome);
      WSQLConnection.Commit(WTransactionDesc);
      FLOG.Add('Chave estrangeira FK_' + ChaveE[I].Nome + ' removida com sucesso!');
    except
      on E: Exception do
      begin
        WSQLConnection.Rollback(WTransactionDesc);

        FLOG.Add('Erro ao remover chave estrangeira FK_' + ChaveE[I].Nome +
                 '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
      end;
    end;
  end;

  procedure AddChaveE;
  begin
    WTransactionDesc.TransactionID  := 1;
    WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
    WSQLConnection.StartTransaction(WTransactionDesc);

    try
      WSQLConnection.ExecuteDirect('ALTER TABLE ' + Nome + ' ' +
                                   'ADD CONSTRAINT FK_' + ChaveE[I].Nome + ' ' +
                                   'FOREIGN KEY (' + ChaveE[I].Contador + ') ' +
                                   'REFERENCES ' + ChaveE[I].Nome + '(' +
                                   ChaveE[I].Contador + ') ' +
                                   'ON DELETE CASCADE ON UPDATE CASCADE');
      WSQLConnection.Commit(WTransactionDesc);
      FLOG.Add('Chave estrangeira FK_' + ChaveE[I].Nome + ' incluída com sucesso!');
    except
      on E: Exception do
      begin
        WSQLConnection.Rollback(WTransactionDesc);

        FLOG.Add('Erro ao incluir chave estrangeira FK_' + ChaveE[I].Nome +
                 '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
      end;
    end;
  end;

  procedure AlterChaveE;
  begin
    DropChaveE;
    AddChaveE;
  end;
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT RDB$INDEX_SEGMENTS.RDB$FIELD_NAME AS CAMPO,');
  Query.SQL.Add('       RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_NAME AS CHAVE');
  Query.SQL.Add('FROM RDB$RELATION_CONSTRAINTS,');
  Query.SQL.Add('     RDB$INDICES,');
  Query.SQL.Add('     RDB$INDEX_SEGMENTS');
  Query.SQL.Add('WHERE RDB$RELATION_CONSTRAINTS.RDB$RELATION_NAME = :pTABELA');
  Query.SQL.Add('  AND RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = :pTIPO');
  Query.SQL.Add('  AND RDB$RELATION_CONSTRAINTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME');
  Query.SQL.Add('  AND RDB$INDEX_SEGMENTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME');
  Query.SQL.Add('ORDER BY RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_NAME');

  Query.ParamByName('pTABELA').AsString := Nome;
  Query.ParamByName('pTIPO').AsString   := 'FOREIGN KEY';

  Query.Open;
  Query.First;
  while not Query.Eof do
  begin
    xAchou := False;

    for I := 0 to Pred(ChaveE.Count) do
    begin
      if Trim(Query.FieldByName('CHAVE').AsString) = 'FK_' + ChaveE[I].Nome then
      begin
        if Trim(Query.FieldByName('CAMPO').AsString) <> ChaveE[I].Contador then
        begin
          AlterChaveE;
        end;

        xAchou := True;
        Break;
      end;
    end;

    if not xAchou then
    begin
      DropChaveE;
    end;

    Query.Next;
  end;

  Query.Close;
  Query.Open;

  for I := 0 to Pred(ChaveE.Count) do
  begin
    xAchou := False;
    Query.First;
    while not Query.Eof do
    begin
      if Trim(Query.FieldByName('CHAVE').AsString) = 'FK_' + ChaveE[I].Nome then
      begin
        xAchou := True;
        Break;
      end;

      Query.Next;
    end;

    if not xAchou then
       AddChaveE;
  end;
end;

procedure TTabela.CheckChaveP;
var
  I: Integer;
  xAchou: Boolean;

  procedure DropChaveP;
  begin
    WTransactionDesc.TransactionID  := 1;
    WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
    WSQLConnection.StartTransaction(WTransactionDesc);

    try
      WSQLConnection.ExecuteDirect('ALTER TABLE ' + Nome + ' ' +
                                   'DROP CONSTRAINT PK_' + Nome);
      WSQLConnection.Commit(WTransactionDesc);
      FLOG.Add('Chave primária PK_' + Nome + ' removida com sucesso!');
    except
      on E: Exception do
      begin
        WSQLConnection.Rollback(WTransactionDesc);

        FLOG.Add('Erro ao remover chave primária PK_' + Nome +
                 '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
      end;
    end;
  end;

  procedure AddChaveP;
  var
    I: Integer;
    xKey: String;
  begin
    xKey := ChaveP[0];

    for I := 1 to Pred(ChaveP.Count) do
      xKey := xKey + ',' + ChaveP[I];

    WTransactionDesc.TransactionID  := 1;
    WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
    WSQLConnection.StartTransaction(WTransactionDesc);

    try
      WSQLConnection.ExecuteDirect('ALTER TABLE ' + Nome + ' ' +
                                   'ADD CONSTRAINT PK_' + Nome + ' ' +
                                   'PRIMARY KEY (' + xKey + ')');
      WSQLConnection.Commit(WTransactionDesc);
      FLOG.Add('Chave primária PK_' + Nome + ' incluída com sucesso!');
    except
      on E: Exception do
      begin
        WSQLConnection.Rollback(WTransactionDesc);

        FLOG.Add('Erro ao incluir chave primária PK_' + Nome +
                 '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
      end;
    end;
  end;

  procedure AlterChaveP;
  begin
    DropChaveP;
    AddChaveP;
  end;
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT RDB$INDEX_SEGMENTS.RDB$FIELD_NAME AS CAMPO,');
  Query.SQL.Add('       RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_NAME AS CHAVE');
  Query.SQL.Add('FROM RDB$RELATION_CONSTRAINTS,');
  Query.SQL.Add('     RDB$INDICES,');
  Query.SQL.Add('     RDB$INDEX_SEGMENTS');
  Query.SQL.Add('WHERE RDB$RELATION_CONSTRAINTS.RDB$RELATION_NAME = :pTABELA');
  Query.SQL.Add('  AND RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = :pTIPO');
  Query.SQL.Add('  AND RDB$RELATION_CONSTRAINTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME');
  Query.SQL.Add('  AND RDB$INDEX_SEGMENTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME');
  Query.SQL.Add('ORDER BY RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_NAME');

  Query.ParamByName('pTABELA').AsString := Nome;
  Query.ParamByName('pTIPO').AsString   := 'PRIMARY KEY';

  Query.Open;
  Query.First;
  while not Query.Eof do
  begin
    xAchou := False;

    for I := 0 to Pred(ChaveP.Count) do
    begin
      if Trim(Query.FieldByName('CAMPO').AsString) = ChaveP[I] then
      begin
        xAchou := True;
        Break;
      end;
    end;

    if not xAchou then
    begin
      DropChaveP;
    end;

    Query.Next;
  end;

  Query.Close;
  Query.Open;

  for I := 0 to Pred(ChaveP.Count) do
  begin
    xAchou := False;
    Query.First;
    while not Query.Eof do
    begin
      if Trim(Query.FieldByName('CAMPO').AsString) = ChaveP[I] then
      begin
        xAchou := True;
        Break;
      end;

      Query.Next;
    end;

    if not xAchou then
       if Query.Bof and Query.Eof then
          AddChaveP
       else
          AlterChaveP;
  end;
end;

function TTabela.CheckFields: Boolean;
var
  I        : Integer;
  xAchou   : Boolean;
begin
  Result := True;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT DISTINCT TRIM(NOME_CAMPO) AS NOME_CAMPO,');
  Query.SQL.Add('       TRIM(TRIM(TIPO_CAMPO) ||');
  Query.SQL.Add('       CASE TIPO_CAMPO');
  Query.SQL.Add('         WHEN ''CHAR''    THEN ''('' || TRIM(TAMANHO_CAMPO) || '')''');
  Query.SQL.Add('         WHEN ''VARCHAR'' THEN ''('' || TRIM(TAMANHO_CAMPO) || '')''');
  Query.SQL.Add('         WHEN ''NUMERIC'' THEN ''('' || TRIM(PRECISAO_CAMPO) || '','' || TRIM(ESCALA_CAMPO*-1) || '')''');
  Query.SQL.Add('         ELSE ''''');
  Query.SQL.Add('       END || ');
  Query.SQL.Add('       RESTRICAO_NOTNULL_CAMPO) AS TIPO_CAMPO');
  Query.SQL.Add('FROM');
  Query.SQL.Add('(SELECT R.RDB$FIELD_NAME AS NOME_CAMPO,');
  Query.SQL.Add('        R.RDB$DESCRIPTION AS DESCRICAO_CAMPO,');
  Query.SQL.Add('        R.RDB$DEFAULT_VALUE AS VALOR_PADRAO_CAMPO,');
  Query.SQL.Add('        CASE R.RDB$NULL_FLAG');
  Query.SQL.Add('          WHEN 1 THEN '' NOT NULL''');
  Query.SQL.Add('          ELSE ''''');
  Query.SQL.Add('        END AS RESTRICAO_NOTNULL_CAMPO,');
  Query.SQL.Add('        F.RDB$FIELD_LENGTH AS TAMANHO_CAMPO,');
  Query.SQL.Add('        F.RDB$FIELD_PRECISION AS PRECISAO_CAMPO,');
  Query.SQL.Add('        F.RDB$FIELD_SCALE AS ESCALA_CAMPO,');
  Query.SQL.Add('        CASE F.RDB$FIELD_TYPE');
  Query.SQL.Add('          WHEN 7   THEN ''SMALLINT''');
  Query.SQL.Add('          WHEN 8   THEN ''INTEGER''');
  Query.SQL.Add('          WHEN 9   THEN ''QUAD''');
  Query.SQL.Add('          WHEN 10  THEN ''FLOAT''');
  Query.SQL.Add('          WHEN 11  THEN ''D_FLOAT''');
  Query.SQL.Add('          WHEN 12  THEN ''DATE''');
  Query.SQL.Add('          WHEN 13  THEN ''TIME''');
  Query.SQL.Add('          WHEN 14  THEN ''CHAR''');
  Query.SQL.Add('          WHEN 16  THEN ''NUMERIC''');
  Query.SQL.Add('          WHEN 27  THEN ''DOUBLE''');
  Query.SQL.Add('          WHEN 35  THEN ''TIMESTAMP''');
  Query.SQL.Add('          WHEN 37  THEN ''VARCHAR''');
  Query.SQL.Add('          WHEN 40  THEN ''CSTRING''');
  Query.SQL.Add('          WHEN 261 THEN ''BLOB''');
  Query.SQL.Add('          ELSE ''UNKNOWN''');
  Query.SQL.Add('        END AS TIPO_CAMPO,');
  Query.SQL.Add('        F.RDB$FIELD_SUB_TYPE AS SUBTIPO_CAMPO,');
  Query.SQL.Add('        CSET.RDB$CHARACTER_SET_NAME AS CHARSET_CAMPO');
  Query.SQL.Add('   FROM RDB$RELATION_FIELDS R');
  Query.SQL.Add('   LEFT JOIN RDB$FIELDS F ON R.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME');
  Query.SQL.Add('   LEFT JOIN RDB$COLLATIONS COLL ON F.RDB$COLLATION_ID = COLL.RDB$COLLATION_ID');
  Query.SQL.Add('   LEFT JOIN RDB$CHARACTER_SETS CSET ON F.RDB$CHARACTER_SET_ID = CSET.RDB$CHARACTER_SET_ID');
  Query.SQL.Add('  WHERE R.RDB$RELATION_NAME = ''' + Nome + '''');
  Query.SQL.Add(' ORDER BY R.RDB$FIELD_POSITION)');

  Query.Open;
  Query.First;

  while not Query.Eof do
  begin
    xAchou := False;

    for I := 0 to Pred(Campos.Count) do
    begin
      if Trim(Query.FieldByName('NOME_CAMPO').AsString) = Campos.Campo[I].Nome then
      begin
        if (Query.FieldByName('TIPO_CAMPO').AsString <> Campos.Campo[I].Tipo) then
        begin
          if Estado = tbCreate then
             AlterField(Campos.Campo[I])
          else
          begin
            if Pergunta('Existe alterações pendentes no banco de dados.' +
                 sLineBreak + 'Deseja executar a atualização?',
                 MB_DEFBUTTON2) then
            begin
              wBanco.AtualizaDB;
              Mensagem(StringReplace(wBanco.LOG.Text, '=', '', [rfReplaceAll]),
                MB_ICONINFORMATION);
            end;

            Result := False;
            Exit;
          end;
        end;
        xAchou := True;
        Break;
      end;
    end;

    if not xAchou then
    begin
      if Estado = tbCreate then
         DropField(Query.FieldByName('NOME_CAMPO').AsString)
      else
      begin
        if Pergunta('Existe alterações pendentes no banco de dados.' +
             sLineBreak + 'Deseja executar a atualização?',
             MB_DEFBUTTON2) then
        begin
          wBanco.AtualizaDB;
          Mensagem(StringReplace(wBanco.LOG.Text, '=', '', [rfReplaceAll]),
            MB_ICONINFORMATION);
        end;

        Result := False;
        Exit;
      end;
    end;

    Query.Next;
  end;

  Query.Close;
  Query.Open;

  for I := 0 to Pred(Campos.Count) do
  begin
    xAchou := False;

    Query.First;
    while not Query.Eof do
    begin
      if Trim(Query.FieldByName('NOME_CAMPO').AsString) = Campos.Campo[I].Nome then
      begin
        xAchou := True;
        Break;
      end;

      Query.Next;
    end;

    if not xAchou then
    begin
      if Estado = tbCreate then
         AddField(Campos.Campo[I])
      else
      begin
        if Pergunta('Existe alterações pendentes no banco de dados.' +
             sLineBreak + 'Deseja executar a atualização?',
             MB_DEFBUTTON2) then
        begin
          wBanco.AtualizaDB;
          Mensagem(StringReplace(wBanco.LOG.Text, '=', '', [rfReplaceAll]),
            MB_ICONINFORMATION);
        end;

        Result := False;
        Exit;
      end;
    end;
  end;
end;

procedure TTabela.Atualizar;
var
  xTitulo: String;
begin
  xTitulo := AddChar(' Tabela: ' + Nome, '=', 50, pRigth);
  FLOG.Clear;
  FLOG.Add(xTitulo);

  CheckFields;

  if Trim(FLOG.Text) = xTitulo then
     FLOG.Clear;
end;

{ TBanco }

function TBanco.CheckDependencies(ATabela: TTabela): Boolean;
begin
  Query.SQL.Clear;
  Query.SQL.Add('SELECT DISTINCT TRIM(d2.RDB$DEPENDED_ON_NAME) AS TABELA');

//  NÃO REMOVI ESSA PARTE POR CONTER DADOS INTERESSANTES
//  Query.SQL.Add(' , rc.RDB$CONSTRAINT_NAME AS constraint_name');
//  Query.SQL.Add(' , rc.RDB$RELATION_NAME AS on_table');
//  Query.SQL.Add(' , d1.RDB$FIELD_NAME AS on_field');
//  Query.SQL.Add(' , d2.RDB$DEPENDED_ON_NAME AS references_table');
//  Query.SQL.Add(' , d2.RDB$FIELD_NAME AS references_field');
//  Query.SQL.Add(' , refc.RDB$UPDATE_RULE AS on_update');
//  Query.SQL.Add(' , refc.RDB$DELETE_RULE AS on_delete');

  Query.SQL.Add('FROM RDB$RELATION_CONSTRAINTS rc');
  Query.SQL.Add('  LEFT JOIN RDB$REF_CONSTRAINTS refc ON rc.RDB$CONSTRAINT_NAME = refc.RDB$CONSTRAINT_NAME');
  Query.SQL.Add('  LEFT JOIN RDB$DEPENDENCIES d1 ON d1.RDB$DEPENDED_ON_NAME = rc.RDB$RELATION_NAME');
  Query.SQL.Add('  LEFT JOIN RDB$DEPENDENCIES d2 ON d1.RDB$DEPENDENT_NAME = d2.RDB$DEPENDENT_NAME');

  Query.SQL.Add('WHERE d1.RDB$DEPENDED_ON_NAME <> d2.RDB$DEPENDED_ON_NAME');
  Query.SQL.Add('  AND rc.RDB$RELATION_NAME = :pTABELA');
  Query.SQL.Add('  AND TRIM(rc.RDB$CONSTRAINT_NAME) LIKE ''%''||:pTABELA');
  Query.SQL.Add('  AND d1.RDB$FIELD_NAME IS NOT NULL');

  Query.ParamByName('pTABELA').AsString := ATabela.Nome;
  Query.Open;
end;

procedure TBanco.AddTable(ATabela: TTabela);
begin
  if ATabela.Campos.Count > 0 then
     inherited Add(ATabela);
end;

procedure TBanco.AtualizaDB;
var
  I: Integer;
begin
  FLOG.Clear;

  CheckTables;

  for I := 0 to Pred(Count) do
  begin
    Items[I].FEstado := tbCreate;
    Items[I].Atualizar;
    Items[I].FEstado := tbSearch;
    FLOG.Add(Items[I].LOG.Text);
  end;
end;

procedure TBanco.CheckTables;
var
  I, Z  : Integer;
  xAchou: Boolean;
begin
  for I := 0 to Pred(Tabelas.Count) do
  begin
    xAchou := False;

    for Z := 0 to Pred(Count) do
    begin
      if Items[Z].Nome = Tabelas[I] then
      begin
        xAchou := True;

        Items[Z].CheckChaveP;
        Items[Z].CheckChaveE;

        FLOG.Add(Items[Z].LOG.Text);
        Break;
      end;
    end;

    if not xAchou then
       if DropTable(Tabelas[I]) then
          Tabelas.Delete(I);
  end;

  for Z := 0 to Pred(Count) do
  begin
    xAchou := False;

    for I := 0 to Pred(Tabelas.Count) do
    begin
      if Tabelas[I] = Items[Z].Nome then
         begin
           xAchou := True;
           Break;
         end;
    end;

    if not xAchou then
       CreateTable(Items[Z]);
  end;
end;

constructor TBanco.Create;
begin
  FLOG     := TStringList.Create;
  FTabelas := TStringList.Create;
  FQuery   := TSQLQuery.Create(Nil);

  FQuery.SQLConnection := WSQLConnection;

  Tabelas.Clear;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT TRIM(RDB$RELATION_NAME) AS TABELA');
  Query.SQL.Add('FROM RDB$RELATIONS');
  Query.SQL.Add('WHERE NOT RDB$RELATION_NAME LIKE ''MON%''');
  Query.SQL.Add('  AND NOT RDB$RELATION_NAME LIKE ''RDB%''');
  Query.Open;

  Query.First;

  while not Query.Eof do
  begin
    Tabelas.Add(Query.FieldByName('TABELA').AsString);
    Query.Next;
  end;
end;

destructor TBanco.Destroy;
begin
  FreeAndNil(FLOG);
  FreeAndNil(FQuery);
end;

function TBanco.CreateTable(ATabela: TTabela): Boolean;
var
  I   : Integer;
  xKey: String;
begin
  Result := False;

  FLOG.Add(AddChar(' Tabela: ' + ATabela.Nome, '=', 50, pRigth));

  ATabela.Query.Close;
  ATabela.Query.SQL.Clear;
  ATabela.Query.SQL.Add('CREATE TABLE ' + ATabela.Nome + '(');

  for I := 0 to Pred(ATabela.Campos.Count) do
  begin
    ATabela.Query.SQL.Add('  ' + ATabela.Campos.Campo[I].Nome + ' '
                  + ATabela.Campos.Campo[I].Tipo + ',');
  end;

  xKey := ATabela.ChaveP[0];

  for I := 1 to Pred(ATabela.ChaveP.Count) do
    xKey := xKey + ',' + ATabela.ChaveP[I];

  xKey := 'CONSTRAINT PK_' + ATabela.Nome + ' PRIMARY KEY (' + xKey + ')';

  if ATabela.ChaveE.Count = 0 then
     ATabela.Query.SQL.Add('  ' + xKey)
  else
  begin
    ATabela.Query.SQL.Add('  ' + xKey + ',');

    for I := 0 to Pred(ATabela.ChaveE.Count) do
    begin
      if (ATabela.ChaveE.Count = 1)
         or (I = Pred(ATabela.ChaveE.Count)) then
        ATabela.Query.SQL.Add('  CONSTRAINT FK_' + ATabela.ChaveE.Items[I].Nome +
                              ' FOREIGN KEY (' + ATabela.ChaveE.Items[I].Contador + ') ' +
                              'REFERENCES ' + ATabela.ChaveE.Items[I].Nome +
                              '(' + ATabela.ChaveE.Items[I].Contador + ')' +
                              'ON DELETE CASCADE ON UPDATE CASCADE')
      else
        ATabela.Query.SQL.Add('  CONSTRAINT FK_' + ATabela.ChaveE.Items[I].Nome +
                              ' FOREIGN KEY (' + ATabela.ChaveE.Items[I].Contador + ') ' +
                              'REFERENCES ' + ATabela.ChaveE.Items[I].Nome +
                              '(' + ATabela.ChaveE.Items[I].Contador + ')' +
                              'ON DELETE CASCADE ON UPDATE CASCADE,')
    end;
  end;

  ATabela.Query.SQL.Add(');');

  WTransactionDesc.TransactionID  := 1;
  WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
  WSQLConnection.StartTransaction(WTransactionDesc);

  try
    WSQLConnection.ExecuteDirect(ATabela.Query.SQL.Text);

    ATabela.Query.Close;
    ATabela.Query.SQL.Clear;
    ATabela.Query.SQL.Add('CREATE GENERATOR GEN_' + ATabela.Nome + '_ID;');

    WSQLConnection.ExecuteDirect(ATabela.Query.SQL.Text);

    ATabela.Query.Close;
    ATabela.Query.SQL.Clear;
    ATabela.Query.SQL.Add('CREATE TRIGGER ' + ATabela.Nome + '_BI FOR ' + ATabela.Nome);
    ATabela.Query.SQL.Add('ACTIVE BEFORE INSERT POSITION 0');
    ATabela.Query.SQL.Add('AS');
    ATabela.Query.SQL.Add('BEGIN');
    ATabela.Query.SQL.Add('  IF (NEW.' + ATabela.Contador + ' IS NULL) THEN');
    ATabela.Query.SQL.Add('    NEW.' + ATabela.Contador + ' = GEN_ID(GEN_' + ATabela.Nome + '_ID,1);');
    ATabela.Query.SQL.Add('END');

    WSQLConnection.ExecuteDirect(ATabela.Query.SQL.Text);

    WSQLConnection.Commit(WTransactionDesc);
    FLOG.Add('Tabela ' + ATabela.Nome + ' criada com sucesso!');

    Result := True;
  except
    on E: Exception do
    begin
      WSQLConnection.Rollback(WTransactionDesc);

      FLOG.Add('Erro ao criar a tabela ' + ATabela.Nome +
               '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
    end;
  end;
end;

function TBanco.DropTable(ATabela: String): Boolean;
begin
  Result := False;

  ATabela := Trim(ATabela);
  FLOG.Add(AddChar(' Tabela: ' + ATabela, '=', 50, pRigth));

  WTransactionDesc.TransactionID  := 1;
  WTransactionDesc.IsolationLevel := xilREADCOMMITTED;
  WSQLConnection.StartTransaction(WTransactionDesc);

  try
    WSQLConnection.ExecuteDirect('DROP TRIGGER ' + ATabela + '_BI');
    WSQLConnection.ExecuteDirect('DROP GENERATOR GEN_' + ATabela + '_ID');
    WSQLConnection.ExecuteDirect('DROP TABLE ' + ATabela);
    WSQLConnection.Commit(WTransactionDesc);
    FLOG.Add('Tabela ' + ATabela + ' removida com sucesso!');

    Result := True;
  except
    on E: Exception do
    begin
      WSQLConnection.Rollback(WTransactionDesc);

      FLOG.Add('Erro ao remover a tabela ' + ATabela +
               '. ' + E.ClassName + ': ' + '(' + E.Message + ')');
    end;
  end;
end;

function TBanco.Get(Index: Integer): TTabela;
begin
  Result := inherited Get(Index);
end;

procedure TBanco.Put(Index: Integer; const Value: TTabela);
begin
  inherited Put(Index, Value);
end;

procedure TBanco.SetQuery(const Value: TSQLQuery);
begin
  FQuery := Value;
end;

procedure TBanco.SetTabelas(const Value: TStrings);
begin
  FTabelas := Value;
end;

end.
