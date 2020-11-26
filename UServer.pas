unit UServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, WebView2,
  Winapi.ActiveX, Vcl.Edge;

type
  TUser = record
    Name: string;
    Ratings: array of double;
    LoggedIn: boolean;
    RatingSent: boolean;
  end;
  TFormServer = class(TForm)
    ServerSocket: TServerSocket;
    procedure DownloadRatings(ACommand: string);
    procedure SendGames(AClient: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
    Users: array of TUser;
    Games: array of string;
  public
    { Public declarations }
  end;

var
  FormServer: TFormServer;

implementation
uses
  DMMain;

{$R *.dfm}

procedure TFormServer.FormCreate(Sender: TObject);
begin
  ServerSocket.Port:= 10131;
  ServerSocket.Active:= True;
  DataModuleMain.FDQueryGames.Active:= True;
  while not DataModuleMain.FDQueryGames.Eof do
  begin
    SetLength(Games, Length(Games)+1);
    Games[High(Games)]:= DMMain.DataModuleMain.FDQueryGames.FieldByName('Name').AsString;
    DataModuleMain.FDQueryGames.Next;
  end;
  DataModuleMain.FDQueryGames.Active:= False;
  DataModuleMain.FDQueryUsers.Active:= True;
  while not DataModuleMain.FDQueryUsers.Eof do
  begin
    SetLength(Users, Length(Users)+1);
    Users[High(Users)].Name:= DMMain.DataModuleMain.FDQueryUsers.FieldByName('UserName').AsString;
    DataModuleMain.FDQueryUsers.Next;
  end;
  DataModuleMain.FDQueryUsers.Active:= False;
end;

procedure TFormServer.SendGames(AClient: TCustomWinSocket);
var
  GamesString: string;
  i: uint16;
begin
  GamesString:= '0';
  for i := 0 to High(Games) do
    GamesString:= GamesString + Games[i] + '|';
  AClient.SendText(GamesString);
end;

procedure TFormServer.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  SendGames(Socket);
end;

procedure TFormServer.DownloadRatings(ACommand: string);
var
  SeparatorPos: uint16;
  UserID: uint8;
begin
  SeparatorPos:= AnsiPos('|', ACommand);
  UserID:= StrToInt(Copy(ACommand, 1, SeparatorPos-1));
  ACommand:= Copy(ACommand, SeparatorPos+1, Length(ACommand)-SeparatorPos);
  SetLength(Users[UserId].Ratings, Length(Games));
  while ACommand<>'' do
  begin
    SeparatorPos:= AnsiPos('|', ACommand);
  end;
end;

procedure TFormServer.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Command: string;
  CommandCode: uint8;
begin
  Command:= Socket.ReceiveText;
  CommandCode:= StrToInt(Command[1]);
  Command:= Copy(Command, 2, Length(Command)-1);
  case CommandCode of
    0:
      Users[StrToInt(Command)].LoggedIn:= True;
    1:
      Users[StrToInt(Command)].LoggedIn:= False;
    2:
      DownloadRatings(Command);
  end;
end;

procedure TFormServer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ServerSocket.Active:= False;
end;

end.
