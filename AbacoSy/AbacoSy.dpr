program AbacoSy;

uses
  Vcl.Forms,
  uDB in 'Lib\uDB.pas',
  uEmpresaDB in 'Lib\uEmpresaDB.pas',
  fEmpresa in 'RetaguardaSy\fEmpresa.pas' {FormEmpresa},
  uComunicaDB in 'Lib\uComunicaDB.pas',
  fAtualizaDB in 'Comum\fAtualizaDB.pas' {FormAtualizaDB},
  fMenu in 'RetaguardaSy\fMenu.pas' {FormMenu},
  Vcl.Themes,
  Vcl.Styles,
  uClienteDB in 'Lib\uClienteDB.pas',
  fCliente in 'RetaguardaSy\fCliente.pas' {FormCliente},
  uFuncoes in 'Lib\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskBar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TFormMenu, FormMenu);
  Application.Run;
end.
