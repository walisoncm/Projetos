program AbacoSy;

uses
  Vcl.Forms,
  fClientes in 'RetaguardaSy\fClientes.pas' {FormClientes},
  uDB in 'Comum\uDB.pas',
  uClientesDB in 'RetaguardaSy\uClientesDB.pas',
  uComunicaDB in 'Comum\uComunicaDB.pas',
  uEmpresaDB in 'RetaguardaSy\uEmpresaDB.pas',
  fEmpresa in 'RetaguardaSy\fEmpresa.pas' {FormEmpresa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEmpresa, FormEmpresa);
  Application.Run;
end.
