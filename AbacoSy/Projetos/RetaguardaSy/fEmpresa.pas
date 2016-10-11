unit fEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormEmpresa = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEmpresa: TFormEmpresa;

implementation

uses
  uEmpresaDB;

var
  vEmpresa: TEmpresa;

{$R *.dfm}

procedure TFormEmpresa.BitBtn1Click(Sender: TObject);
begin
  vEmpresa := TEmpresa.Create;

  vEmpresa.Campos.Campo[0].Valor := StrToIntDef(Edit1.Text,0);
  vEmpresa.Campos.Campo[1].Valor := Edit2.Text;
  vEmpresa.Campos.Campo[2].Valor := 0.4;

  vEmpresa.Grava;

  Memo1.Lines.Text := vEmpresa.SQL.Text;

  FreeAndNil(vEmpresa);
end;

procedure TFormEmpresa.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
end;

end.
