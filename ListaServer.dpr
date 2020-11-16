program ListaServer;

uses
  Vcl.Forms,
  UServer in 'UServer.pas' {FormServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormServer, FormServer);
  Application.Run;
end.
