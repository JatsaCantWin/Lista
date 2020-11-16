program ListaClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  UClient in 'UClient.pas' {FormClient};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormClient, FormClient);
  Application.Run;
end.
