object FormClient: TFormClient
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'FormClient'
  ClientHeight = 311
  ClientWidth = 234
  Color = clBtnFace
  Constraints.MaxWidth = 240
  Constraints.MinWidth = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameChoice: TFrameChoice
    Left = -406
    Top = -59
    Width = 360
    Height = 360
    Enabled = False
    TabOrder = 1
    ExplicitLeft = -406
    ExplicitTop = -59
  end
  inline FrameLogin: TFrameLogin
    Left = 0
    Top = 0
    Width = 234
    Height = 311
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 234
    ExplicitHeight = 311
    inherited LabeledEditIP: TLabeledEdit
      AlignWithMargins = True
      Left = 52
      Width = 130
      Margins.Left = 60
      Margins.Right = 60
      EditLabel.ExplicitLeft = 112
      EditLabel.ExplicitTop = 32
      EditLabel.ExplicitWidth = 10
      ExplicitLeft = 52
      ExplicitWidth = 130
    end
    inherited LabeledEditPort: TLabeledEdit
      AlignWithMargins = True
      Left = 52
      Top = 101
      Width = 130
      EditLabel.ExplicitLeft = 107
      EditLabel.ExplicitTop = 85
      EditLabel.ExplicitWidth = 20
      ExplicitLeft = 52
      ExplicitTop = 101
      ExplicitWidth = 130
    end
    inherited ButtonConnect: TButton
      Top = 136
      ExplicitTop = 136
    end
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    Left = 184
    Top = 248
  end
end
