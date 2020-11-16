unit UServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp;

type
  TFormServer = class(TForm)
    ServerSocket: TServerSocket;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormServer: TFormServer;

implementation

{$R *.dfm}

procedure TFormServer.FormCreate(Sender: TObject);
begin
   ServerSocket.Port:= 10131;
   ServerSocket.Active:= True;
end;

procedure TFormServer.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ShowMessage(Socket.ReceiveText);
end;

procedure TFormServer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ServerSocket.Active:= False;
end;

end.
