program Loteria;

uses
  Vcl.Forms,
  uGerar in 'uGerar.pas' {fGerar},
  uDM in 'uDM.pas' {fDM: TDataModule},
  uImprimir in 'uImprimir.pas' {fImprimir},
  uApostas in 'uApostas.pas' {fApostas},
  uDadosConcurso in 'uDadosConcurso.pas' {fDadosConcurso},
  uConcurso in 'uConcurso.pas' {fConcurso},
  uMenu in 'uMenu.pas' {fMenu},
  uResultado in 'uResultado.pas' {fResultado},
  uAnResult in 'uAnResult.pas' {fAnResult},
  uAnalise in 'uAnalise.pas' {fAnalise};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfDM, fDM);
  Application.CreateForm(TfMenu, fMenu);
  Application.CreateForm(TfAnalise, fAnalise);
  if not (uMenu.fMenu.VerificaProcesso('Loteria.exe')) then
     Application.Run
  else
     begin
       Application.MessageBox(PChar('Processo já se encontra em execução!' + #13 + #10 +
                                    'Verifique a área de notificações.   '), 'ATENÇÃO', 48);
       Application.Terminate;
     end;
end.
