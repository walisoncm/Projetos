unit uApostas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, ppParameter,
  ppDesignLayer, ppCtrls, ppBands, ppClass, ppPrnabl, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Data.DB, IBCustomDataSet, IBQuery,
  Vcl.StdCtrls;

type
  TfApostas = class(TForm)
    Panel1: TPanel;
    Edit3: TEdit;
    Label6: TLabel;
    Button101: TButton;
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel6: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLabel4: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    qrQtde: TIBQuery;
    ppReport1Label1: TppLabel;
    dsQtde: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button101Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    Form : TForm;
    { Public declarations }
  end;

var
  fApostas: TfApostas;

implementation

{$R *.dfm}

uses uDM;

procedure TfApostas.Button101Click(Sender: TObject);
begin
  if Edit3.Text = '' then
     begin
       Application.MessageBox('Informe o CONCURSO antes de consultar!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
       Edit3.SetFocus;
       Exit;
     end;

  qrQtde.Close;
  qrQtde.SQL.Clear;
  qrQtde.SQL.Add('SELECT SEQUENCIAS.*');
  qrQtde.SQL.Add('FROM SEQUENCIAS');
  qrQtde.SQL.Add('WHERE SEQUENCIAS.NUMSORTEIO = :pSORTEIO');
  qrQtde.SQL.Add('  AND SEQUENCIAS.SORTEIO = :pNUMBOLAO');
  qrQtde.SQL.Add('  AND SEQUENCIAS.SEL = ''*''');
  qrQtde.SQL.Add('ORDER BY SEQUENCIAS.CONTADOR');
  qrQtde.ParamByName('pNUMBOLAO').AsInteger := StrToInt(Edit1.Text);
  qrQtde.ParamByName('pSORTEIO').AsInteger  := StrToInt(Edit3.Text);
  qrQtde.Open;

  ppReport1.PrintReport;

  qrQtde.Close;
  fDM.qrVisualizar.Close;
end;

procedure TfApostas.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48.. #57, #8]) then
     Key := #0;
end;

procedure TfApostas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form.Enabled := True;
end;

procedure TfApostas.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Edit3.Text := '';
end;

procedure TfApostas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_ESCAPE) then
     fApostas.Close;
end;

procedure TfApostas.ppDetailBand1BeforePrint(Sender: TObject);
begin
  ppReport1Label1.Caption := qrQtde.FieldByName('SEQUENCIA').AsString;
end;

end.
