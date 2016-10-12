unit uEmpresaDB;

interface

uses
  SqlExpr, uComunicaDB;

type
  TEmpresa = class(TTabela)
  public
    constructor Create(ASQLConnection: TSQLConnection);
  end;

implementation

{ TEmpresa }

constructor TEmpresa.Create(ASQLConnection: TSQLConnection);
var
  I: Integer;
begin
  Inherited Create(ASQLConnection);
  Nome     := 'EMPRESA';
  Contador := 'CODEMPRESA';

  ChaveP.Clear;
  ChaveP.Add('CODEMPRESA');

  I := 0;
  Campos.AddCampo;
  Campos.Campo[I].Nome    := 'CODEMPRESA';
  Campos.Campo[I].Tipo    := 'INTEGER NOT NULL';

  Inc(I);
  Campos.AddCampo;
  Campos.Campo[I].Nome    := 'RAZAOSOCIAL';
  Campos.Campo[I].Tipo    := 'VARCHAR(60)';

  Inc(I);
  Campos.AddCampo;
  Campos.Campo[I].Nome    := 'NOMEFANTASIA';
  Campos.Campo[I].Tipo    := 'VARCHAR(50)';

  Inc(I);
  Campos.AddCampo;
  Campos.Campo[I].Nome    := 'CGC';
  Campos.Campo[I].Tipo    := 'VARCHAR(15)';

  Inc(I);
  Campos.AddCampo;
  Campos.Campo[I].Nome    := 'INSCESTADUAL';
  Campos.Campo[I].Tipo    := 'VARCHAR(15)';

  Inc(I);
  Campos.AddCampo;
  Campos.Campo[I].Nome    := 'ENDERECO';
  Campos.Campo[I].Tipo    := 'VARCHAR(80)';
end;

end.
