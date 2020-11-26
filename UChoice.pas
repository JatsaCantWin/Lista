unit UChoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ValEdit;

type
  TFrameChoice = class(TFrame)
    ValueListEditorGames: TValueListEditor;
    ButtonCancel: TButton;
    ButtonSend: TButton;
    procedure ButtonSendClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure ValueListEditorGamesKeyPress(Sender: TObject; var Key: Char);
    procedure ValueListEditorGamesSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
  private
    { Private declarations }
    RatingSent: boolean;
    PreviousRow: uint8;
  public
    { Public declarations }
    Ratings: array of double;
  end;

implementation
uses
  UClient;

{$R *.dfm}

procedure TFrameChoice.ButtonSendClick(Sender: TObject);
var
  i: uint16;
  CustomVar: boolean;
begin
  ValueListEditorGamesSelectCell(ValueListEditorGames, 1, PreviousRow, CustomVar);
  for i := 0 to ValueListEditorGames.Strings.Count-1 do
    if ValueListEditorGames.Values[ValueListEditorGames.Keys[i]]='' then
    begin
      ShowMessage('Musisz uzupełnić każdą pozycję.');
      exit;
    end;
  ButtonCancel.Enabled:= True;
  ButtonSend.Enabled:= False;
  RatingSent:= True;
  FormClient.SendRating;
end;

procedure TFrameChoice.FrameResize(Sender: TObject);
begin
  ButtonSend.Top:= ValueListEditorGames.Top+ValueListEditorGames.Height+8;
  ButtonCancel.Top:= ButtonSend.Top;
end;

procedure TFrameChoice.ValueListEditorGamesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', '.', #8]) then
    Key:= #0;
end;

procedure TFrameChoice.ValueListEditorGamesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  ValueString: string;
  i: uint8;
begin
  ValueString:= ValueListEditorGames.Values[ValueListEditorGames.Keys[PreviousRow]];
  if ValueString<>'' then
  begin
    if AnsiPos('.', ValueString) > 0 then
    begin
      i:= AnsiPos('.', ValueString)+1;
      while i <= High(ValueString) do
        if ValueString[i]='.' then
          Delete(ValueString, i, 1)
        else
          Inc(i);
      if ValueString[High(ValueString)]='.' then
        Delete(ValueString, High(ValueString), 1);
    end;
    ValueListEditorGames.Values[ValueListEditorGames.Keys[PreviousRow]]:= ValueString;
    Ratings[PreviousRow]:= StrToFloat(ValueString);
  end;

  PreviousRow:= ARow;
end;

end.
