unit fMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Vcl.ComCtrls, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Vcl.ToolWin;

type
  TFormMenu = class(TForm)
    MainMenu1: TMainMenu;
    Utilitrios1: TMenuItem;
    AtualizaBancodeDados1: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    CadastrodeClientes1: TMenuItem;
    Empresa1: TMenuItem;
    CadastrodeEmpresa1: TMenuItem;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    procedure AtualizaBancodeDados1Click(Sender: TObject);
    procedure CadastrodeEmpresa1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CadastrodeClientes1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.dfm}

uses
  uComunicaDB, uFuncoes, fAtualizaDB, fEmpresa, fCliente, UITypes;

procedure TFormMenu.AtualizaBancodeDados1Click(Sender: TObject);
begin
  Application.CreateForm(TFormAtualizaDB, FormAtualizaDB);
  FreeAndNil(FormAtualizaDB);
end;

procedure TFormMenu.CadastrodeClientes1Click(Sender: TObject);
begin
  Application.CreateForm(TFormCliente, FormEmpresa);
  FormEmpresa.Show;
end;

procedure TFormMenu.CadastrodeEmpresa1Click(Sender: TObject);
begin
  Application.CreateForm(TFormEmpresa, FormEmpresa);
  FormEmpresa.Show;
end;

procedure TFormMenu.FormCreate(Sender: TObject);
begin
  if Conectado then
  begin
    WBanco := TBanco.Create;
    WBanco.AddTable(TEmpresa.Create(WSQLConnection));
    WBanco.AddTable(TCliente.Create(WSQLConnection));
  end
  else
  begin
    Mensagem('Falha na conexão com o banco!', MB_ICONERROR);
    Application.Terminate;
  end;
end;

procedure TFormMenu.FormDestroy(Sender: TObject);
begin
  FreeAndNil(wBanco);
end;

procedure TFormMenu.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate('web.skype.com/pt-br/');
end;

end.
