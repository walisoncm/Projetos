unit uDB;

interface

uses
  Classes, SysUtils;

type
  TCampo = class(TCollectionItem)
  private
    FNome         : String;
    FValor        : Variant;
    FTamanho      : Integer;
    FCasasDecimais: Integer;
    FNotNull      : Boolean;
  published
    property Nome         : String  read FNome           write FNome;
    property Valor        : Variant read FValor          write FValor;
    property Tamanho      : Integer read FTamanho        write FTamanho;
    property CasasDecimais: Integer read FCasasDecimais  write FCasasDecimais;
    property NotNull      : Boolean read FNotNull        write FNotNull;
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
  end;

  TTexto = class
  private
    FText: String;
  published
    property Text: String read FText write FText;
  public
    procedure Add(AString: String);
    procedure Clear;
  end;

  TEstado = (tbInsert, tbEdit, tbSearch);

  TTabelas = class
    FEstado: TEstado;
    FNome  : String;
    FChaveP: String;
    FChaveE: TTexto;
    property Nome   : String  read FNome   write FNome;
    property ChaveP : String  read FChaveP write FChaveP;
    property ChaveE : TTexto  read FChaveE write FChaveE;
  private
    FCampos: TCampos;
    FSQL   : TTexto;
  published
    property Campos: TCampos read FCampos write FCampos;
    property SQL   : TTexto  read FSQL    write FSQL;
  public
    constructor Create;
    destructor Destroy;
  end;

implementation

{ TCampo }

constructor TCampo.Create;
begin
  FNome          := '';
  FValor         := 0;
  FTamanho       := 0;
  FCasasDecimais := 0;
  FNotNull       := False;
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

{ TTabelas }

constructor TTabelas.Create;
begin
  FCampos := TCampos.Create(TCampo);
  FSQL    := TTexto.Create;
  FChaveE := TTexto.Create;
  FEstado := tbSearch;
end;

destructor TTabelas.Destroy;
begin
  FreeAndNil(FCampos);
  FreeAndNil(FSQL);
  FreeAndNil(FChaveE);
end;

{ TTexto }

procedure TTexto.Add(AString: String);
begin
  FText := FText + #13 + AString;
end;

procedure TTexto.Clear;
begin
  FText := '';
end;

end.
