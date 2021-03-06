object FormBancos: TFormBancos
  Left = 0
  Top = 0
  Caption = 'Bancos'
  ClientHeight = 359
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 528
    Height = 265
    Align = alTop
    Caption = 'Lista de Bancos Cadastrados'
    TabOrder = 0
    object DBGridBanco: TDBGrid
      Left = 2
      Top = 15
      Width = 524
      Height = 248
      Align = alClient
      DataSource = DSBanco
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'idbanco'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nomebanco'
          Width = 283
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 254
    Width = 528
    Height = 105
    Align = alBottom
    Caption = 'Op'#231#245'es do Banco'
    TabOrder = 1
    object BtnInserir: TBitBtn
      Left = 24
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = BtnInserirClick
    end
    object BtnExcluir: TBitBtn
      Left = 186
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 105
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = BtnAlterarClick
    end
    object BtnConfirmar: TBitBtn
      Left = 267
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = BtnConfirmarClick
    end
    object BtnCancelar: TBitBtn
      Left = 348
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = BtnCancelarClick
    end
    object BtnSair: TBitBtn
      Left = 429
      Top = 69
      Width = 75
      Height = 28
      Caption = 'Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object DBEditBanco: TDBEdit
      Left = 24
      Top = 33
      Width = 237
      Height = 21
      DataField = 'nomebanco'
      DataSource = DSBanco
      TabOrder = 6
    end
  end
  object QRBanco: TZQuery
    Connection = DataModule1.ZConnection1
    UpdateObject = QRUpdateBanco
    SQL.Strings = (
      'select * from Bancos')
    Params = <>
    Left = 272
    Top = 262
    object QRBancoidbanco: TIntegerField
      FieldName = 'idbanco'
      ReadOnly = True
    end
    object QRBanconomebanco: TWideStringField
      FieldName = 'nomebanco'
      Required = True
      Size = 30
    end
  end
  object QRUpdateBanco: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Bancos'
      'WHERE'
      
        '  ((Bancos.idbanco IS NULL AND :OLD_idbanco IS NULL) OR (Bancos.' +
        'idbanco = :OLD_idbanco))')
    InsertSQL.Strings = (
      'INSERT INTO Bancos'
      '  (nomebanco)'
      'VALUES'
      '  (:nomebanco)')
    ModifySQL.Strings = (
      'UPDATE Bancos SET'
      '  nomebanco = :nomebanco'
      'WHERE'
      
        '  ((Bancos.idbanco IS NULL AND :OLD_idbanco IS NULL) OR (Bancos.' +
        'idbanco = :OLD_idbanco))')
    UseSequenceFieldForRefreshSQL = False
    Left = 328
    Top = 278
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nomebanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idbanco'
        ParamType = ptUnknown
      end>
  end
  object DSBanco: TDataSource
    DataSet = QRBanco
    Left = 392
    Top = 278
  end
  object QRVerConta: TZQuery
    Connection = DataModule1.ZConnection1
    SQL.Strings = (
      'select * from Contas'
      'where idbanco = :idbanco')
    Params = <
      item
        DataType = ftUnknown
        Name = 'idbanco'
        ParamType = ptUnknown
      end>
    Left = 472
    Top = 270
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idbanco'
        ParamType = ptUnknown
      end>
  end
  object QRConsultabc: TZQuery
    Connection = DataModule1.ZConnection1
    SQL.Strings = (
      'select * from Bancos')
    Params = <>
    Left = 208
    Top = 262
  end
end
