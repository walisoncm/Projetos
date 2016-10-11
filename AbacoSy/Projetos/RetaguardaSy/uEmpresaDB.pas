unit uEmpresaDB;

interface

uses
  uComunicaDB;

type
  TEmpresa = class(TTabelas)
  private
  published
  public
    constructor Create;
  end;

implementation

{ TEmpresa }

constructor TEmpresa.Create;
begin
  Inherited Create;
  Nome   := 'EMPRESA';
  ChaveP := 'PRIMARY KEY CONSTRAINT PK_EMPRESA (CODEMPRESA)';

  Campos.AddCampo;
  Campos.Campo[0].Nome          := 'CODEMPRESA';
  Campos.Campo[0].NotNull       := True;

  Campos.AddCampo;
  Campos.Campo[1].Nome          := 'NOME';
  Campos.Campo[1].Tamanho       := 60;

  Campos.AddCampo;
  Campos.Campo[2].Nome          := 'VALOR';
  Campos.Campo[2].Tamanho       := 14;
  Campos.Campo[2].CasasDecimais := 4;

//  ChaveE.Clear;
//  ChaveE.Add('  ');
end;

end.
