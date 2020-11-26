program ListaServer;

uses
  Vcl.Forms,
  DMMain in 'DMMain.pas' {DataModuleMain: TDataModule},
  UServer in 'UServer.pas' {FormServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.CreateForm(TFormServer, FormServer);
  Application.Run;
end.
