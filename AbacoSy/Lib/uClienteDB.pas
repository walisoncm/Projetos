unit uClienteDB;

interface

uses
  SqlExpr, uComunicaDB, uEmpresaDB;

type
  TCliente = class(TTabela)
  public
    constructor Create(ASQLConnection: TSQLConnection);
  end;

implementation

{ TCliente }

constructor TCliente.Create(ASQLConnection: TSQLConnection);
var
  I: Integer;
begin
  Inherited Create(ASQLConnection);
  Nome     := 'CLIENTE';
  Contador := 'CODCLIENTE';

  ChaveP.Clear;
  ChaveP.Add('CODEMPRESA');
  ChaveP.Add('CODCLIENTE');

  ChaveE.Clear;
  ChaveE.Add(TEmpresa.Create(ASQLConnection));

  I := 0;
  Campos.AddCampo;
  Campos.Campo[I].Nome    := 'CODEMPRESA';
  Campos.Campo[I].Tipo    := 'INTEGER NOT NULL';

  Inc(I);
  Campos.AddCampo;
  Campos.Campo[I].Nome    := 'CODCLIENTE';
  Campos.Campo[I].Tipo    := 'INTEGER NOT NULL';

  //PROCESSAR ALTERAÇÕES EM CHAVE PRIMÁRIA E EM CHAVE ESTRANGEIRA
end;

end.
