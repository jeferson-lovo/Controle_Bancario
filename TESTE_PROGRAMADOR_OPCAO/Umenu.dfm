object FormMenu: TFormMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 239
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BtnSair: TBitBtn
    Left = 192
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 0
    OnClick = BtnSairClick
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 32
    object Cli: TMenuItem
      Caption = 'Clientes'
      object Clientes: TMenuItem
        Caption = 'Clientes'
        OnClick = ClientesClick
      end
    end
    object bc: TMenuItem
      Caption = 'Bancos'
      object Bancos: TMenuItem
        Caption = 'Bancos'
        OnClick = BancosClick
      end
    end
    object C: TMenuItem
      Caption = 'Contas'
      object Contas: TMenuItem
        Caption = 'Contas'
        OnClick = ContasClick
      end
      object Contasinativas: TMenuItem
        Caption = 'Contas Inativas'
      end
    end
    object Relatorios1: TMenuItem
      Caption = 'Relatorios'
      object Saldo1: TMenuItem
        Caption = 'Saldo'
        OnClick = Saldo1Click
      end
      object Extrato: TMenuItem
        Caption = 'Extrato'
        OnClick = ExtratoClick
      end
    end
  end
end
