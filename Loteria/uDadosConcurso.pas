unit uDadosConcurso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  IBCustomDataSet, IBQuery, IBDatabase, Vcl.Grids, Vcl.DBGrids, IBSQL, frxClass,
  frxDBSet, Vcl.Buttons, frxPreview, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppDesignLayer, ppParameter, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Mask, Vcl.DBCtrls;

type
  TfDadosConcurso = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Radio1: TRadioGroup;
    Edit1: TEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DBMemo2: TDBMemo;
    Label3: TLabel;
    DBMemo3: TDBMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dsSORTEIO: TDataSource;
    Radio2: TRadioGroup;
    qrSORTEIO: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Consulta;
    procedure Radio2Click(Sender: TObject);
    procedure Radio1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    Form : TForm;
    { Public declarations }
  end;

var
  fDadosConcurso: TfDadosConcurso;

implementation

{$R *.dfm}

uses uDM, uMenu;

procedure TfDadosConcurso.Edit1Exit(Sender: TObject);
begin
  Consulta;
end;

procedure TfDadosConcurso.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Consulta;
end;

procedure TfDadosConcurso.FormActivate(Sender: TObject);
begin
  Consulta;
end;

procedure TfDadosConcurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qrSORTEIO.Close;
  Form.Enabled := True;
end;

procedure TfDadosConcurso.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TfDadosConcurso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if (Shift = []) and (Key = VK_ESCAPE) then
     fDadosConcurso.Close;
end;

procedure TfDadosConcurso.Radio1Click(Sender: TObject);
begin
  case Radio1.ItemIndex of
    0: Label6.Caption := 'Nº Bolão';
    1: Label6.Caption := 'Concurso';
  end;
  Consulta;
end;

procedure TfDadosConcurso.Radio2Click(Sender: TObject);
begin
  Consulta;
end;

procedure TfDadosConcurso.Consulta;
begin
  qrSORTEIO.Close;
  qrSORTEIO.SQL.Clear;
  qrSORTEIO.SQL.Add('SELECT * FROM SORTEIOS');
  if Edit1.Text <> '' then
     begin
       case Radio1.ItemIndex of
         0: qrSORTEIO.SQL.Add('WHERE NUMBOLAO = ''' + Edit1.Text + ''' AND');
         1: qrSORTEIO.SQL.Add('WHERE SORTEIO = ''' + Edit1.Text + ''' AND');
       end;
     end
  else
     qrSORTEIO.SQL.Add('WHERE');
  case Radio2.ItemIndex of
    0: qrSORTEIO.SQL.Add('  DELETADO IN (''N'',''S'')');
    1: qrSORTEIO.SQL.Add('  DELETADO = ''N''');
  end;
  case Radio1.ItemIndex of
    0: qrSORTEIO.SQL.Add('ORDER BY CONTADOR, NUMBOLAO');
    1: qrSORTEIO.SQL.Add('ORDER BY CONTADOR, SORTEIO');
  end;
  qrSORTEIO.Open;
end;

end.
