unit UClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.ExtCtrls, ULogin;

type
  TFormClient = class(TForm)
    ClientSocket: TClientSocket;
    FrameLogin: TFrameLogin;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClient: TFormClient;

implementation

{$R *.dfm}

procedure TFormClient.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  FrameLogin.Free;
end;

procedure TFormClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientSocket.Active:= False;
end;

end.
