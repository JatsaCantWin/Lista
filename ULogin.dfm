object FrameLogin: TFrameLogin
  Left = 0
  Top = 0
  Width = 250
  Height = 340
  TabOrder = 0
  DesignSize = (
    250
    340)
  object LabeledEditIP: TLabeledEdit
    Left = 57
    Top = 48
    Width = 120
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 10
    EditLabel.Height = 13
    EditLabel.Caption = 'IP'
    TabOrder = 0
    Text = 'localhost'
  end
  object LabeledEditPort: TLabeledEdit
    Left = 57
    Top = 93
    Width = 120
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Port'
    TabOrder = 1
    Text = '10131'
  end
  object ButtonConnect: TButton
    Left = 79
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 2
    OnClick = ButtonConnectClick
  end
end
