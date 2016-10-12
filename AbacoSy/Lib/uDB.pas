unit uDB;

interface

uses
  Classes, SysUtils, SqlExpr;

type
  TCampo = class(TCollectionItem)
  private
    FNome      : String;
    FTipo      : String;
    FValue     : Variant;
    FAsString  : String;
    FAsInteger : Integer;
    FAsDateTime: TDateTime;
    FAsDate    : TDate;
    function GetAsDate: TDate;
    function GetAsDateTime: TDateTime;
    function GetAsInteger: Integer;
    function GetAsString: String;
    function GetAsVariant: Variant;
    procedure SetAsDate(const Value: TDate);
    procedure SetAsDateTime(const Value: TDateTime);
    procedure SetAsInteger(const Value: Integer);
    procedure SetAsString(const Value: String);
    procedure SetAsVariant(const Value: Variant);
  published
    property Nome         : String    read FNome           write FNome;
    property Tipo         : string    read FTipo           write FTipo;
    property AsVariant    : Variant   read GetAsVariant    write SetAsVariant;
    property AsString     : String    read GetAsString     write SetAsString;
    property AsInteger    : Integer   read GetAsInteger    write SetAsInteger;
    property AsDateTime   : TDateTime read GetAsDateTime   write SetAsDateTime;
    property AsDate       : TDate     read GetAsDate       write SetAsDate;
  public
    constructor Create;
  end;

  TCampos = class(TCollection)
  private
    function GetCampo(Index: Integer): TCampo;
  public
    property Campo[Index: Integer]: TCampo read GetCampo;
    constructor Create(ItemClass: TCollectionItemClass);
    function AddCampo: TCampo;
    function Obj(ACampo: String): TCampo;
  end;

  TEstado = (tbInsert, tbEdit, tbSearch, tbCreate);

  TTabela = class;

  TMyList = class(TList)
  private
    function Get(Index: Integer): TTabela;
    procedure Put(Index: Integer; const Value: TTabela);
  public
    property Items[Index: Integer]: TTabela read Get write Put; default;
  end;

  TTabela = class
    FNome    : String;
    FChaveP  : TStrings;
    FChaveE  : TMyList;
    FCampos  : TCampos;
    FQuery   : TSQLQuery;
    FContador: String;
    FEstado  : TEstado;
    FLOG     : TStrings;
  private
    function GetLOG: TStrings;
    function GetQuery: TSQLQuery;
    procedure SetQuery(const Value: TSQLQuery);
    function GetChaveP: TStrings;
    procedure SetChaveP(const Value: TStrings);
  published
    property Nome    : String    read FNome     write FNome;
    property ChaveP  : TStrings  read GetChaveP write SetChaveP;
    property ChaveE  : TMyList   read FChaveE   write FChaveE;
    property Campos  : TCampos   read FCampos   write FCampos;
    property Query   : TSQLQuery read GetQuery  write SetQuery;
    property Contador: String    read FContador write FContador;
    property Estado  : TEstado   read FEstado   write FEstado;
    property LOG     : TStrings  read GetLOG;
  public
    constructor Create(ASQLConnection: TSQLConnection);
    destructor Destroy;
  end;

implementation

{ TCampo }

constructor TCampo.Create;
begin
  FNome       := '';
  FTipo       := '';
  FValue      := -1;
  FAsString   := '';
  FAsInteger  := -1;
  FAsDateTime := -1;
  FAsDate     := -1;
end;

function TCampo.GetAsDate: TDate;
begin
  Result := FValue;
end;

function TCampo.GetAsDateTime: TDateTime;
begin
  Result := FValue;
end;

function TCampo.GetAsInteger: Integer;
begin
  Result := FValue;
end;

function TCampo.GetAsString: String;
begin
  Result := FValue;
end;

function TCampo.GetAsVariant: Variant;
begin
  Result := FValue;
end;

procedure TCampo.SetAsDate(const Value: TDate);
begin
  FValue := Value;
end;

procedure TCampo.SetAsDateTime(const Value: TDateTime);
begin
  FValue := Value;
end;

procedure TCampo.SetAsInteger(const Value: Integer);
begin
  FValue := Value;
end;

procedure TCampo.SetAsString(const Value: String);
begin
  FValue := Value;
end;

procedure TCampo.SetAsVariant(const Value: Variant);
begin
  FValue := Value;
end;

{ TCampos }

function TCampos.AddCampo: TCampo;
begin
  Result := Add as TCampo;
end;

constructor TCampos.Create(ItemClass: TCollectionItemClass);
begin
  Inherited Create(ItemClass);
end;

function TCampos.GetCampo(Index: Integer): TCampo;
begin
  Result := Items[Index] as TCampo;
end;

function TCampos.Obj(ACampo: String): TCampo;
var
  I: Integer;
begin
  for I := 0 to Count-1 do
    if Campo[I].Nome = ACampo then
       Result := Campo[I];
end;

{ TTabelas }

constructor TTabela.Create(ASQLConnection: TSQLConnection);
begin
  FContador := '';
  FCampos   := TCampos.Create(TCampo);
  FChaveP   := TStringList.Create;
  FChaveE   := TMyList.Create;
  FLOG      := TStringList.Create;
  FEstado   := tbSearch;
  FQuery    := TSQLQuery.Create(nil);

  FQuery.SQLConnection := ASQLConnection;
end;

destructor TTabela.Destroy;
begin
  FreeAndNil(FCampos);
  FreeAndNil(FQuery);
  FreeAndNil(FChaveP);
  FreeAndNil(FChaveE);
  FreeAndNil(FLOG);
end;

function TTabela.GetChaveP: TStrings;
begin
  Result := FChaveP;
end;

function TTabela.GetLOG: TStrings;
begin
  Result := FLOG;
end;

function TTabela.GetQuery: TSQLQuery;
begin
  Result := FQuery;
end;

procedure TTabela.SetChaveP(const Value: TStrings);
begin
  FChaveP.Assign(Value);
end;

procedure TTabela.SetQuery(const Value: TSQLQuery);
begin
  FQuery.Assign(Value);
end;

{ TMyList }

function TMyList.Get(Index: Integer): TTabela;
begin
  Result := inherited Get(Index);
end;

procedure TMyList.Put(Index: Integer; const Value: TTabela);
begin
  inherited Put(Index, Value);
end;

end.
