unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, IBDatabase, Data.DB, Vcl.Menus, Tlhelp32;

type
  TfMenu = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    ColorBox1: TColorBox;
    Label2: TLabel;
    BitBtn5: TBitBtn;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Fechar1: TMenuItem;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Image1: TImage;
    MainMenu1: TMainMenu;
    este1: TMenuItem;
    Ocultar1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure LiberaMemoria(pLimpar: String);
    procedure Habilita(P_Form: TForm; Bln: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnCor(Sender: TObject);
    procedure BitBtnCorFx(Sender: TObject);
    procedure BitBtnCorFxAll(Sender: TObject; P_Panel: TPanel);
    procedure BitBtnCorAll(Sender: TObject; P_Panel: TPanel);
    procedure ColorBox1Change(Sender: TObject);
    procedure SQL(var P_SQL: String; P_Num: String);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure TrayIcon1BalloonClick(Sender: TObject);
    function VerificaProcesso(ExeFileName: string): boolean;
    procedure TrayIcon1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure este1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Panel1Click(Sender: TObject);
    procedure TiraMenu;
    procedure Ocultar1Click(Sender: TObject);
    function PegaCaminho: String;
  private
    { Private declarations }
  public
    GM_Limpar : String;
    GM_CorBt, GM_CorFx : TColor;
    GM_Fixos, GM_FixosAux : Integer;
    GM_MostrarHint : Boolean;

    GM_CaminhoDB, GM_CaminhoARQUIVOS
    : String;
    { Public declarations }
  end;

var
  fMenu: TfMenu;

implementation

{$R *.dfm}

uses uGerar, uResultado, uAnalise, uImprimir, uDM, uApostas, uConcurso,
  uDadosConcurso, uAnResult;

function TfMenu.VerificaProcesso(ExeFileName: string): boolean;
const
  PROCESS_TERMINATE=$0001;
var
  L_ContinueLoop: BOOL;
  L_FSnapshotHandle: THandle;
  L_FProcessEntry32: TProcessEntry32{declarar Uses Tlhelp32};
  L_Contador : Byte;
begin
  L_Contador := 0;
  Result := false;

  L_FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  L_FProcessEntry32.dwSize := Sizeof(L_FProcessEntry32);
  L_ContinueLoop := Process32First(L_FSnapshotHandle, L_FProcessEntry32);

  while integer(L_ContinueLoop) <> 0 do
    begin
      if ((UpperCase(ExtractFileName(L_FProcessEntry32.szExeFile)) = UpperCase(ExeFileName))
       or (UpperCase(L_FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
         begin
           Inc(L_Contador);
           if L_Contador > 1 then
              begin
                Result := true;
                exit;
              end;
         end;
      L_ContinueLoop := Process32Next(L_FSnapshotHandle,L_FProcessEntry32);
    end;
  CloseHandle(L_FSnapshotHandle);
end;

procedure TfMenu.BitBtnCorAll(Sender: TObject; P_Panel: TPanel);
var
  L_Cont : Integer;
begin
  if not (Sender is TForm) then
     exit;

  for L_Cont := 0 to TForm(Sender).ComponentCount - 1 do
     begin
       if TForm(Sender).Components[L_Cont] is TBitBtn then
          begin
            if (TForm(Sender).Components[L_Cont] as TBitBtn).Parent = P_Panel then
               begin
                 TBitBtn(TForm(Sender).Components[L_Cont]).Font.Color := clWindowText;
                 TBitBtn(TForm(Sender).Components[L_Cont]).Font.Size  := 8;
                 if TBitBtn(TForm(Sender).Components[L_Cont]).Height > 25 then
                    begin
                      TBitBtn(TForm(Sender).Components[L_Cont]).Height := TBitBtn(TForm(Sender).Components[L_Cont]).Height - 2;
                      TBitBtn(TForm(Sender).Components[L_Cont]).Width  := TBitBtn(TForm(Sender).Components[L_Cont]).Width - 2;
                      TBitBtn(TForm(Sender).Components[L_Cont]).Top    := TBitBtn(TForm(Sender).Components[L_Cont]).Top + 1;
                      TBitBtn(TForm(Sender).Components[L_Cont]).Left   := TBitBtn(TForm(Sender).Components[L_Cont]).Left + 1;
                    end;
               end;
          end;
     end;
end;

procedure TfMenu.BitBtnCorFxAll(Sender: TObject; P_Panel: TPanel);
var
  L_Cont : Integer;
begin
  if not (Sender is TForm) then
     exit;

  for L_Cont := 0 to TForm(Sender).ComponentCount - 1 do
     begin
       if TForm(Sender).Components[L_Cont] is TBitBtn then
          begin
            if ((TForm(Sender).Components[L_Cont] as TBitBtn).Parent = P_Panel)
             and ((TForm(Sender).Components[L_Cont] as TBitBtn).Font.Color = GM_CorFx) then
               begin
                 TBitBtn(TForm(Sender).Components[L_Cont]).Font.Color := clWindowText;
                 TBitBtn(TForm(Sender).Components[L_Cont]).Width      := TBitBtn(TForm(Sender).Components[L_Cont]).Width - 2;
                 TBitBtn(TForm(Sender).Components[L_Cont]).Left       := TBitBtn(TForm(Sender).Components[L_Cont]).Left + 1;
                 TBitBtn(TForm(Sender).Components[L_Cont]).Height     := TBitBtn(TForm(Sender).Components[L_Cont]).Height - 2;
                 TBitBtn(TForm(Sender).Components[L_Cont]).Top        := TBitBtn(TForm(Sender).Components[L_Cont]).Top + 1;
                 TBitBtn(TForm(Sender).Components[L_Cont]).Font.Size  := 8;
               end;
          end;
     end;
end;

procedure TfMenu.ColorBox1Change(Sender: TObject);
begin
  GM_CorBt := ColorBox1.Selected;
end;

procedure TfMenu.este1Click(Sender: TObject);
var
  L_Fechar : Boolean;
begin
  L_Fechar := True;
  FormCloseQuery(Sender, L_Fechar);
end;

procedure TfMenu.BitBtnCorFx(Sender: TObject);
var
  L_BitBtn : TBitBtn;
begin
  if Sender is TBitBtn then
     begin
       L_BitBtn := TBitBtn(Sender);

       if L_BitBtn.Font.Size = 8 then
          begin
            L_BitBtn.Font.Color := GM_CorFx;
            L_BitBtn.Width      := L_BitBtn.Width + 2;
            L_BitBtn.Left       := L_BitBtn.Left - 1;
            L_BitBtn.Height     := L_BitBtn.Height + 2;
            L_BitBtn.Top        := L_BitBtn.Top - 1;
            L_BitBtn.Font.Size  := 12;
          end
       else
          begin
            L_BitBtn.Font.Color := clWindowText;
            L_BitBtn.Width      := L_BitBtn.Width - 2;
            L_BitBtn.Left       := L_BitBtn.Left + 1;
            L_BitBtn.Height     := L_BitBtn.Height - 2;
            L_BitBtn.Top        := L_BitBtn.Top + 1;
            L_BitBtn.Font.Size  := 8;
          end;
     end;
end;

procedure TfMenu.BitBtnCor(Sender: TObject);
var
  L_BitBtn : TBitBtn;
begin
  if Sender is TBitBtn then
     begin
       L_BitBtn := TBitBtn(Sender);

       if L_BitBtn.Font.Size = 8 then
          begin
            L_BitBtn.Font.Color := GM_CorBt;
            L_BitBtn.Font.Size := 10;
          end
       else
          begin
            L_BitBtn.Font.Color := clWindowText;
            L_BitBtn.Font.Size := 8;
          end;
     end;
end;

procedure TfMenu.Habilita(P_Form : TForm; Bln : Boolean);
var
  L_Aux : Integer;
begin
  L_Aux := 0;

  while P_Form.ComponentCount > L_Aux do
    begin
      if (P_Form.Components[L_Aux] is TButton) then
         begin
           TButton(P_Form.Components[L_Aux]).Enabled := Bln;
         end
      else if (P_Form.Components[L_Aux] is TBitBtn) then
         begin
           TBitBtn(P_Form.Components[L_Aux]).Enabled := Bln;
         end
      else if (P_Form.Components[L_Aux] is TSpeedButton) then
         begin
           TSpeedButton(P_Form.Components[L_Aux]).Enabled := Bln;
         end
      else if (P_Form.Components[L_Aux] is TEdit) then
         begin
           TEdit(P_Form.Components[L_Aux]).Enabled := Bln;
         end
      else if (P_Form.Components[L_Aux] is TMemo) then
         begin
           TMemo(P_Form.Components[L_Aux]).Enabled := Bln;
         end
      else if (P_Form.Components[L_Aux] is TDBGrid) then
         begin
           TDBGrid(P_Form.Components[L_Aux]).Enabled := Bln;
         end
      else if (P_Form.Components[L_Aux] is TRadioGroup) then
         begin
           TRadioGroup(P_Form.Components[L_Aux]).Enabled := Bln;
         end;
      Inc(L_Aux);
    end;
end;

procedure TfMenu.LiberaMemoria(pLimpar : String);
begin
  if pLimpar = 'fGerar' then
     begin
       fGerar.Free;
     end
  else if pLimpar = 'fImprimir' then
     begin
       fImprimir.Free;
     end
  else if pLimpar = 'fApostas' then
     begin
       fApostas.Free;
     end
  else if pLimpar = 'fConcurso' then
     begin
       fConcurso.Free;
       fResultado.Free;
       fAnalise.Free;
       fAnResult.Free;
       fDadosConcurso.Free;
     end;
end;

procedure TfMenu.Ocultar1Click(Sender: TObject);
begin
  TiraMenu;
  TrayIcon1DblClick(Self);
end;

procedure TfMenu.TiraMenu;
begin
  if fMenu.Menu <> Nil then
     fMenu.Menu := Nil
end;

procedure TfMenu.Panel1Click(Sender: TObject);
begin
  TiraMenu();
end;

procedure TfMenu.SQL(var P_SQL : String; P_Num : String);
begin
  if Pos(P_Num, P_SQL) <= 0 then
     begin
       P_SQL := P_SQL + '  AND SEQUENCIAS.SEQUENCIA LIKE ''%' + P_Num + '%''' + #13 + #10;
     end
  else
     begin
       P_SQL := StringReplace(P_SQL, ' SEQUENCIAS.SEQUENCIA LIKE ''%' + P_Num + '%''', '', ([rfReplaceAll]));
       P_SQL := StringReplace(P_SQL, '  AND' + #13 + #10, '', ([rfReplaceAll]));
     end;
end;

procedure TfMenu.TrayIcon1BalloonClick(Sender: TObject);
begin
  TrayIcon1DblClick(Self);
end;

procedure TfMenu.TrayIcon1DblClick(Sender: TObject);
begin
  if fMenu.Visible then
     fMenu.Hide
  else
     fMenu.Show;
end;

procedure TfMenu.TrayIcon1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if fMenu.Visible then
     PopupMenu1.Items[0].Caption := 'Ocult&ar'
  else
     PopupMenu1.Items[0].Caption := '&Abrir';
end;

procedure TfMenu.Abrir1Click(Sender: TObject);
begin
  TrayIcon1DblClick(Self);
end;

procedure TfMenu.BitBtn1Click(Sender: TObject);
begin
  TiraMenu();
  LiberaMemoria(GM_Limpar);
  Application.CreateForm(TfGerar, fGerar);
  GM_Limpar := 'fGerar';

  fMenu.Enabled := False;
  fGerar.Form := fMenu;
  fGerar.Show;
end;

procedure TfMenu.BitBtn2Click(Sender: TObject);
begin
  TiraMenu();

  LiberaMemoria(GM_Limpar);
  Application.CreateForm(TfResultado, fResultado);
  Application.CreateForm(TfAnalise, fAnalise);
  Application.CreateForm(TfAnResult, fAnResult);
  Application.CreateForm(TfDadosConcurso, fDadosConcurso);
  Application.CreateForm(TfConcurso, fConcurso);
  GM_Limpar := 'fConcurso';

  fMenu.Enabled := False;
  fConcurso.Form := fMenu;
  fConcurso.Show;
end;

procedure TfMenu.BitBtn4Click(Sender: TObject);
begin
  TiraMenu();
  LiberaMemoria(GM_Limpar);
  Application.CreateForm(TfImprimir, fImprimir);
  GM_Limpar := 'fImprimir';

  fMenu.Enabled := False;
  fImprimir.Form := fMenu;
  fImprimir.Show;
end;

procedure TfMenu.BitBtn5Click(Sender: TObject);
begin
  TiraMenu();
  LiberaMemoria(GM_Limpar);
  Application.CreateForm(TfApostas, fApostas);
  GM_Limpar := 'fApostas';

  fMenu.Enabled := False;
  fApostas.Form := fMenu;
  fApostas.Show;
end;

procedure TfMenu.Fechar1Click(Sender: TObject);
var
  L_Fechar : Boolean;
begin
  L_Fechar := True;
  FormCloseQuery(Sender, L_Fechar);
end;

procedure TfMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not (Sender is TMenuItem) then
     begin
       CanClose := False;
       fMenu.Hide;

       if GM_MostrarHint then
          begin
            TrayIcon1.BalloonHint := 'O Sistema foi minimizado para' + #13 + #10 +
                                     'área de notificações!' + #13 + #10 +
                                     'Para sair do sistema, clique com o botão direito' + #13 + #10 +
                                     'do mouse sobre este icone.' + #13 + #10;
            TrayIcon1.ShowBalloonHint;
            GM_MostrarHint := False;
          end;
     end
  else
     begin
       if Application.MessageBox('Deseja realmente fechar a aplicação?', 'PERGUNTA!', MB_YESNO+MB_ICONQUESTION) = 7 then
          Exit;
       TrayIcon1.Visible := False;
       fDM.DB.AllowStreamedConnected := False;
       fDM.DB.Connected := False;
       Application.Terminate;
     end;
end;

function TfMenu.PegaCaminho : String;
var
  L_Caminho : String;
begin
  L_Caminho := Application.ExeName;
  L_Caminho := StringReplace(L_Caminho,'Loteria.exe','', ([rfReplaceAll]));

  Result := L_Caminho;
end;

procedure TfMenu.FormCreate(Sender: TObject);
begin
  GM_CaminhoARQUIVOS := PegaCaminho + 'DADOS\ARQUIVOS\';
  GM_CaminhoDB := PegaCaminho + '\DADOS\LOTERIA.FDB';
  fDM.DB.Connected := False;
  fDM.DB.DatabaseName := GM_CaminhoDB;
  fDM.DB.AllowStreamedConnected := True;
  fDM.DB.Connected := True;
  fDM.Transacao.Active := True;
  GM_CorBt := clGreen;
  GM_CorFx := clRed;
  ColorBox1.Selected := GM_CorFx;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clWindowText;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clBackground;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clBtnText;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clCaptionText;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clDefault;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clInfoText;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clMenuText;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clNone;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := clBlack;
  ColorBox1.Items.Delete(ColorBox1.ItemIndex);
  ColorBox1.Selected := GM_CorBt;
  GM_MostrarHint := True;
end;

procedure TfMenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_MENU) then
     begin
       if fMenu.Menu <> Nil then
          fMenu.Menu := Nil
       else
          fMenu.Menu := MainMenu1;
     end;
end;

end.

