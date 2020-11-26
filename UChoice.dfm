object FrameChoice: TFrameChoice
  Left = 0
  Top = 0
  Width = 360
  Height = 360
  TabOrder = 0
  OnResize = FrameResize
  object ValueListEditorGames: TValueListEditor
    AlignWithMargins = True
    Left = 15
    Top = 15
    Width = 330
    Height = 305
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 40
    Align = alClient
    DefaultColWidth = 275
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    Strings.Strings = (
      '=')
    TabOrder = 0
    TitleCaptions.Strings = (
      'Gra'
      'Waga')
    OnKeyPress = ValueListEditorGamesKeyPress
    OnSelectCell = ValueListEditorGamesSelectCell
    ColWidths = (
      275
      49)
  end
  object ButtonCancel: TButton
    Left = 179
    Top = 328
    Width = 150
    Height = 25
    Margins.Left = 15
    Margins.Right = 195
    Margins.Bottom = 7
    Align = alCustom
    Caption = 'Anuluj'
    Enabled = False
    TabOrder = 1
  end
  object ButtonSend: TButton
    Left = 15
    Top = 328
    Width = 150
    Height = 25
    Margins.Left = 15
    Margins.Right = 195
    Margins.Bottom = 7
    Align = alCustom
    Caption = 'Wyslij ocene'
    TabOrder = 2
    OnClick = ButtonSendClick
  end
end
