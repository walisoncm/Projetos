unit uAnResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, ppParameter,
  ppDesignLayer, ppCtrls, ppBands, ppClass, ppPrnabl, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Data.DB, IBCustomDataSet, IBQuery,
  Vcl.StdCtrls, Vcl.Mask;

type
  TfAnResult = class(TForm)
    Panel1: TPanel;
    Button101: TButton;
    Radio1: TRadioGroup;
    Label1: TLabel;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ppReport1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppShape3: TppShape;
    ppLabel5: TppLabel;
    ppShape4: TppShape;
    ppLabel7: TppLabel;
    ppShape5: TppShape;
    ppLabel8: TppLabel;
    ppShape6: TppShape;
    ppLabel9: TppLabel;
    ppShape7: TppShape;
    ppLabel10: TppLabel;
    ppShape8: TppShape;
    ppLabel11: TppLabel;
    ppShape9: TppShape;
    ppLabel12: TppLabel;
    ppShape10: TppShape;
    ppLabel13: TppLabel;
    ppShape11: TppShape;
    ppLabel14: TppLabel;
    ppShape12: TppShape;
    ppLabel15: TppLabel;
    ppShape13: TppShape;
    ppLabel16: TppLabel;
    ppShape14: TppShape;
    ppLabel17: TppLabel;
    ppShape15: TppShape;
    ppLabel18: TppLabel;
    ppShape16: TppShape;
    ppLabel19: TppLabel;
    ppShape17: TppShape;
    ppLabel20: TppLabel;
    ppShape18: TppShape;
    ppLabel21: TppLabel;
    ppShape19: TppShape;
    ppLabel22: TppLabel;
    ppShape20: TppShape;
    ppLabel23: TppLabel;
    ppShape21: TppShape;
    ppLabel24: TppLabel;
    ppShape22: TppShape;
    ppLabel25: TppLabel;
    ppShape23: TppShape;
    ppLabel26: TppLabel;
    ppShape24: TppShape;
    ppLabel27: TppLabel;
    ppShape25: TppShape;
    ppReport1Label1: TppLabel;
    ppShape26: TppShape;
    ppReport1Label2: TppLabel;
    ppShape27: TppShape;
    ppReport1Label3: TppLabel;
    ppShape28: TppShape;
    ppReport1Label4: TppLabel;
    ppShape29: TppShape;
    ppReport1Label5: TppLabel;
    ppShape30: TppShape;
    ppReport1Label6: TppLabel;
    ppShape31: TppShape;
    ppReport1Label7: TppLabel;
    ppShape32: TppShape;
    ppReport1Label8: TppLabel;
    ppShape33: TppShape;
    ppReport1Label9: TppLabel;
    ppShape34: TppShape;
    ppReport1Label10: TppLabel;
    ppShape35: TppShape;
    ppReport1Label11: TppLabel;
    ppShape36: TppShape;
    ppReport1Label12: TppLabel;
    ppShape37: TppShape;
    ppReport1Label13: TppLabel;
    ppShape38: TppShape;
    ppReport1Label14: TppLabel;
    ppShape39: TppShape;
    ppReport1Label15: TppLabel;
    ppShape40: TppShape;
    ppReport1Label16: TppLabel;
    ppShape41: TppShape;
    ppReport1Label17: TppLabel;
    ppShape42: TppShape;
    ppReport1Label18: TppLabel;
    ppShape43: TppShape;
    ppReport1Label19: TppLabel;
    ppShape44: TppShape;
    ppReport1Label20: TppLabel;
    ppShape45: TppShape;
    ppReport1Label21: TppLabel;
    ppShape46: TppShape;
    ppReport1Label22: TppLabel;
    ppShape47: TppShape;
    ppReport1Label23: TppLabel;
    ppShape48: TppShape;
    ppReport1Label24: TppLabel;
    ppShape49: TppShape;
    ppReport1Label25: TppLabel;
    ppShape50: TppShape;
    ppReport1Label26: TppLabel;
    procedure Button101Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    Form : TForm;
    G_01, G_02, G_03, G_04, G_05, G_06, G_07, G_08, G_09, G_10, G_11, G_12,
    G_13, G_14, G_15, G_16, G_17, G_18, G_19, G_20, G_21, G_22, G_23, G_24,
    G_25
    : Integer;
    { Public declarations }
  end;

var
  fAnResult: TfAnResult;

implementation

{$R *.dfm}

uses uDM;

procedure TfAnResult.Button101Click(Sender: TObject);
var
  L_Num : TStrings;
  L_Aux,
  L_Conta
  : Integer;
begin
  L_Num := TStringList.Create;
  L_Conta := 0;

  G_01 := 0;
  G_02 := 0;
  G_03 := 0;
  G_04 := 0;
  G_05 := 0;
  G_06 := 0;
  G_07 := 0;
  G_08 := 0;
  G_09 := 0;
  G_10 := 0;
  G_11 := 0;
  G_12 := 0;
  G_13 := 0;
  G_14 := 0;
  G_15 := 0;
  G_16 := 0;
  G_17 := 0;
  G_18 := 0;
  G_19 := 0;
  G_20 := 0;
  G_21 := 0;
  G_22 := 0;
  G_23 := 0;
  G_24 := 0;
  G_25 := 0;

  fDM.qrVisualizar.Close;
  fDM.qrVisualizar.SQL.Clear;
  fDM.qrVisualizar.SQL.Add('SELECT SORTEIOS.RESULTADO');
  fDM.qrVisualizar.SQL.Add('FROM SORTEIOS');
  fDM.qrVisualizar.SQL.Add('WHERE SORTEIOS.DTRESULTADO BETWEEN :pDATAINI AND :pDATAFIM');
  fDM.qrVisualizar.ParamByName('pDATAINI').AsDateTime := StrToDateTime(MaskEdit1.Text + ' 00:00');
  fDM.qrVisualizar.ParamByName('pDATAFIM').AsDateTime := StrToDateTime(MaskEdit2.Text + ' 23:59');
  fDM.qrVisualizar.Open;
  fDM.qrVisualizar.First;

  while not fDM.qrVisualizar.Eof do
    begin
      L_Num.Delimiter := ';';
      L_Num.StrictDelimiter := False;
      L_Num.DelimitedText := StringReplace(fDM.qrVisualizar.FieldByName('RESULTADO').AsString, ' ', '', ([rfReplaceAll]));

      Inc(L_Conta);
      for L_Aux := 0 to L_Num.Count - 1 do
        begin
          case StrToIntDef(L_Num[L_Aux], 0) of
             1: Inc(G_01);
             2: Inc(G_02);
             3: Inc(G_03);
             4: Inc(G_04);
             5: Inc(G_05);
             6: Inc(G_06);
             7: Inc(G_07);
             8: Inc(G_08);
             9: Inc(G_09);
            10: Inc(G_10);
            11: Inc(G_11);
            12: Inc(G_12);
            13: Inc(G_13);
            14: Inc(G_14);
            15: Inc(G_15);
            16: Inc(G_16);
            17: Inc(G_17);
            18: Inc(G_18);
            19: Inc(G_19);
            20: Inc(G_20);
            21: Inc(G_21);
            22: Inc(G_22);
            23: Inc(G_23);
            24: Inc(G_24);
            25: Inc(G_25);
          end;
        end;
      fDM.qrVisualizar.Next;
    end;
  fDM.qrVisualizar.Close;

  ppReport1Label26.Caption := 'EM ' + IntToStr(L_Conta) + ' CONCURSOS';
  ppReport1.PrintReport;
end;

procedure TfAnResult.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form.Enabled := True;
end;

procedure TfAnResult.FormCreate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit2.Text := DateToStr(Date);
end;

procedure TfAnResult.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_ESCAPE) then
     fAnResult.Close;
end;

procedure TfAnResult.ppDetailBand2BeforePrint(Sender: TObject);
begin
  ppReport1Label1.Caption  := IntToStr(G_01);
  ppReport1Label2.Caption  := IntToStr(G_02);
  ppReport1Label3.Caption  := IntToStr(G_03);
  ppReport1Label4.Caption  := IntToStr(G_04);
  ppReport1Label5.Caption  := IntToStr(G_05);
  ppReport1Label6.Caption  := IntToStr(G_06);
  ppReport1Label7.Caption  := IntToStr(G_07);
  ppReport1Label8.Caption  := IntToStr(G_08);
  ppReport1Label9.Caption  := IntToStr(G_09);
  ppReport1Label10.Caption := IntToStr(G_10);
  ppReport1Label11.Caption := IntToStr(G_11);
  ppReport1Label12.Caption := IntToStr(G_12);
  ppReport1Label13.Caption := IntToStr(G_13);
  ppReport1Label14.Caption := IntToStr(G_14);
  ppReport1Label15.Caption := IntToStr(G_15);
  ppReport1Label16.Caption := IntToStr(G_16);
  ppReport1Label17.Caption := IntToStr(G_17);
  ppReport1Label18.Caption := IntToStr(G_18);
  ppReport1Label19.Caption := IntToStr(G_19);
  ppReport1Label20.Caption := IntToStr(G_20);
  ppReport1Label21.Caption := IntToStr(G_21);
  ppReport1Label22.Caption := IntToStr(G_22);
  ppReport1Label23.Caption := IntToStr(G_23);
  ppReport1Label24.Caption := IntToStr(G_24);
  ppReport1Label25.Caption := IntToStr(G_25);
end;

end.
