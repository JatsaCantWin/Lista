object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  Height = 537
  Width = 736
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\Programs\Lista\Win32\Debug\games.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 96
    Top = 24
  end
  object FDManager: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 32
    Top = 24
  end
  object FDQueryGames: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM Games')
    Left = 32
    Top = 72
  end
  object FDQueryUsers: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM Users')
    Left = 32
    Top = 120
  end
end
