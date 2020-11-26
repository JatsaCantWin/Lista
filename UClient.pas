unit UClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.ExtCtrls, ULogin, UChoice, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Data.Bind.Components;

type
  TFormClient = class(TForm)
    ClientSocket: TClientSocket;
    FrameLogin: TFrameLogin;
    FrameChoice: TFrameChoice;
    procedure DownloadGames(ACommand: string);
    procedure SendRating;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
    const ClientID = '0';
  public
    { Public declarations }
  end;

var
  FormClient: TFormClient;

implementation

{$R *.dfm}

procedure TFormClient.DownloadGames(ACommand: string);
var
  SeparatorPos: uint16;
  i: uint16;
begin
  FrameChoice.ValueListEditorGames.Strings.Clear;
  while ACommand<>'' do
  begin
    SeparatorPos:= AnsiPos('|', ACommand);
    FrameChoice.ValueListEditorGames.Strings.AddPair(Copy(ACommand, 1, SeparatorPos-1), '');
    ACommand:= Copy(ACommand, SeparatorPos+1, Length(ACommand)-SeparatorPos);
  end;
  SetLength(FrameChoice.Ratings, FrameChoice.ValueListEditorGames.RowCount);
  for i:= 0 to High(FrameChoice.Ratings) do
    FrameChoice.Ratings[i]:= -1;
end;

procedure TFormClient.SendRating;
var
  RatingString: string;
  i: uint16;
begin
  RatingString:= '2';
  RatingString:= RatingString + ClientID + '|';
  for i := 0 to High(FrameChoice.Ratings) do
    RatingString:= RatingString + FloatToStr(FrameChoice.Ratings[i]) + '|';
  ClientSocket.Socket.SendText(RatingString);
end;

procedure TFormClient.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ClientSocket.Socket.SendText('1' + ClientID);
  Application.Terminate;
end;

procedure TFormClient.ClientSocketRead(Sender: TObject;
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
      DownloadGames(Command);
  end;
end;

procedure TFormClient.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  FrameLogin.Free;

  BorderStyle:= TFormBorderStyle.bsSizeable;
  Constraints.MaxWidth:= FrameChoice.Width;
  Constraints.MinWidth:= FrameChoice.Width;
  Width:= FrameChoice.Width;
  Height:= FrameChoice.Height;
  FrameChoice.Align:= TAlign.alClient;
  FrameChoice.Enabled:= True;

  ClientSocket.Socket.SendText('0' + ClientID);
end;

procedure TFormClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientSocket.Active:= False;
end;

end.
