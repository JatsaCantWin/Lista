program ListaServer;

uses
  System.StartUpCopy,
  FMX.Forms,
  UServer in 'UServer.pas' {FormServer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormServer, FormServer);
  Application.Run;
end.
