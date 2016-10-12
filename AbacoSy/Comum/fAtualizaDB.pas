unit fAtualizaDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormAtualizaDB = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    btnAtualizar: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAtualizaDB: TFormAtualizaDB;

implementation

uses
  uComunicaDB;

{$R *.dfm}

procedure TFormAtualizaDB.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormAtualizaDB.btnAtualizarClick(Sender: TObject);
var
  I: Integer;
begin
  wBanco.AtualizaDB;

  Memo1.Lines.Clear;

  Memo1.Lines.Add(Trim(wBanco.LOG.Text));

  Memo1.Lines.Add(sLineBreak + 'ATUALIZAÇÃO CONCLUÍDA!');
end;

procedure TFormAtualizaDB.FormCreate(Sender: TObject);
begin
  ShowModal;
end;

procedure TFormAtualizaDB.FormShow(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
