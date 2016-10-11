unit uConcurso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, IBDatabase, Data.DB, Vcl.Menus, Tlhelp32,
  Vcl.Imaging.pngimage;

type
  TfConcurso = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    Form : TForm;
    { Public declarations }
  end;

var
  fConcurso: TfConcurso;

implementation

{$R *.dfm}

uses uMenu, uResultado, uAnalise, uDadosConcurso, uAnResult;

procedure TfConcurso.BitBtn1Click(Sender: TObject);
begin
  fConcurso.Enabled := False;
  fDadosConcurso.Form := fConcurso;
  fDadosConcurso.Show;
end;

procedure TfConcurso.BitBtn2Click(Sender: TObject);
begin
  fConcurso.Enabled := False;
  fResultado.Form := fConcurso;
  fResultado.Show;
end;

procedure TfConcurso.BitBtn3Click(Sender: TObject);
begin
  fConcurso.Enabled := False;
  fAnalise.Form := fConcurso;
  fAnalise.Show;
end;

procedure TfConcurso.BitBtn4Click(Sender: TObject);
begin
  fConcurso.Enabled := False;
  fAnResult.Form := fConcurso;
  fAnResult.Show;
end;

procedure TfConcurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form.Enabled := True;
end;

procedure TfConcurso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift=[]) and (Key = VK_ESCAPE) then
     fConcurso.Close;
end;

end.

