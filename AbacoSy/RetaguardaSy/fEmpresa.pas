unit fEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uDB, uComunicaDB, uEmpresaDB, uFuncoes;

type
  TEstado = (esInsAlt, esDefault);

  TFormEmpresa = class(TForm)
    edtCodEmpresa: TEdit;
    edtNomeEmpresa: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    procedure LimpaCampos;
    procedure Estado(AEstado: TEstado);
    { Private declarations }
  public
    { Public declarations }
  end;

  TEmpresa = class(uEmpresaDB.TEmpresa);

var
  FormEmpresa: TFormEmpresa;

implementation

var
  vEmpresa: TEmpresa;

{$R *.dfm}

procedure TFormEmpresa.LimpaCampos;
begin
  edtCodEmpresa.Clear;
  edtNomeEmpresa.Clear;
end;

procedure TFormEmpresa.Estado(AEstado: TEstado);
var
  xBln: Boolean;
begin
  case AEstado of
    esInsAlt : xBln := False;
    esDefault: xBln := True;
  end;

  btnNovo.Enabled        := xBln;
  btnAlterar.Enabled     := xBln;
  btnSalvar.Enabled      := not xBln;
  edtCodEmpresa.Enabled  := not xBln;
  edtNomeEmpresa.Enabled := not xBln;
end;

procedure TFormEmpresa.btnAlterarClick(Sender: TObject);
begin
  Estado(esInsAlt);
  edtNomeEmpresa.SetFocus;
  vEmpresa.Estado := tbEdit;
end;

procedure TFormEmpresa.btnNovoClick(Sender: TObject);
begin
  Estado(esInsAlt);
  edtNomeEmpresa.SetFocus;
  vEmpresa.Estado := tbInsert;
end;

procedure TFormEmpresa.btnSalvarClick(Sender: TObject);
begin
  vEmpresa.Campos.Obj('RAZAOSOCIAL').AsString := edtNomeEmpresa.Text;

  if vEmpresa.Salvar then
  begin
    Mensagem(StringReplace(vEmpresa.LOG.Text, '=', '', [rfReplaceAll]),
      MB_ICONINFORMATION);

    LimpaCampos;
    Estado(esDefault);
  end
  else if vEmpresa.LOG.Text <> '' then
    Mensagem(StringReplace(vEmpresa.LOG.Text, '=', '', [rfReplaceAll]),
      MB_ICONWARNING);
end;

procedure TFormEmpresa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FreeAndNil(Self);
end;

procedure TFormEmpresa.FormCreate(Sender: TObject);
begin
  vEmpresa := TEmpresa.Create(WSQLConnection);
  LimpaCampos;
end;

procedure TFormEmpresa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(vEmpresa);
end;

procedure TFormEmpresa.FormShow(Sender: TObject);
begin
  Estado(esDefault);
end;

end.
