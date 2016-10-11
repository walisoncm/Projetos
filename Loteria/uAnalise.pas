unit uAnalise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, ppParameter,
  ppDesignLayer, ppCtrls, ppBands, ppClass, ppPrnabl, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Data.DB, IBCustomDataSet, IBQuery,
  Vcl.StdCtrls;

type
  TfAnalise = class(TForm)
    Panel1: TPanel;
    Edit3: TEdit;
    Label6: TLabel;
    Button101: TButton;
    Radio1: TRadioGroup;
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel6: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel5: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppBDEPipeline2: TppBDEPipeline;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppLine3: TppLine;
    ppLabel9: TppLabel;
    ppLine4: TppLine;
    ppDBText5: TppDBText;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button101Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Form : TForm;
    { Public declarations }
  end;

var
  fAnalise: TfAnalise;

implementation

{$R *.dfm}

uses uDM;

procedure TfAnalise.Button101Click(Sender: TObject);
begin
  if Edit3.Text = '' then
     begin
       Application.MessageBox('Informe o CONCURSO antes de consultar!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
       Edit3.SetFocus;
       Exit;
     end;

  if Edit1.Text = '' then
     begin
       Application.MessageBox('Informe o Nº BOLÃO antes de consultar!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
       Edit1.SetFocus;
       Exit;
     end;

  fDM.qrVisualizar.Close;
  fDM.qrVisualizar.SQL.Clear;
  fDM.qrVisualizar.SQL.Add('SELECT ACERTOS.*');
  fDM.qrVisualizar.SQL.Add('FROM ACERTOS');
  fDM.qrVisualizar.SQL.Add('WHERE ACERTOS.NUMSORTEIO = :pSORTEIO');
  fDM.qrVisualizar.SQL.Add('  AND ACERTOS.SORTEIO = :pNUMBOLAO');
  fDM.qrVisualizar.SQL.Add('ORDER BY ACERTOS.ACERTO DESC,');
  fDM.qrVisualizar.SQL.Add('         ACERTOS.CONTADOR');
  fDM.qrVisualizar.ParamByName('pSORTEIO').AsInteger  := StrToInt(Edit3.Text);
  fDM.qrVisualizar.ParamByName('pNUMBOLAO').AsInteger := StrToInt(Edit1.Text);
  fDM.qrVisualizar.Open;

  ppReport1.PrintReport;

  fDM.qrVisualizar.Close;
end;

procedure TfAnalise.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48.. #57, #8]) then
     Key := #0;
end;

procedure TfAnalise.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form.Enabled := True;
end;

procedure TfAnalise.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Edit3.Text := '';
end;

procedure TfAnalise.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_ESCAPE) then
     fAnalise.Close;
end;

end.
