unit uImprimir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Data.DB, IBCustomDataSet, IBQuery, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppPrnabl, ppCtrls, ppStrtch, ppMemo,
  ppRegion, IBSQL, Vcl.Imaging.jpeg, Bde.DBTables;

type
  TfImprimir = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Edit3: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn99: TBitBtn;
    BitBtn98: TBitBtn;
    BitBtn97: TBitBtn;
    BitBtn96: TBitBtn;
    BitBtn95: TBitBtn;
    BitBtn94: TBitBtn;
    BitBtn93: TBitBtn;
    BitBtn92: TBitBtn;
    BitBtn91: TBitBtn;
    BitBtn90: TBitBtn;
    BitBtn89: TBitBtn;
    BitBtn88: TBitBtn;
    BitBtn87: TBitBtn;
    BitBtn86: TBitBtn;
    BitBtn85: TBitBtn;
    BitBtn84: TBitBtn;
    BitBtn83: TBitBtn;
    BitBtn82: TBitBtn;
    BitBtn81: TBitBtn;
    BitBtn80: TBitBtn;
    BitBtn79: TBitBtn;
    BitBtn78: TBitBtn;
    BitBtn77: TBitBtn;
    BitBtn76: TBitBtn;
    BitBtn75: TBitBtn;
    BitBtn74: TBitBtn;
    BitBtn73: TBitBtn;
    BitBtn72: TBitBtn;
    BitBtn71: TBitBtn;
    BitBtn70: TBitBtn;
    BitBtn69: TBitBtn;
    BitBtn68: TBitBtn;
    BitBtn67: TBitBtn;
    BitBtn66: TBitBtn;
    BitBtn65: TBitBtn;
    BitBtn64: TBitBtn;
    BitBtn63: TBitBtn;
    BitBtn62: TBitBtn;
    BitBtn61: TBitBtn;
    BitBtn60: TBitBtn;
    BitBtn59: TBitBtn;
    BitBtn58: TBitBtn;
    BitBtn57: TBitBtn;
    BitBtn56: TBitBtn;
    BitBtn55: TBitBtn;
    BitBtn54: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn50: TBitBtn;
    BitBtn49: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Radio1: TRadioGroup;
    BitBtn101: TBitBtn;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    tVisualizar: TIBDataSet;
    dsVisualizar: TDataSource;
    ppReport1: TppReport;
    dsQtde: TDataSource;
    ppBDEPipeline1: TppBDEPipeline;
    qrQtde: TIBQuery;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDetailBand1: TppDetailBand;
    ppReport1Shape1: TppShape;
    ppReport1Shape2: TppShape;
    ppReport1Shape3: TppShape;
    ppReport1Shape4: TppShape;
    ppReport1Shape5: TppShape;
    ppReport1Shape6: TppShape;
    ppReport1Shape7: TppShape;
    ppReport1Shape8: TppShape;
    ppReport1Shape9: TppShape;
    ppReport1Shape10: TppShape;
    ppReport1Shape11: TppShape;
    ppReport1Shape12: TppShape;
    ppReport1Shape13: TppShape;
    ppReport1Shape14: TppShape;
    ppReport1Shape15: TppShape;
    ppReport1Shape16: TppShape;
    ppReport1Shape17: TppShape;
    ppReport1Shape18: TppShape;
    ppReport1Shape19: TppShape;
    ppReport1Shape20: TppShape;
    ppReport1Shape21: TppShape;
    ppReport1Shape22: TppShape;
    ppReport1Shape23: TppShape;
    ppReport1Shape24: TppShape;
    ppReport1Shape25: TppShape;
    ppReport1Shape55: TppShape;
    ppReport1Shape56: TppShape;
    ppReport1Shape57: TppShape;
    ppReport1Shape58: TppShape;
    ppReport1Shape59: TppShape;
    ppRegion1: TppRegion;
    ppRegion2: TppRegion;
    ppReport1Shape26: TppShape;
    ppReport1Shape27: TppShape;
    ppReport1Shape28: TppShape;
    ppReport1Shape29: TppShape;
    ppReport1Shape30: TppShape;
    ppReport1Shape31: TppShape;
    ppReport1Shape32: TppShape;
    ppReport1Shape33: TppShape;
    ppReport1Shape34: TppShape;
    ppReport1Shape35: TppShape;
    ppReport1Shape36: TppShape;
    ppReport1Shape37: TppShape;
    ppReport1Shape38: TppShape;
    ppReport1Shape39: TppShape;
    ppReport1Shape40: TppShape;
    ppReport1Shape41: TppShape;
    ppReport1Shape42: TppShape;
    ppReport1Shape43: TppShape;
    ppReport1Shape44: TppShape;
    ppReport1Shape45: TppShape;
    ppReport1Shape46: TppShape;
    ppReport1Shape47: TppShape;
    ppReport1Shape48: TppShape;
    ppReport1Shape49: TppShape;
    ppReport1Shape50: TppShape;
    ppReport1Shape60: TppShape;
    ppReport1Shape61: TppShape;
    ppReport1Shape62: TppShape;
    ppReport1Shape63: TppShape;
    ppReport1Shape64: TppShape;
    ppRegion4: TppRegion;
    ppReport1Shape65: TppShape;
    ppReport1Shape66: TppShape;
    tVisualizarCONTADOR: TIntegerField;
    tVisualizarSEQUENCIA: TIBStringField;
    tVisualizarSEL: TIBStringField;
    Label1000: TLabel;
    IBUpdate: TIBSQL;
    ppHeaderBand1: TppHeaderBand;
    Label1001: TLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine5: TppLine;
    ppReport1Label1: TppLabel;
    ppReport1Label2: TppLabel;
    ppReport1Label3: TppLabel;
    ppReport1Label4: TppLabel;
    ppReport1Label5: TppLabel;
    ppReport1Label6: TppLabel;
    ppReport1Label7: TppLabel;
    ppReport1Label8: TppLabel;
    ppReport1Label9: TppLabel;
    ppReport1Label10: TppLabel;
    ppReport1Label11: TppLabel;
    ppReport1Label12: TppLabel;
    ppReport1Label13: TppLabel;
    ppReport1Label14: TppLabel;
    ppReport1Label15: TppLabel;
    ppReport1Label16: TppLabel;
    ppReport1Label17: TppLabel;
    ppReport1Label18: TppLabel;
    ppReport1Label19: TppLabel;
    ppReport1Label20: TppLabel;
    ppReport1Label21: TppLabel;
    ppReport1Label22: TppLabel;
    ppReport1Label23: TppLabel;
    ppReport1Label24: TppLabel;
    ppReport1Label25: TppLabel;
    ppReport1Label26: TppLabel;
    ppReport1Label27: TppLabel;
    ppReport1Label28: TppLabel;
    ppReport1Label29: TppLabel;
    ppReport1Label30: TppLabel;
    ppReport1Label31: TppLabel;
    ppReport1Label32: TppLabel;
    ppReport1Label33: TppLabel;
    ppReport1Label34: TppLabel;
    ppReport1Label35: TppLabel;
    ppReport1Label36: TppLabel;
    ppReport1Label37: TppLabel;
    ppReport1Label38: TppLabel;
    ppReport1Label39: TppLabel;
    ppReport1Label40: TppLabel;
    ppReport1Label41: TppLabel;
    ppReport1Label42: TppLabel;
    ppReport1Label43: TppLabel;
    ppReport1Label44: TppLabel;
    ppReport1Label45: TppLabel;
    ppReport1Label46: TppLabel;
    ppReport1Label47: TppLabel;
    ppReport1Label48: TppLabel;
    ppReport1Label49: TppLabel;
    ppReport1Label50: TppLabel;
    qrImprimir: TIBQuery;
    ppRegion3: TppRegion;
    ppReport1Shape51: TppShape;
    ppReport1Shape52: TppShape;
    ppReport1Shape53: TppShape;
    ppReport1Shape54: TppShape;
    Label2: TLabel;
    Edit1: TEdit;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppRegion5: TppRegion;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppRegion6: TppRegion;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText3: TppDBText;
    ppRegion7: TppRegion;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppShape41: TppShape;
    ppShape42: TppShape;
    ppShape43: TppShape;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppShape48: TppShape;
    ppShape49: TppShape;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppShape52: TppShape;
    ppShape53: TppShape;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppShape58: TppShape;
    ppShape59: TppShape;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppShape62: TppShape;
    ppShape63: TppShape;
    ppShape64: TppShape;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppDBText4: TppDBText;
    ppLine7: TppLine;
    ppRegion8: TppRegion;
    ppShape65: TppShape;
    ppShape66: TppShape;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppReport1Image1: TppImage;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppReport1ImageIndependencia: TppImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Confirma;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure AfterScroll(DataSet: TDataSet);
    procedure VerificaNP;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn101Click(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    function PegaPrimeiro: Integer;
    procedure Edit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    Form : TForm;
    G_SQL : String;
    G_Cont, G_Fim, G_Max, G_Min, G_MaxSel, G_Aux, G_Primeiro : Integer;
    G_Ini : TStrings;
    G_Controle : Boolean;
    G_Lado1ou2 : SmallInt;
    { Public declarations }
  end;

var
  fImprimir: TfImprimir;

const
  C_Reg = 100;
  C_SQL = 'SELECT FIRST 100 /* C_Reg */ SEQUENCIAS.SORTEIO,' + #13 + #10 +
          '       SEQUENCIAS.NUMSORTEIO,' + #13 + #10 +
          '       SEQUENCIAS.CONTADOR,' + #13 + #10 +
          '       SEQUENCIAS.SEQUENCIA,' + #13 + #10 +
          '       SEQUENCIAS.SEL' + #13 + #10 +
          'FROM SEQUENCIAS' + #13 + #10 +
          'WHERE SEQUENCIAS.NUMSORTEIO = :pSORTEIO' + #13 + #10 +
          '  AND SEQUENCIAS.SORTEIO = :pNUMBOLAO' + #13 + #10 +
          '  AND SEQUENCIAS.CONTADOR BETWEEN :pINI AND :pFIM' + #13 + #10;
implementation

{$R *.dfm}

uses uMenu, uDM;

procedure TfImprimir.BitBtn101Click(Sender: TObject);
begin
  if not (tVisualizar.State = dsBrowse) then
     begin
       if Edit1.Text <> '' then
          begin
            if Edit3.Text <> '' then
               Confirma()
            else
               begin
                 Application.MessageBox('Informe o CONCURSO antes de imprimir!', 'ATENÇÃO!', MB_OK + MB_ICONINFORMATION);
                 Edit3.SetFocus;
                 Exit;
               end;
          end
       else
          begin
            Application.MessageBox('Informe o Nº BOLÃO antes de imprimir!', 'ATENÇÃO!', MB_OK + MB_ICONINFORMATION);
            Edit1.SetFocus;
            Exit;
          end;
     end;

  Label1000.Caption := 'AGUARDE...';
  Label1000.Update;

  qrQtde.Close;
  qrQtde.SQL.Clear;
  qrQtde.SQL.Add('SELECT SEQUENCIAS.CONTADOR,');
  qrQtde.SQL.Add('       SEQUENCIAS.SEQUENCIA');
  qrQtde.SQL.Add('FROM SEQUENCIAS');
  qrQtde.SQL.Add('WHERE SEQUENCIAS.NUMSORTEIO = :pSORTEIO');
  qrQtde.SQL.Add('  AND SEQUENCIAS.SORTEIO = :pNUMBOLAO');
  qrQtde.SQL.Add('  AND SEQUENCIAS.SEL = ''*''');
  qrQtde.SQL.Add('ORDER BY SEQUENCIAS.CONTADOR');
  qrQtde.ParamByName('pSORTEIO').AsInteger  := StrToInt(Edit3.Text);
  qrQtde.ParamByName('pNUMBOLAO').AsInteger := StrToInt(Edit1.Text);
  qrQtde.Open;

  qrQtde.FetchAll;

  if qrQtde.RecordCount mod 2 = 1 then
     begin
       qrQtde.Close;
       qrQtde.SQL.Clear;
       qrQtde.SQL.Add('SELECT SEQUENCIAS.CONTADOR,');
       qrQtde.SQL.Add('       SEQUENCIAS.SEQUENCIA');
       qrQtde.SQL.Add('FROM SEQUENCIAS');
       qrQtde.SQL.Add('WHERE SEQUENCIAS.NUMSORTEIO = :pSORTEIO');
       qrQtde.SQL.Add('  AND SEQUENCIAS.SORTEIO = :pNUMBOLAO');
       qrQtde.SQL.Add('  AND SEQUENCIAS.SEL = ''*''');
       qrQtde.SQL.Add('UNION ALL');
       qrQtde.SQL.Add('SELECT FIRST 1 0 AS CONTADOR,');
       qrQtde.SQL.Add('       '''' AS SEQUENCIA');
       qrQtde.SQL.Add('FROM SEQUENCIAS');
       qrQtde.SQL.Add('WHERE SEQUENCIAS.NUMSORTEIO = :pSORTEIO');
       qrQtde.SQL.Add('  AND SEQUENCIAS.SORTEIO = :pNUMBOLAO');
       qrQtde.SQL.Add('  AND SEQUENCIAS.SEL = ''*''');
       qrQtde.ParamByName('pSORTEIO').AsInteger  := StrToInt(Edit3.Text);
       qrQtde.ParamByName('pNUMBOLAO').AsInteger := StrToInt(Edit1.Text);
       qrQtde.Open;
     end;

  case Radio1.ItemIndex of
    0: begin
         ppReport1Shape51.Top := 35;
         ppReport1Shape52.Top := 41.5;
         ppReport1Shape53.Top := 67;
         ppLine1.Left := 43.127;
         ppLine2.Left := 43.127;
         ppLine2.Width := 53.181;
         ppLine3.Left := 43.127;
         ppLine3.Width := 53.181;
         ppLine4.Left := 78.846;
         ppLine5.Width := 83.344;
         ppLine6.Width := 83.344;
         ppRegion3.Left := 57.15;
         ppReport1Shape66.Left := 42.333;
       end;
    1: begin
         ppReport1Shape51.Top := 16.2;
         ppReport1Shape52.Top := 29.2;
         ppReport1Shape53.Top := 54;
         ppLine1.Left := 2.529;
         ppLine2.Left := 2.529;
         ppLine2.Width := 96.69;
         ppLine3.Left := 2.529;
         ppLine3.Width := 96.69;
         ppLine4.Left := 85.461;
         ppLine5.Width := 89.896;
         ppLine6.Width := 89.896;
         ppRegion3.Left := 57.679;
         ppReport1Shape66.Left := 40.746;
       end;
  end;

  ppReport1.TextFileName := fMenu.GM_CaminhoARQUIVOS + 'Concurso_' + Trim(Edit3.Text) + '_Bolao_' + Trim(Edit1.Text);
  ppReport1.PrintReport;

  qrQtde.Close;

  Label1000.Caption := '';
  Label1000.Update;
end;

procedure TfImprimir.BitBtn1Click(Sender: TObject);
begin
  if not (Sender is TBitBtn) then
     Exit;

  fMenu.SQL(G_SQL, TBitBtn(Sender).Caption);
  fMenu.BitBtnCor(Sender);
  Confirma();
end;

procedure TfImprimir.Edit3Exit(Sender: TObject);
begin
  Confirma();
end;

procedure TfImprimir.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
     begin
       Confirma();
     end;
end;

procedure TfImprimir.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48.. #57, #8]) then
     Key := #0;
end;

procedure TfImprimir.Confirma;
begin
  if (Edit3.Text = '') then
     Exit;

  if (Edit1.Text = '') then
     Exit;

  Label1000.Caption := 'AGUARDE...';
  Label1000.Update;

  fDM.qrVerifica.Close;
  fDM.qrVerifica.SQL.Clear;
  fDM.qrVerifica.SQL.Add('SELECT (SELECT MAX(SEQUENCIAS.CONTADOR)');
  fDM.qrVerifica.SQL.Add('        FROM SEQUENCIAS');
  fDM.qrVerifica.SQL.Add('        WHERE NUMSORTEIO = :pSORTEIO');
  fDM.qrVerifica.SQL.Add('          AND SORTEIO = :pNUMBOLAO');
  fDM.qrVerifica.SQL.Add('        ' + G_SQL + ') AS MAIOR,');
  fDM.qrVerifica.SQL.Add('       MIN(SEQUENCIAS.CONTADOR) AS MENOR');
  fDM.qrVerifica.SQL.Add('FROM SEQUENCIAS');
  fDM.qrVerifica.SQL.Add('WHERE NUMSORTEIO = :pSORTEIO');
  fDM.qrVerifica.SQL.Add('  AND SORTEIO = :pNUMBOLAO');
  fDM.qrVerifica.SQL.Add(G_SQL);
  fDM.qrVerifica.ParamByName('pSORTEIO').AsInteger  := StrToInt(Edit3.Text);
  fDM.qrVerifica.ParamByName('pNUMBOLAO').AsInteger := StrToInt(Edit1.Text);
  fDM.qrVerifica.Open;

  if (fDM.qrVerifica.Bof) and (fDM.qrVerifica.Eof) then
     begin
       Application.MessageBox('Sorteio informado não foi realizado no sistema!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
       Edit3.SetFocus;
       Exit;
     end;

  G_Min := fDM.qrVerifica.FieldByName('MENOR').AsInteger;
  G_Max := fDM.qrVerifica.FieldByName('MAIOR').AsInteger;
  fDM.qrVerifica.Close;

  G_Ini.Clear;
  G_Ini.Add(IntToStr(G_Min));
  G_Cont := 0;

  tVisualizar.Close;
  tVisualizar.SelectSQL.Clear;
  tVisualizar.SelectSQL.Add(C_SQL + G_SQL);
  tVisualizar.SelectSQL.Add('ORDER BY SEQUENCIAS.NUMSORTEIO,');
  tVisualizar.SelectSQL.Add('         SEQUENCIAS.CONTADOR');
  tVisualizar.ParamByName('pNUMBOLAO').AsInteger := StrToInt(Edit1.Text);
  tVisualizar.ParamByName('pSORTEIO').AsInteger  := StrToInt(Edit3.Text);
  tVisualizar.ParamByName('pINI').AsInteger := StrToInt(G_Ini[G_Cont]);
  tVisualizar.ParamByName('pFIM').AsInteger := G_Max;
  tVisualizar.Open;

  tVisualizar.Last;

  G_Fim := tVisualizar.FieldByName('CONTADOR').AsInteger;

  tVisualizar.First;

  SpeedButton1.Enabled := True;
  SpeedButton3.Enabled := True;

  Label1000.Caption := '';
  Label1000.Update;
end;

procedure TfImprimir.DBGrid1Enter(Sender: TObject);
begin
  if tVisualizar.State = dsBrowse then
     begin
       Label1000.Caption := 'ESPAÇO - MARCAR/DESMARCAR';
       Label1001.Caption := 'F2 - MARCAR/DESMARCAR(PÁGINA)   F3 - MARCAR/DESMARCAR(CONSULTA)   F4 - MARCAR/DESMARCAR(TODOS)';
     end;
end;

procedure TfImprimir.DBGrid1Exit(Sender: TObject);
begin
  Label1000.Caption := '';
  Label1001.Caption := '';
end;

procedure TfImprimir.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  L_Max, L_Contador
  : Integer;
begin
  Label1000.Caption := 'AGUARDE...';
  Label1000.Update;
  Label1001.Caption := '';
  Label1001.Update;
  if Key = VK_SPACE then
     begin
       L_Contador := tVisualizar.FieldByName('CONTADOR').AsInteger;
       if tVisualizar.FieldByName('SEL').AsString = '*' then
          begin
            IBUpdate.Close;
            IBUpdate.SQL.Clear;
            IBUpdate.SQL.Add('UPDATE SEQUENCIAS SET SEQUENCIAS.SEL = ''''');
            IBUpdate.SQL.Add('WHERE SEQUENCIAS.SORTEIO = :pSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.NUMSORTEIO = :pNUMSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.CONTADOR = :pCONTADOR');
            IBUpdate.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
            IBUpdate.ParamByName('pSORTEIO').AsInteger    := StrToInt(Edit1.Text);
            IBUpdate.ParamByName('pCONTADOR').AsInteger   := L_Contador;
            IBUpdate.ExecQuery;
          end
       else
          begin
            IBUpdate.Close;
            IBUpdate.SQL.Clear;
            IBUpdate.SQL.Add('UPDATE SEQUENCIAS SET SEQUENCIAS.SEL = ''*''');
            IBUpdate.SQL.Add('WHERE SEQUENCIAS.SORTEIO = :pSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.NUMSORTEIO = :pNUMSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.CONTADOR = :pCONTADOR');
            IBUpdate.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
            IBUpdate.ParamByName('pSORTEIO').AsInteger    := StrToInt(Edit1.Text);
            IBUpdate.ParamByName('pCONTADOR').AsInteger   := L_Contador;
            IBUpdate.ExecQuery;
          end;
       fDM.Transacao.CommitRetaining;

       tVisualizar.Close;
       tVisualizar.Open;
       tVisualizar.First;
       while not tVisualizar.Eof do
         begin
           if tVisualizar.FieldByName('CONTADOR').AsInteger = L_Contador then
              Break
           else
              tVisualizar.Next;
         end;
     end
  else if Key = VK_F2 then
     begin
       tVisualizar.Last;
       L_Max := tVisualizar.FieldByName('CONTADOR').AsInteger;
       tVisualizar.First;
       if tVisualizar.FieldByName('SEL').AsString = '*' then
          begin
            IBUpdate.Close;
            IBUpdate.SQL.Clear;
            IBUpdate.SQL.Add('UPDATE SEQUENCIAS SET SEQUENCIAS.SEL = ''''');
            IBUpdate.SQL.Add('WHERE SEQUENCIAS.SORTEIO = :pSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.NUMSORTEIO = :pNUMSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.CONTADOR BETWEEN :pINI AND :pFIM');
            IBUpdate.SQL.Add(G_SQL);
            IBUpdate.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
            IBUpdate.ParamByName('pSORTEIO').AsInteger    := StrToInt(Edit1.Text);
            IBUpdate.ParamByName('pINI').AsInteger := StrToInt(G_Ini[G_Cont]);
            IBUpdate.ParamByName('pFIM').AsInteger := L_Max;
            IBUpdate.ExecQuery;
          end
       else
          begin
            IBUpdate.Close;
            IBUpdate.SQL.Clear;
            IBUpdate.SQL.Add('UPDATE SEQUENCIAS SET SEQUENCIAS.SEL = ''*''');
            IBUpdate.SQL.Add('WHERE SEQUENCIAS.SORTEIO = :pSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.NUMSORTEIO = :pNUMSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.CONTADOR BETWEEN :pINI AND :pFIM');
            IBUpdate.SQL.Add(G_SQL);
            IBUpdate.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
            IBUpdate.ParamByName('pSORTEIO').AsInteger    := StrToInt(Edit1.Text);
            IBUpdate.ParamByName('pINI').AsInteger := StrToInt(G_Ini[G_Cont]);
            IBUpdate.ParamByName('pFIM').AsInteger := L_Max;
            IBUpdate.ExecQuery;
          end;
       fDM.Transacao.CommitRetaining;

       tVisualizar.Close;
       tVisualizar.Open;
     end
  else if Key = VK_F3 then
     begin
       tVisualizar.Last;
       L_Max := tVisualizar.FieldByName('CONTADOR').AsInteger;
       tVisualizar.First;
       if tVisualizar.FieldByName('SEL').AsString = '*' then
          begin
            IBUpdate.Close;
            IBUpdate.SQL.Clear;
            IBUpdate.SQL.Add('UPDATE SEQUENCIAS SET SEQUENCIAS.SEL = ''''');
            IBUpdate.SQL.Add('WHERE SEQUENCIAS.SORTEIO = :pSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.NUMSORTEIO = :pNUMSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.CONTADOR BETWEEN :pINI AND :pFIM');
            IBUpdate.SQL.Add(G_SQL);
            IBUpdate.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
            IBUpdate.ParamByName('pSORTEIO').AsInteger    := StrToInt(Edit1.Text);
            IBUpdate.ParamByName('pINI').AsInteger := G_Min;
            IBUpdate.ParamByName('pFIM').AsInteger := G_Max;
            IBUpdate.ExecQuery;
          end
       else
          begin
            IBUpdate.Close;
            IBUpdate.SQL.Clear;
            IBUpdate.SQL.Add('UPDATE SEQUENCIAS SET SEQUENCIAS.SEL = ''*''');
            IBUpdate.SQL.Add('WHERE SEQUENCIAS.SORTEIO = :pSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.NUMSORTEIO = :pNUMSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.CONTADOR BETWEEN :pINI AND :pFIM');
            IBUpdate.SQL.Add(G_SQL);
            IBUpdate.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
            IBUpdate.ParamByName('pSORTEIO').AsInteger    := StrToInt(Edit1.Text);
            IBUpdate.ParamByName('pINI').AsInteger := G_Min;
            IBUpdate.ParamByName('pFIM').AsInteger := G_Max;
            IBUpdate.ExecQuery;
          end;
       fDM.Transacao.CommitRetaining;

       tVisualizar.Close;
       tVisualizar.Open;
     end
  else if Key = VK_F4 then
     begin
       tVisualizar.First;
       if tVisualizar.FieldByName('SEL').AsString = '*' then
          begin
            IBUpdate.Close;
            IBUpdate.SQL.Clear;
            IBUpdate.SQL.Add('UPDATE SEQUENCIAS SET SEQUENCIAS.SEL = ''''');
            IBUpdate.SQL.Add('WHERE SEQUENCIAS.SORTEIO = :pSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.NUMSORTEIO = :pNUMSORTEIO');
            IBUpdate.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
            IBUpdate.ParamByName('pSORTEIO').AsInteger    := StrToInt(Edit1.Text);
            IBUpdate.ExecQuery;
          end
       else
          begin
            IBUpdate.Close;
            IBUpdate.SQL.Clear;
            IBUpdate.SQL.Add('UPDATE SEQUENCIAS SET SEQUENCIAS.SEL = ''*''');
            IBUpdate.SQL.Add('WHERE SEQUENCIAS.SORTEIO = :pSORTEIO');
            IBUpdate.SQL.Add('  AND SEQUENCIAS.NUMSORTEIO = :pNUMSORTEIO');
            IBUpdate.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
            IBUpdate.ParamByName('pSORTEIO').AsInteger    := StrToInt(Edit1.Text);
            IBUpdate.ExecQuery;
          end;
       fDM.Transacao.CommitRetaining;

       tVisualizar.Close;
       tVisualizar.Open;
     end;
  Label1000.Caption := 'ESPAÇO - MARCAR/DESMARCAR';
  Label1000.Update;
  Label1001.Caption := 'F2 - MARCAR/DESMARCAR(PÁGINA)   F3 - MARCAR/DESMARCAR(CONSULTA)   F4 - MARCAR/DESMARCAR(TODOS)';
  Label1001.Update;
end;

procedure TfImprimir.VerificaNP();
begin
  SpeedButton1.Enabled := tVisualizar.FieldByName('CONTADOR').AsInteger < G_Max;
  SpeedButton2.Enabled := tVisualizar.FieldByName('CONTADOR').AsInteger > G_Min;
  SpeedButton3.Enabled := tVisualizar.FieldByName('CONTADOR').AsInteger < G_Max;
  SpeedButton4.Enabled := tVisualizar.FieldByName('CONTADOR').AsInteger > G_Min;
end;

procedure TfImprimir.AfterScroll(DataSet: TDataSet);
begin
  VerificaNP;
end;

procedure TfImprimir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form.Enabled := True;
  tVisualizar.AfterScroll := Nil;
  tVisualizar.Close;

  FreeAndNil(G_Ini);
end;

procedure TfImprimir.FormCreate(Sender: TObject);
var
  L_Cont : Integer;
  L_BitBtn : TBitBtn;
begin
  tVisualizar.AfterScroll := AfterScroll;
  Edit1.Text := '';
  Edit3.Text := '';
  G_Ini := TStringList.Create;
  Label1000.Caption := '';
  Label1001.Caption := '';
end;

procedure TfImprimir.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_ESCAPE) then
     fImprimir.Close;
end;

function TfImprimir.PegaPrimeiro : Integer;
begin
  fDM.qrVerifica.Close;
  fDM.qrVerifica.SQL.Clear;
  fDM.qrVerifica.SQL.Add('SELECT FIRST 1 SEQUENCIAS.CONTADOR');
  fDM.qrVerifica.SQL.Add('FROM SEQUENCIAS');
  fDM.qrVerifica.SQL.Add('WHERE SEQUENCIAS.NUMSORTEIO = :pSORTEIO');
  fDM.qrVerifica.SQL.Add('  AND SEQUENCIAS.CONTADOR BETWEEN :pINI AND :pFIM');
  fDM.qrVerifica.SQL.Add(G_SQL);
  fDM.qrVerifica.SQL.Add('ORDER BY SEQUENCIAS.NUMSORTEIO,');
  fDM.qrVerifica.SQL.Add('         SEQUENCIAS.CONTADOR');
  fDM.qrVerifica.ParamByName('pSORTEIO').AsInteger := StrToInt(Edit3.Text);
  fDM.qrVerifica.ParamByName('pINI').AsInteger := G_Fim + 1;
  fDM.qrVerifica.ParamByName('pFIM').AsInteger := G_Max;
  fDM.qrVerifica.Open;

  Result := fDM.qrVerifica.FieldByName('CONTADOR').AsInteger;
end;

procedure TfImprimir.ppDetailBand1BeforePrint(Sender: TObject);
var
  L_Sequencia : TStrings;
  L_Cont : Integer;
begin
  L_Sequencia := TStringList.Create;

  L_Sequencia.Delimiter := ';';
  L_Sequencia.StrictDelimiter := False;
  L_Sequencia.DelimitedText := qrQtde.FieldByName('SEQUENCIA').AsString;

  ppLine1.Pen.Color := $00FCFCFC;
  ppLine2.Pen.Color := $00FCFCFC;
  ppLine3.Pen.Color := $00FCFCFC;
  ppLine4.Pen.Color := $00FCFCFC;
  ppLine5.Pen.Color := $00FCFCFC;
  ppLine6.Pen.Color := $00FCFCFC;

  if G_Lado1ou2 = 1 then
     begin
       for L_Cont := 1 to 25 do
         begin
           if FindComponent('ppReport1Shape' + IntToStr(L_Cont)) <> Nil then
              begin
                TppShape(FindComponent('ppReport1Shape' + IntToStr(L_Cont))).Brush.Color := clWhite;
                TppShape(FindComponent('ppReport1Shape' + IntToStr(L_Cont))).Pen.Color   := $00FCFCFC;
              end;
           if FindComponent('ppReport1Label' + IntToStr(L_Cont)) <> Nil then
              TppLabel(FindComponent('ppReport1Label' + IntToStr(L_Cont))).Font.Color := $00FCFCFC;
         end;

       for L_Cont := 0 to L_Sequencia.Count - 1 do
         begin
           if FindComponent('ppReport1Shape' + IntToStr(StrToInt(L_Sequencia[L_Cont]))) <> Nil then
              begin
                TppShape(FindComponent('ppReport1Shape' + IntToStr(StrToInt(L_Sequencia[L_Cont])))).Brush.Color := clBlack;
                TppShape(FindComponent('ppReport1Shape' + IntToStr(StrToInt(L_Sequencia[L_Cont])))).Pen.Color   := clBlack;
              end;
           if FindComponent('ppReport1Label' + IntToStr(StrToInt(L_Sequencia[L_Cont]))) <> Nil then
              TppLabel(FindComponent('ppReport1Label' + IntToStr(StrToInt(L_Sequencia[L_Cont])))).Font.Color := clInactiveCaptionText;
         end;

       ppRegion1.Visible := True;
       ppRegion3.Visible := True;
       ppRegion2.Visible := False;
       ppRegion4.Visible := False;
       {
       ppLine1.Visible := False;
       ppLine2.Visible := False;
       ppLine3.Visible := False;
       ppLine4.Visible := False;
       ppLine5.Visible := False;
       ppLine6.Visible := False;}

       case Radio1.ItemIndex of
          0: begin
               ppReport1Image1.Visible := True;
               ppReport1ImageIndependencia.Visible := False;
             end;
          1: begin
               ppReport1Image1.Visible := False;
               ppReport1ImageIndependencia.Visible := True;
             end;
       end;

       ppLine1.Visible := True;
       ppLine2.Visible := True;
       ppLine3.Visible := True;
       ppLine4.Visible := False;
       ppLine5.Visible := False;
       ppLine6.Visible := False;

       G_Lado1ou2 := 2;
     end
  else if G_Lado1ou2 = 2 then
     begin
       for L_Cont := 26 to 50 do
         begin
           if FindComponent('ppReport1Shape' + IntToStr(L_Cont)) <> Nil then
              begin
                TppShape(FindComponent('ppReport1Shape' + IntToStr(L_Cont))).Brush.Color := clWhite;
                TppShape(FindComponent('ppReport1Shape' + IntToStr(L_Cont))).Pen.Color   := $00FCFCFC;
              end;
           if FindComponent('ppReport1Label' + IntToStr(L_Cont)) <> Nil then
              TppLabel(FindComponent('ppReport1Label' + IntToStr(L_Cont))).Font.Color := $00FCFCFC;
         end;

       for L_Cont := 0 to L_Sequencia.Count - 1 do
         begin
           if FindComponent('ppReport1Shape' + IntToStr(StrToInt(L_Sequencia[L_Cont]) + 25)) <> Nil then
              begin
                TppShape(FindComponent('ppReport1Shape' + IntToStr(StrToInt(L_Sequencia[L_Cont]) + 25))).Brush.Color := clBlack;
                TppShape(FindComponent('ppReport1Shape' + IntToStr(StrToInt(L_Sequencia[L_Cont]) + 25))).Pen.Color   := clBlack;
              end;
           if FindComponent('ppReport1Label' + IntToStr(StrToInt(L_Sequencia[L_Cont]) + 25)) <> Nil then
              TppLabel(FindComponent('ppReport1Label' + IntToStr(StrToInt(L_Sequencia[L_Cont]) + 25))).Font.Color := clInactiveCaptionText;
         end;

       ppRegion1.Visible := False;
       ppRegion3.Visible := False;
       ppRegion2.Visible := True;
       ppRegion4.Visible := True;
       {
       ppLine1.Visible := False;
       ppLine2.Visible := False;
       ppLine3.Visible := False;
       ppLine4.Visible := False;
       ppLine5.Visible := False;
       ppLine6.Visible := False;}


       case Radio1.ItemIndex of
          0: begin
               ppReport1Image1.Visible := False;
               ppReport1ImageIndependencia.Visible := False;
             end;
          1: begin
               ppReport1Image1.Visible := False;
               ppReport1ImageIndependencia.Visible := False;
             end;
       end;

       ppLine1.Visible := False;
       ppLine2.Visible := False;
       ppLine3.Visible := False;
       ppLine4.Visible := True;
       ppLine5.Visible := True;
       ppLine6.Visible := True;

       G_Lado1ou2 := 1;
     end;

  L_Sequencia.Free;
  L_Sequencia := Nil;
end;

procedure TfImprimir.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  G_Lado1ou2 := 1;
end;

procedure TfImprimir.SpeedButton1Click(Sender: TObject);
begin
  if tVisualizar.FieldByName('CONTADOR').AsInteger < G_Fim then
     begin
       tVisualizar.Last;
       Exit;
     end;

  G_Ini.Add(IntToStr(PegaPrimeiro));
  Inc(G_Cont);

  tVisualizar.Close;
  tVisualizar.ParamByName('pSORTEIO').AsInteger := StrToInt(Edit3.Text);
  tVisualizar.ParamByName('pINI').AsInteger := StrToInt(G_Ini[G_Cont]);
  tVisualizar.ParamByName('pFIM').AsInteger := G_Max;
  tVisualizar.Open;
  tVisualizar.Last;

  G_Fim := tVisualizar.FieldByName('CONTADOR').AsInteger;
end;

procedure TfImprimir.SpeedButton2Click(Sender: TObject);
begin
  if tVisualizar.FieldByName('CONTADOR').AsInteger > StrToInt(G_Ini[G_Cont]) + 1 then
     begin
       tVisualizar.First;
       Exit;
     end;

  G_Ini.Delete(G_Cont);
  Dec(G_Cont);

  tVisualizar.Close;
  tVisualizar.ParamByName('pSORTEIO').AsInteger := StrToInt(Edit3.Text);
  tVisualizar.ParamByName('pINI').AsInteger := StrToInt(G_Ini[G_Cont]);
  tVisualizar.ParamByName('pFIM').AsInteger := G_Max;
  tVisualizar.Open;
  tVisualizar.Last;

  G_Fim := tVisualizar.FieldByName('CONTADOR').AsInteger;

  tVisualizar.First;
end;

procedure TfImprimir.SpeedButton3Click(Sender: TObject);
begin
  G_Ini.Add(IntToStr(G_Max - ((G_Max mod C_Reg) - 1)));
  Inc(G_Cont);

  tVisualizar.Close;
  tVisualizar.ParamByName('pSORTEIO').AsInteger := StrToInt(Edit3.Text);
  tVisualizar.ParamByName('pINI').AsInteger := StrToInt(G_Ini[G_Cont]);
  tVisualizar.ParamByName('pFIM').AsInteger := G_Max;
  tVisualizar.Open;
  tVisualizar.Last;

  G_Fim := tVisualizar.FieldByName('CONTADOR').AsInteger;
end;

procedure TfImprimir.SpeedButton4Click(Sender: TObject);
begin
  G_Ini.Clear;
  G_Ini.Add(IntToStr(G_Min));
  G_Cont := 0;

  tVisualizar.Close;
  tVisualizar.ParamByName('pSORTEIO').AsInteger := StrToInt(Edit3.Text);
  tVisualizar.ParamByName('pINI').AsInteger := StrToInt(G_Ini[G_Cont]);
  tVisualizar.ParamByName('pFIM').AsInteger := G_Max;
  tVisualizar.Open;
  tVisualizar.Last;

  G_Fim := tVisualizar.FieldByName('CONTADOR').AsInteger;

  tVisualizar.First;
end;

end.
