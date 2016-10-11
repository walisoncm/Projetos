unit uResultado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  IBCustomDataSet, IBQuery, IBDatabase, Vcl.Grids, Vcl.DBGrids, IBSQL, frxClass,
  frxDBSet, Vcl.Buttons, frxPreview, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppDesignLayer, ppParameter, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TfResultado = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn100: TBitBtn;
    BitBtn99: TBitBtn;
    BitBtn98: TBitBtn;
    BitBtn97: TBitBtn;
    BitBtn96: TBitBtn;
    BitBtn95: TBitBtn;
    BitBtn93: TBitBtn;
    BitBtn94: TBitBtn;
    BitBtn92: TBitBtn;
    BitBtn91: TBitBtn;
    BitBtn90: TBitBtn;
    BitBtn89: TBitBtn;
    BitBtn88: TBitBtn;
    BitBtn87: TBitBtn;
    BitBtn86: TBitBtn;
    BitBtn85: TBitBtn;
    BitBtn83: TBitBtn;
    BitBtn84: TBitBtn;
    BitBtn82: TBitBtn;
    BitBtn81: TBitBtn;
    BitBtn80: TBitBtn;
    BitBtn79: TBitBtn;
    BitBtn78: TBitBtn;
    BitBtn77: TBitBtn;
    BitBtn76: TBitBtn;
    BitBtn75: TBitBtn;
    BitBtn73: TBitBtn;
    BitBtn74: TBitBtn;
    BitBtn72: TBitBtn;
    BitBtn71: TBitBtn;
    BitBtn70: TBitBtn;
    BitBtn69: TBitBtn;
    BitBtn68: TBitBtn;
    BitBtn67: TBitBtn;
    BitBtn66: TBitBtn;
    BitBtn65: TBitBtn;
    BitBtn63: TBitBtn;
    BitBtn64: TBitBtn;
    BitBtn62: TBitBtn;
    BitBtn61: TBitBtn;
    BitBtn50: TBitBtn;
    BitBtn49: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn54: TBitBtn;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    Label3: TLabel;
    Button101: TButton;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    Edit3: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    ProgressBar1: TProgressBar;
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button101Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    Form : TForm;
    G_SQL, G_Num : String;
    G_Contador : Integer;
    G_Lista : TStringList;
    { Public declarations }
  end;

var
  fResultado: TfResultado;

const
  C_SQL = 'INSERT INTO ACERTOS' + #13 + #10 +
          'SELECT SEQUENCIAS.NUMSORTEIO,' + #13 + #10 +
          '       SEQUENCIAS.SORTEIO,' + #13 + #10 +
          '       #CONTAGEM AS ACERTO,' + #13 + #10 +
          '       LPAD(SEQUENCIAS.CONTADOR, 8, 0) AS CONTADOR,' + #13 + #10 +
          '       SEQUENCIAS.SEQUENCIA' + #13 + #10 +
          'FROM SEQUENCIAS' + #13 + #10 +
          'WHERE SEQUENCIAS.NUMSORTEIO = #SORTEIO' + #13 + #10 +
          '  AND SEQUENCIAS.SORTEIO = #NUMBOLAO' + #13 + #10 +
          '  AND SEQUENCIAS.SEL = ''*''' + #13 + #10;
  C_Contador = 9;

implementation

{$R *.dfm}

uses uDM, uMenu;

procedure TfResultado.Button101Click(Sender: TObject);
var
  L_Aux, L_SQL
  : String;

  L_Cont13, L_Cont12,
  L_Cont11, L_Cont10
  : Integer;

  L_Acertos
  : Integer;

  L_Contador,
  L_Progresso,
  L_Continua
  : Integer;

  L_Max,
  L_Aux2,
  L_Bar
  : Int64;
begin
  if G_Num = '' then
     begin
       Application.MessageBox('Informe os NÚMEROS antes de consultar!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
       BitBtn1.SetFocus;
       Exit;
     end;

  if Edit3.Text = '' then
     begin
       Application.MessageBox('Informe o CONCURSO antes de consultar!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
       Edit3.SetFocus;
       Exit;
     end;

  fDM.qrVerifica.Close;
  fDM.qrVerifica.SQL.Clear;
  fDM.qrVerifica.SQL.Add('SELECT * FROM SEQUENCIAS');
  fDM.qrVerifica.SQL.Add('WHERE NUMSORTEIO = :pSORTEIO');
  fDM.qrVerifica.SQL.Add('  AND SORTEIO = :pNUMBOLAO');
  fDM.qrVerifica.ParamByName('pSORTEIO').AsInteger  := StrToInt(Edit3.Text);
  fDM.qrVerifica.ParamByName('pNUMBOLAO').AsInteger := StrToInt(Edit1.Text);
  fDM.qrVerifica.Open;

  if (fDM.qrVerifica.Bof) and (fDM.qrVerifica.Eof) then
     begin
       Application.MessageBox('Bolão informado não foi realizado no sistema!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
       Edit3.SetFocus;
       Exit;
     end;

  fMenu.Habilita(fResultado, False);

  IBSQL2.Close;
  IBSQL2.SQL.Clear;
  IBSQL2.SQL.Add('DELETE FROM ACERTOS WHERE ACERTOS.SORTEIO = ' + Edit1.Text + ' AND ACERTOS.NUMSORTEIO = ' + Edit3.Text);
  IBSQL2.ExecQuery;

  IBSQL2.Close;
  IBSQL2.SQL.Clear;
  IBSQL2.SQL.Add('UPDATE SORTEIOS SET SORTEIOS.RESULTADO = :pRESULTADO,');
  IBSQL2.SQL.Add('                    SORTEIOS.DTRESULTADO = :pDTRESULTADO');
  IBSQL2.SQL.Add('WHERE SORTEIOS.NUMBOLAO = ' + Edit1.Text);
  IBSQL2.SQL.Add('  AND SORTEIOS.SORTEIO = ' + Edit3.Text);
  IBSQL2.SQL.Add('  AND SORTEIOS.CONTADOR = 0');
  IBSQL2.ParamByName('pRESULTADO').AsString     := G_Num;
  IBSQL2.ParamByName('pDTRESULTADO').AsDateTime := Now;
  IBSQL2.ExecQuery;

  G_SQL := StringReplace(G_SQL, '#SORTEIO', Edit3.Text, ([rfReplaceAll]));
  G_SQL := StringReplace(G_SQL, '#NUMBOLAO', Edit1.Text, ([rfReplaceAll]));

  Label3.Caption := 'Conferindo resultado...';
  Label3.Update;

  G_Lista.Text := G_SQL;

  L_Contador := G_Contador;
  L_Acertos := G_Contador - C_Contador;

  L_Progresso := 0;
  L_Max := 1;
  L_Bar := 0;

  ProgressBar1.Visible := True;
  ProgressBar1.Min := L_Progresso;

  L_Continua := 1;

  while L_Contador > C_Contador do
    begin
      L_Cont13 := L_Contador - 1;
      Inc(L_Bar);
      while L_Cont13 > C_Contador do
        begin
          L_Cont12 := L_Cont13 - 1;
          Inc(L_Bar);
          while L_Cont12 > C_Contador do
            begin
              L_Cont11 := L_Cont12 - 1;
              Inc(L_Bar);
              while L_Cont11 > C_Contador do
                begin
                  L_Cont10 := L_Cont11 - 1;
                  Inc(L_Bar);
                  while L_Cont10 > C_Contador do
                    begin
                      Inc(L_Bar);
                      Dec(L_Cont10);
                    end;
                  Dec(L_Cont11);
                end;
              Dec(L_Cont12);
            end;
          Dec(L_Cont13);
        end;
      Dec(L_Contador);
    end;
  ProgressBar1.Max := L_Bar;

  L_Contador := G_Contador;

  IBSQL1.Close;
  IBSQL1.SQL.Clear;
  IBSQL1.SQL.Add(StringReplace(G_SQL, '#CONTAGEM', IntToStr(L_Acertos), ([rfReplaceAll])));
  IBSQL1.ExecQuery;

  Dec(L_Acertos);
  while L_Contador > C_Contador do
    begin
      IBSQL1.Close;
      IBSQL1.SQL.Clear;

      L_Aux := StringReplace(G_Lista.Strings[L_Contador],'LIKE','NOT LIKE',([rfReplaceAll]));
      L_SQL := StringReplace(StringReplace(G_SQL, '#CONTAGEM', IntToStr(L_Acertos), ([rfReplaceAll])),G_Lista.Strings[L_Contador],L_Aux,([rfReplaceAll]));

      IBSQL1.SQL.Add(L_SQL);
      IBSQL1.ExecQuery;

      L_Cont13 := L_Contador - 1;
      Dec(L_Acertos);

      Inc(L_Progresso);
      ProgressBar1.Position := L_Progresso;
      ProgressBar1.Update;
      Application.ProcessMessages;

      if L_Acertos <= 0 then
         begin
           Inc(L_Acertos);
           Dec(L_Contador);
           Continue;
         end;


      while L_Cont13 > C_Contador do
        begin
          IBSQL1.Close;
          IBSQL1.SQL.Clear;

          L_Aux := StringReplace(G_Lista.Strings[L_Cont13],'LIKE','NOT LIKE',([rfReplaceAll]));
          L_SQL := StringReplace(StringReplace(G_SQL, '#CONTAGEM', IntToStr(L_Acertos), ([rfReplaceAll])),G_Lista.Strings[L_Cont13],L_Aux,([rfReplaceAll]));

          L_Aux := StringReplace(G_Lista.Strings[L_Contador],'LIKE','NOT LIKE',([rfReplaceAll]));
          L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Contador],L_Aux,([rfReplaceAll]));

          IBSQL1.SQL.Add(L_SQL);
          IBSQL1.ExecQuery;

          L_Cont12 := L_Cont13 - 1;
          Dec(L_Acertos);

          Inc(L_Progresso);
          ProgressBar1.Position := L_Progresso;
          ProgressBar1.Update;
          Application.ProcessMessages;

          if L_Acertos <= 0 then
             begin
               Inc(L_Acertos);
               Dec(L_Cont13);
               Continue;
             end;

          while L_Cont12 > C_Contador do
            begin
              IBSQL1.Close;
              IBSQL1.SQL.Clear;

              L_Aux:= StringReplace(G_Lista.Strings[L_Cont12],'LIKE','NOT LIKE',([rfReplaceAll]));
              L_SQL := StringReplace(StringReplace(G_SQL, '#CONTAGEM', IntToStr(L_Acertos), ([rfReplaceAll])),G_Lista.Strings[L_Cont12],L_Aux,([rfReplaceAll]));

              L_Aux := StringReplace(G_Lista.Strings[L_Cont13],'LIKE','NOT LIKE',([rfReplaceAll]));
              L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Cont13],L_Aux,([rfReplaceAll]));

              L_Aux := StringReplace(G_Lista.Strings[L_Contador],'LIKE','NOT LIKE',([rfReplaceAll]));
              L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Contador],L_Aux,([rfReplaceAll]));

              IBSQL1.SQL.Add(L_SQL);
              IBSQL1.ExecQuery;

              L_Cont11 := L_Cont12 - 1;
              Dec(L_Acertos);

              Inc(L_Progresso);
              ProgressBar1.Position := L_Progresso;
              ProgressBar1.Update;
              Application.ProcessMessages;

              if L_Acertos <= 0 then
                 begin
                   Inc(L_Acertos);
                   Dec(L_Cont12);
                   Continue;
                 end;

              while L_Cont11 > C_Contador do
                begin
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;

                  L_Aux := StringReplace(G_Lista.Strings[L_Cont11],'LIKE','NOT LIKE',([rfReplaceAll]));
                  L_SQL := StringReplace(StringReplace(G_SQL, '#CONTAGEM', IntToStr(L_Acertos), ([rfReplaceAll])),G_Lista.Strings[L_Cont11],L_Aux,([rfReplaceAll]));

                  L_Aux := StringReplace(G_Lista.Strings[L_Cont12],'LIKE','NOT LIKE',([rfReplaceAll]));
                  L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Cont12],L_Aux,([rfReplaceAll]));

                  L_Aux := StringReplace(G_Lista.Strings[L_Cont13],'LIKE','NOT LIKE',([rfReplaceAll]));
                  L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Cont13],L_Aux,([rfReplaceAll]));

                  L_Aux := StringReplace(G_Lista.Strings[L_Contador],'LIKE','NOT LIKE',([rfReplaceAll]));
                  L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Contador],L_Aux,([rfReplaceAll]));

                  IBSQL1.SQL.Add(L_SQL);
                  IBSQL1.ExecQuery;

                  L_Cont10 := L_Cont11 - 1;
                  Dec(L_Acertos);

                  Inc(L_Progresso);
                  ProgressBar1.Position := L_Progresso;
                  ProgressBar1.Update;
                  Application.ProcessMessages;

                  if L_Acertos <= 0 then
                     begin
                       Inc(L_Acertos);
                       Dec(L_Cont11);
                       Continue;
                     end;

                  while L_Cont10 > C_Contador do
                    begin
                      IBSQL1.Close;
                      IBSQL1.SQL.Clear;

                      L_Aux := StringReplace(G_Lista.Strings[L_Cont10],'LIKE','NOT LIKE',([rfReplaceAll]));
                      L_SQL := StringReplace(StringReplace(G_SQL, '#CONTAGEM', IntToStr(L_Acertos), ([rfReplaceAll])),G_Lista.Strings[L_Cont10],L_Aux,([rfReplaceAll]));

                      L_Aux := StringReplace(G_Lista.Strings[L_Cont11],'LIKE','NOT LIKE',([rfReplaceAll]));
                      L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Cont11],L_Aux,([rfReplaceAll]));

                      L_Aux := StringReplace(G_Lista.Strings[L_Cont12],'LIKE','NOT LIKE',([rfReplaceAll]));
                      L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Cont12],L_Aux,([rfReplaceAll]));

                      L_Aux := StringReplace(G_Lista.Strings[L_Cont13],'LIKE','NOT LIKE',([rfReplaceAll]));
                      L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Cont13],L_Aux,([rfReplaceAll]));

                      L_Aux := StringReplace(G_Lista.Strings[L_Contador],'LIKE','NOT LIKE',([rfReplaceAll]));
                      L_SQL := StringReplace(L_SQL,G_Lista.Strings[L_Contador],L_Aux,([rfReplaceAll]));

                      IBSQL1.SQL.Add(L_SQL);
                      IBSQL1.ExecQuery;

                      Dec(L_Cont10);

                      Inc(L_Progresso);
                      ProgressBar1.Position := L_Progresso;
                      ProgressBar1.Update;
                      Application.ProcessMessages;
                    end;
                  Inc(L_Acertos);
                  Dec(L_Cont11);
                end;
              Inc(L_Acertos);
              Dec(L_Cont12);
            end;
          Inc(L_Acertos);
          Dec(L_Cont13);
        end;
      Inc(L_Acertos);
      Dec(L_Contador);
    end;
  fDM.Transacao.CommitRetaining;

  ProgressBar1.Visible := False;

  Label3.Caption := '';
  Label3.Update;

  fMenu.Habilita(fResultado, True);

  Application.MessageBox('Concluído com Sucesso!', 'SUCESSO', MB_OK + MB_ICONINFORMATION);
end;

procedure TfResultado.Button1Click(Sender: TObject);
begin
  if not (Sender is TBitBtn) then
     Exit;

  if Pos(TBitBtn(Sender).Caption, G_Num) > 0 then
     begin
       G_Num := StringReplace(G_Num, TBitBtn(Sender).Caption + '; ', '', ([rfReplaceAll]));
       Dec(G_Contador);
     end
  else
     begin
       G_Num := G_Num + TBitBtn(Sender).Caption + '; ';
       Inc(G_Contador);
     end;

  fMenu.SQL(G_SQL, TBitBtn(Sender).Caption);
  fMenu.BitBtnCor(Sender);
end;

procedure TfResultado.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48.. #57, #8]) then
     Key := #0;
end;

procedure TfResultado.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Button101.Enabled;

  if CanClose then
     Form.Enabled := True;
end;

procedure TfResultado.FormCreate(Sender: TObject);
begin
  Label3.Caption := '';
  Edit1.Text := '';
  Edit3.Text := '';
  G_Num := '';
  G_SQL := C_SQL;
  G_Contador := C_Contador;
  G_Lista := TStringList.Create;
end;

procedure TfResultado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_ESCAPE) then
     fResultado.Close;
end;

procedure TfResultado.SpeedButton1Click(Sender: TObject);
begin
  G_Num := '';
  G_SQL := C_SQL;
  G_Contador := C_Contador;
  fMenu.BitBtnCorAll(fResultado, Panel1);
end;

end.
