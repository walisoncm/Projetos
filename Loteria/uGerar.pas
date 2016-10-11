unit uGerar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.DB, IBCustomDataSet, IBDatabase, IBQuery, Vcl.Buttons,
  IBSQL;

type
  TfGerar = class(TForm)
    Panel2: TPanel;
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
    Edit2: TEdit;
    Label1: TLabel;
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
    Label2: TLabel;
    Label3: TLabel;
    qrULTIMO: TIBQuery;
    BtGerar: TBitBtn;
    IBInsert: TIBSQL;
    IBApaga: TIBSQL;
    Edit1: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    BtCancelar: TBitBtn;
    BtPause: TBitBtn;
    BtContinue: TBitBtn;
    SpButLimpaNum: TSpeedButton;
    SpButLimbaBanco: TSpeedButton;
    Label6: TLabel;
    Edit4: TEdit;
    IBUpdate: TIBSQL;
    procedure FormCreate(Sender: TObject);
    procedure Limpa(P_Form: TForm);
    procedure BtGerarClick(Sender: TObject);
    procedure ButLimpaBancoClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtPauseClick(Sender: TObject);
    procedure BtContinueClick(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);

    function SalvaSequencia(P_Texto: TStrings): TStrings;
    function Altera1(P_Texto : TStrings) : TStrings;
    function Altera2(P_Texto : TStrings) : TStrings;
    function Altera3(P_Texto : TStrings) : TStrings;
    function Altera4(P_Texto : TStrings) : TStrings;
    function Altera5(P_Texto : TStrings) : TStrings;
    function Altera6(P_Texto : TStrings) : TStrings;
    function Altera7(P_Texto : TStrings) : TStrings;
    function Altera8(P_Texto : TStrings) : TStrings;
    function Altera9(P_Texto : TStrings) : TStrings;
    function Altera10(P_Texto : TStrings) : TStrings;
    function Altera11(P_Texto : TStrings) : TStrings;
    function Altera12(P_Texto : TStrings) : TStrings;
    function Altera13(P_Texto : TStrings) : TStrings;
    function Altera14(P_Texto : TStrings) : TStrings;
    function Altera15(P_Texto : TStrings) : TStrings;
    function Altera16(P_Texto : TStrings) : TStrings;
    function Altera17(P_Texto : TStrings) : TStrings;
    function Altera18(P_Texto : TStrings) : TStrings;
    function Altera19(P_Texto : TStrings) : TStrings;
    function Altera20(P_Texto : TStrings) : TStrings;
    function Altera21(P_Texto : TStrings) : TStrings;
    function Altera22(P_Texto : TStrings) : TStrings;
    function Altera23(P_Texto : TStrings) : TStrings;
    function Altera24(P_Texto : TStrings) : TStrings;
    function Altera25(P_Texto : TStrings) : TStrings;
    function Altera26(P_Texto : TStrings) : TStrings;
    function Altera27(P_Texto : TStrings) : TStrings;
    function Altera28(P_Texto : TStrings) : TStrings;
    function Altera29(P_Texto : TStrings) : TStrings;
    function Altera30(P_Texto : TStrings) : TStrings;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpButLimpaNumClick(Sender: TObject);
    procedure SpButLimbaBancoClick(Sender: TObject);
    procedure BitBtnOnClick(Sender: TObject);
    procedure BitBtnEnter(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    Form : TForm;
    G_Sorteio  : DWORD;
    G_Contador : DWORD;
    G_Parar : Boolean;
    G_Pause : Boolean;
    G_Perguntar : Boolean;
    G_Num, G_NumFx : String;
    { Public declarations }
  end;

var
  fGerar: TfGerar;

implementation

{$R *.dfm}

uses uDM, uMenu;

function TfGerar.SalvaSequencia(P_Texto : TStrings) : TStrings;
var
  I : Integer;
  L_Sequencia : String;
begin
  I := 0;
  L_Sequencia := G_NumFx;
  while StrToInt(Edit2.Text) - fMenu.GM_Fixos > I do
    begin
      if L_Sequencia = '' then
         L_Sequencia := P_Texto[I]
      else
         L_Sequencia := L_Sequencia + ';' + P_Texto[I];

      Application.ProcessMessages;

      if G_Parar then
         Exit;

      Inc(I);
    end;

  Inc(G_Contador);

  Label3.Caption := 'Nº de Sequências: ' + FormatFloat('###,###,###,##0', G_Contador);
//  Label3.Update;

  IBInsert.Close;
  IBInsert.ParamByName('pSORTEIO').AsInteger    := G_Sorteio;
  IBInsert.ParamByName('pNUMSORTEIO').AsInteger := StrToInt(Edit3.Text);
  IBInsert.ParamByName('pCONTADOR').AsInteger   := G_Contador;
  IBInsert.ParamByName('pSEQUENCIA').AsString   := L_Sequencia;
  IBInsert.ExecQuery;
end;

procedure TfGerar.SpButLimpaNumClick(Sender: TObject);
begin
  G_Num := '';
  G_NumFx := '';
  fMenu.BitBtnCorAll(fGerar, Panel1);
end;

procedure TfGerar.SpButLimbaBancoClick(Sender: TObject);
var
  L_Contador : Integer;
begin
  qrULTIMO.Close;
  qrULTIMO.SQL.Clear;
  qrULTIMO.SQL.Add('SELECT MAX(SORTEIOS.CONTADOR)');
  qrULTIMO.SQL.Add('FROM SORTEIOS');
  qrULTIMO.Open;

  L_Contador := qrULTIMO.FieldByName('MAX').AsInteger + 1;

  IBUpdate.Close;
  IBUpdate.SQL.Clear;
  IBUpdate.SQL.Add('UPDATE SORTEIOS SET DELETADO = ''S'', CONTADOR = :pCONTADOR, DTDELETADO = :pDTDELETADO WHERE DELETADO = ''N''');
  IBUpdate.ParamByName('pCONTADOR').AsInteger    := L_Contador;
  IBUpdate.ParamByName('pDTDELETADO').AsDateTime := Now;
  IBUpdate.ExecQuery;

  IBApaga.Close;
  IBApaga.SQL.Clear;
  IBApaga.SQL.Add('DELETE FROM SEQUENCIAS');
  IBApaga.ExecQuery;

  IBApaga.Close;
  IBApaga.SQL.Clear;
  IBApaga.SQL.Add('DELETE FROM ACERTOS');
  IBApaga.ExecQuery;

  fDM.Transacao.CommitRetaining;

  Label3.Caption := '';

  Application.MessageBox('Efetuado com Sucesso!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
end;

function TfGerar.Altera1(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      SalvaSequencia(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 1);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera2(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera1(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 2);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera3(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera2(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 3);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera4(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera3(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 4);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera5(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera4(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 5);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera6(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera5(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 6);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera7(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera6(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 7);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera8(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera7(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 8);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera9(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera8(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 9);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera10(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera9(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 10);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera11(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera10(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 11);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera12(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera11(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 12);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera13(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera12(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 13);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera14(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera13(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 14);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera15(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera14(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 15);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera16(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera15(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 16);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera17(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera16(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 17);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera18(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera17(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 18);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera19(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera18(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 19);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera20(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera19(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 20);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera21(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera20(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 21);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera22(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera21(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 22);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera23(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera22(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 23);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera24(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera23(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 24);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera25(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera24(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 25);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera26(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera25(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 26);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera27(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera26(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 27);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera28(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera27(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 28);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera29(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera28(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 29);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

function TfGerar.Altera30(P_Texto : TStrings) : TStrings;
var
  L_Retorno : TStrings;
begin
  L_Retorno := TStringList.Create;
  L_Retorno.Text := P_Texto.Text;

  while L_Retorno.Count >= StrToInt(Edit2.Text) - fMenu.GM_Fixos do
    begin
      Altera29(L_Retorno);

      L_Retorno.Delete(StrToInt(Edit2.Text) - fMenu.GM_Fixos - 30);

      if G_Parar then
         Exit;
    end;

  L_Retorno.Free;
  L_Retorno := Nil;
end;

procedure TfGerar.Limpa(P_Form : TForm);
var
  L_Aux : Integer;
begin
  L_Aux := 0;
  while P_Form.ComponentCount > L_Aux do
    begin
      if (P_Form.Components[L_Aux] is TEdit) then
         begin
           TEdit(P_Form.Components[L_Aux]).Text := '';
         end
      else if (P_Form.Components[L_Aux] is TMemo) then
         begin
           TMemo(P_Form.Components[L_Aux]).Text := '';
         end;
      Inc(L_Aux);
    end;
end;

procedure TfGerar.BtPauseClick(Sender: TObject);
begin
  G_Pause := True;
  BtPause.Visible := False;
  BtContinue.Visible := True;
  BtContinue.Enabled := True;
  while G_Pause do
    begin
      if G_Parar then
         Exit;

      Application.ProcessMessages;
    end;
end;

procedure TfGerar.BtContinueClick(Sender: TObject);
begin
  G_Pause := False;
  BtContinue.Visible := False;
  BtPause.Visible := True;
  BtPause.Enabled := True;
end;

procedure TfGerar.BtCancelarClick(Sender: TObject);
begin
  fDM.Transacao.RollbackRetaining;
  G_Parar := True;
  Label3.Caption := '';
end;

procedure TfGerar.BtGerarClick(Sender: TObject);
var
  L_TextoLST : TStrings;
begin
  G_Parar := False;
  if G_Num = '' then
     begin
       Application.MessageBox('Informe os NÚMEROS antes de Gerar!', 'ATENÇÃO!', MB_OK + MB_ICONINFORMATION);
       BitBtn1.SetFocus;
       Exit;
     end;

  if Edit2.Text = '' then
     begin
       Application.MessageBox('Informe o TAM. SEQUÊNCIA antes de Gerar!', 'ATENÇÃO!', MB_OK + MB_ICONINFORMATION);
       Edit2.SetFocus;
       Exit;
     end;

  if Edit3.Text = '' then
     begin
       Application.MessageBox('Informe o CONCURSO antes de Gerar!', 'ATENÇÃO!', MB_OK + MB_ICONINFORMATION);
       Edit3.SetFocus;
       Exit;
     end;

  if StrToInt(Edit2.Text) <= 1 then
     begin
       Application.MessageBox('Digite um TAM. SEQUÊNCIA válido!', 'ATENÇÃO!', MB_OK + MB_ICONINFORMATION);
       Edit2.SetFocus;
       Exit;
     end;

  L_TextoLST := TStringList.Create;

  L_TextoLST.Delimiter       := ';';
  L_TextoLST.StrictDelimiter := False;
  L_TextoLST.DelimitedText   := StringReplace(G_Num, ' ', '', ([rfReplaceAll]));

  if L_TextoLST.Count <= StrToInt(Edit2.Text) - fMenu.GM_Fixos then
     begin
       Application.MessageBox('O TAM. SEQUÊNCIA deve ser menor que a quantidade de números não fixos!', 'ATENÇÃO!', MB_OK + MB_ICONINFORMATION);
       Edit2.SetFocus;
       Exit;
     end;

  Label3.Caption := 'Aguarde...';
  Label3.Update;

  fMenu.Habilita(fGerar, False);
  BtGerar.Visible := False;

  BtPause.Visible := True;
  BtPause.Enabled := True;
  BtCancelar.Visible := True;
  BtCancelar.Enabled := True;
  BtCancelar.SetFocus;

  qrULTIMO.Close;
  qrULTIMO.SQL.Clear;
  qrULTIMO.SQL.Add('SELECT MAX(SORTEIOS.NUMBOLAO)');
  qrULTIMO.SQL.Add('FROM SORTEIOS');
  qrULTIMO.SQL.Add('WHERE SORTEIOS.SORTEIO = ' + Edit3.Text);
  qrULTIMO.SQL.Add('  AND SORTEIOS.DELETADO = ''N''');
  qrULTIMO.Open;

  G_Sorteio := qrULTIMO.FieldByName('MAX').AsInteger + 1;

  IBInsert.Close;
  IBInsert.SQL.Clear;
  IBInsert.SQL.Add('insert into SORTEIOS');
  IBInsert.SQL.Add('  (CONTADOR, DTBOLAO, NUMBOLAO, DELETADO, FIXOS, SORTEIO, VARIAVEIS)');
  IBInsert.SQL.Add('values');
  IBInsert.SQL.Add('  (''0'', :pDTBOLAO, :pNUMBOLAO, ''N'', :pFIXOS, :pSORTEIO, :pVARIAVEIS)');
  IBInsert.ParamByName('pDTBOLAO').AsDateTime := Now;
  IBInsert.ParamByName('pNUMBOLAO').AsInteger := G_Sorteio;
  IBInsert.ParamByName('pFIXOS').AsString     := G_NumFx;
  IBInsert.ParamByName('pSORTEIO').AsInteger  := StrToInt(Edit3.Text);
  IBInsert.ParamByName('pVARIAVEIS').AsString := G_Num;
  IBInsert.ExecQuery;

  Edit1.Text := IntToStr(G_Sorteio);
  G_Contador := 0;

  IBInsert.Close;
  IBInsert.SQL.Clear;
  IBInsert.SQL.Add('insert into SEQUENCIAS');
  IBInsert.SQL.Add('  (SORTEIO, NUMSORTEIO, CONTADOR, SEQUENCIA, SEL)');
  IBInsert.SQL.Add('values');
  IBInsert.SQL.Add('  (:pSORTEIO, :pNUMSORTEIO, :pCONTADOR, :pSEQUENCIA, ''*'')');

  G_Num   := StringReplace(G_Num, ' ', '', ([rfReplaceAll]));
  G_NumFx := StringReplace(G_NumFx, ' ', '', ([rfReplaceAll]));

  case StrToInt(Edit2.Text) - fMenu.GM_Fixos of
    2 : Altera2(L_TextoLST);
    3 : Altera3(L_TextoLST);
    4 : Altera4(L_TextoLST);
    5 : Altera5(L_TextoLST);
    6 : Altera6(L_TextoLST);
    7 : Altera7(L_TextoLST);
    8 : Altera8(L_TextoLST);
    9 : Altera9(L_TextoLST);
    10: Altera10(L_TextoLST);
    11: Altera11(L_TextoLST);
    12: Altera12(L_TextoLST);
    13: Altera13(L_TextoLST);
    14: Altera14(L_TextoLST);
    15: Altera15(L_TextoLST);
    16: Altera16(L_TextoLST);
    17: Altera17(L_TextoLST);
    18: Altera18(L_TextoLST);
    19: Altera19(L_TextoLST);
    20: Altera20(L_TextoLST);
    21: Altera21(L_TextoLST);
    22: Altera22(L_TextoLST);
    23: Altera23(L_TextoLST);
    24: Altera24(L_TextoLST);
    25: Altera25(L_TextoLST);
    26: Altera26(L_TextoLST);
    27: Altera27(L_TextoLST);
    28: Altera28(L_TextoLST);
    29: Altera29(L_TextoLST);
    30: Altera30(L_TextoLST);
  else
     begin
       fMenu.Habilita(fGerar, True);

       BtGerar.Visible := True;
       BtCancelar.Visible := False;
       BtPause.Visible := False;
       BtContinue.Visible := False;

       Label3.Caption := '';
       Label3.Update;

       Application.MessageBox('O sitema atualmente, gera somente sequências de até 30 números!', 'ATENÇÃO!', MB_OK + MB_ICONINFORMATION);

       Edit2.SetFocus;
       Exit;
     end;
  end;

  BtGerar.Visible := True;
  BtCancelar.Visible := False;
  BtPause.Visible := False;
  BtContinue.Visible := False;

  if G_Parar then
     fDM.Transacao.RollbackRetaining
  else
     fDM.Transacao.CommitRetaining;

  L_TextoLST := Nil;
  L_TextoLST.Free;

  fMenu.Habilita(fGerar, True);
  BtGerar.SetFocus;
end;

procedure TfGerar.ButLimpaBancoClick(Sender: TObject);
begin
  IBApaga.Close;
  IBApaga.SQL.Clear;
  IBApaga.SQL.Add('DELETE FROM SEQUENCIAS');
  IBApaga.ExecQuery;

  fDM.Transacao.CommitRetaining;

  Label3.Caption := '';

  Application.MessageBox('Efetuado com Sucesso!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
end;

procedure TfGerar.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#48.. #57, #8]) then
     Key := #0;
end;

procedure TfGerar.Edit4Exit(Sender: TObject);
begin
  fMenu.GM_Fixos := StrToInt(Edit4.Text);
  fMenu.GM_FixosAux := fMenu.GM_Fixos;
  G_NumFx := '';
  fMenu.BitBtnCorFxAll(fGerar, Panel1);
end;

procedure TfGerar.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := BtGerar.Visible;

  if CanClose then
     Form.Enabled := True;
end;

procedure TfGerar.FormCreate(Sender: TObject);
begin
  Limpa(fGerar);
  Label3.Caption := '';
  fMenu.GM_Fixos := 0;
  fMenu.GM_FixosAux := 0;
  G_Perguntar := True;
  Edit4.Text := '0';
end;

procedure TfGerar.BitBtnEnter(Sender: TObject);
begin
 { if StrToIntDef(Edit4.Text, 0) = 0 then
     begin
       if G_Perguntar then
          begin
            if Application.MessageBox('Qtde Fixos é igual a zero! Deseja continuar?', 'PERGUNTA', MB_YESNO + MB_ICONQUESTION) = 7 then
               begin
                 Edit4.SetFocus;
                 Exit;
               end;
            G_Perguntar := False;
          end;
     end;}
end;

procedure TfGerar.BitBtnOnClick(Sender: TObject);
begin
  if (fMenu.GM_FixosAux > 0)
   and (TButton(Sender).Font.Color <> fMenu.GM_CorBt) then
     begin
       if Pos(TButton(Sender).Caption, G_NumFx) > 0 then
          begin
            if Length(G_NumFx) <= 3 then
               G_NumFx := ''
            else
               G_NumFx := StringReplace(G_NumFx, '; ' + TButton(Sender).Caption, '', [(rfReplaceAll)]);
          end
       else
          if G_NumFx = '' then
             G_NumFx := TButton(Sender).Caption
          else
             G_NumFx := G_NumFx + '; ' + TButton(Sender).Caption;
     end
  else if (TBitBtn(Sender).Font.Color <> fMenu.GM_CorFx) then
     begin
       if (Pos(TButton(Sender).Caption, G_Num) > 0) then
          begin
            if Length(G_Num) <= 3 then
               G_Num := ''
            else
               G_Num := StringReplace(G_Num, '; ' + TButton(Sender).Caption, '', [(rfReplaceAll)]);
          end
       else
          if G_Num = '' then
             G_Num := TButton(Sender).Caption
          else
             G_Num := G_Num + '; ' + TButton(Sender).Caption;
     end;

  if TBitBtn(Sender).Font.Color = fMenu.GM_CorFx then
     begin
       fMenu.BitBtnCorFx(Sender);
       Inc(fMenu.GM_FixosAux);
     end
  else if (fMenu.GM_FixosAux > 0)
   and (TBitBtn(Sender).Font.Color <> fMenu.GM_CorBt) then
     begin
       fMenu.BitBtnCorFx(Sender);
       Dec(fMenu.GM_FixosAux);
     end
  else
     fMenu.BitBtnCor(Sender);
end;

procedure TfGerar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_ESCAPE) then
     fGerar.Close;
end;

end.
