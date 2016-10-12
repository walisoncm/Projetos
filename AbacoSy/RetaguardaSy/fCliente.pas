unit fCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uClienteDB, uComunicaDB;

type
  TFormCliente = class(TForm)
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCliente = class(uClienteDB.TCliente);

var
  FormCliente: TFormCliente;

implementation

{$R *.dfm}

procedure TFormCliente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FreeAndNil(Self);
end;

end.
