unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameLogin = class(TFrame)
    LabeledEditIP: TLabeledEdit;
    LabeledEditPort: TLabeledEdit;
    ButtonConnect: TButton;
    procedure ButtonConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses
  UClient;

{$R *.dfm}

procedure TFrameLogin.ButtonConnectClick(Sender: TObject);
begin
    FormClient.ClientSocket.Port:= StrToInt(LabeledEditPort.Text);
    FormClient.ClientSocket.Host:= LabeledEditIP.Text;
    FormClient.ClientSocket.Active:= True;
end;

end.
