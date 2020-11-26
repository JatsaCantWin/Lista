program ListaClient;

uses
  Vcl.Forms,
  UClient in 'UClient.pas' {FormClient},
  ULogin in 'ULogin.pas' {FrameLogin: TFrame},
  UChoice in 'UChoice.pas' {FrameChoice: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormClient, FormClient);
  Application.Run;
end.
