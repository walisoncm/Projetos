unit uComunicaDB;

interface

uses
  uDB;

type
  TTabelas = class(uDB.TTabelas)
  private
    function CreateTable : Boolean;
    function TabelaExiste: Boolean;
  public
    function Grava: Boolean;
  end;

implementation

uses Classes, SysUtils;

function GetType(ACampo: TCampo): String;
begin
  case TVarData(ACampo.Valor).VType of
    varEmpty   : ;
    varNull    : ;
    varSmallint: Result := ' INTEGER';
    varInteger : Result := ' INTEGER';
    varSingle  : ;
    varDouble  : Result := ' NUMERIC';
    varCurrency: Result := ' NUMERIC';
    varDate    : Result := ' TIMESTAMP';
    varOleStr  : Result := ' VARCHAR';
    varDispatch: ;
    varError   : ;
    varBoolean : Result := ' CHAR(1)';
    varVariant : ;
    varUnknown : ;
    varByte    : ;
    varString  : Result := ' VARCHAR';
    varTypeMask: ;
    varArray   : ;
    varByRef   : ;
    varUString : Result := ' VARCHAR';
  end;

  if (Result = ' CHAR') or (Result = ' VARCHAR') then
     Result := Result + '(' + IntToStr(ACampo.Tamanho)       + ')'
  else if Result = ' NUMERIC' then
     Result := Result + '(' + IntToStr(ACampo.Tamanho)       + ','
                            + IntToStr(ACampo.CasasDecimais) + ')';

  if ACampo.NotNull then
     Result := Result + ' NOT NULL';
end;

{ TTabelas }

function TTabelas.CreateTable: Boolean;
var
  I: Integer;
begin
  if TabelaExiste then
     Exit;

  SQL.Clear;
  SQL.Add('CREATE TABLE ' + Nome + '(');

  for I := 0 to Campos.Count -1 do
  begin
    SQL.Add('  ' + Campos.Campo[I].Nome + GetType(Campos.Campo[I]) + ',');
  end;

  if Trim(ChaveE.Text) = '' then
     SQL.Add('  ' + ChaveP)
  else
     begin
       SQL.Add('  ' + ChaveP + ',');
       SQL.Add(ChaveE.Text);
     end;

  SQL.Add(');');
end;

function TTabelas.Grava: Boolean;
begin
  if FEstado in [tbInsert, tbSearch] then
     CreateTable;
end;

function TTabelas.TabelaExiste: Boolean;
begin
  SQL.Clear;
  SQL.Add('SELECT 1 FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = ' + Nome);

  Result := False;
end;

end.
