object FormClient: TFormClient
  Left = 0
  Top = 0
  Caption = 'FormClient'
  ClientHeight = 301
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameLogin: TFrameLogin
    Left = 0
    Top = 0
    Width = 234
    Height = 301
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -16
    ExplicitTop = -39
    inherited LabeledEditIP: TLabeledEdit
      EditLabel.ExplicitLeft = 0
      EditLabel.ExplicitTop = -16
      EditLabel.ExplicitWidth = 65
    end
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocketConnect
    Left = 184
    Top = 248
  end
end
