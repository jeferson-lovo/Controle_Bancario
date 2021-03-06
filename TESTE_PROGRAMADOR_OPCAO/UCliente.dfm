object FormCliente: TFormCliente
  Left = 0
  Top = 0
  Caption = 'FormCliente'
  ClientHeight = 447
  ClientWidth = 570
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
    Top = 342
    Width = 570
    Height = 105
    Align = alBottom
    Caption = '| Op'#231#245'es de Clientes |'
    TabOrder = 0
    object BtnInserir: TBitBtn
      Left = 3
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = BtnInserirClick
    end
    object BtnExcluir: TBitBtn
      Left = 165
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 84
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = BtnAlterarClick
    end
    object BtnConfirmar: TBitBtn
      Left = 246
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = BtnConfirmarClick
    end
    object BtnCancelar: TBitBtn
      Left = 327
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = BtnCancelarClick
    end
    object BtnSair: TBitBtn
      Left = 408
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object DBEditCliente: TDBEdit
      Left = 3
      Top = 24
      Width = 237
      Height = 21
      AutoSize = False
      DataField = 'nomecliente'
      DataSource = DSCliente
      ReadOnly = True
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 570
    Height = 342
    Align = alClient
    Caption = '| Lista de Clientes Cadastrados |'
    TabOrder = 1
    object DBGridClientes: TDBGrid
      Left = 2
      Top = 15
      Width = 566
      Height = 325
      Align = alClient
      DataSource = DSCliente
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nomecliente'
          Visible = True
        end>
    end
  end
  object QRCliente: TZQuery
    Connection = DataModule1.ZConnection1
    UpdateObject = QRUpdateCliente
    Active = True
    SQL.Strings = (
      'select * from Clientes')
    Params = <>
    Left = 288
    Top = 358
    object QRClientenomecliente: TWideStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 30
    end
    object QRClienteidcliente: TIntegerField
      FieldName = 'idcliente'
      ReadOnly = True
    end
  end
  object QRUpdateCliente: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Clientes'
      'WHERE'
      
        '  ((Clientes.idcliente IS NULL AND :OLD_idcliente IS NULL) OR (C' +
        'lientes.idcliente = :OLD_idcliente))')
    InsertSQL.Strings = (
      'INSERT INTO Clientes'
      '  (nomecliente)'
      'VALUES'
      '  ( :nomecliente)')
    ModifySQL.Strings = (
      'UPDATE Clientes SET'
      '  nomecliente = :nomecliente'
      'WHERE'
      
        '  ((Clientes.idcliente IS NULL AND :OLD_idcliente IS NULL) OR (C' +
        'lientes.idcliente = :OLD_idcliente))')
    UseSequenceFieldForRefreshSQL = False
    Left = 408
    Top = 366
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nomecliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcliente'
        ParamType = ptUnknown
      end>
  end
  object DSCliente: TDataSource
    DataSet = QRCliente
    Left = 352
    Top = 358
  end
  object QRVercontaCli: TZQuery
    Connection = DataModule1.ZConnection1
    Active = True
    SQL.Strings = (
      'select * from Contas c'
      'where c.idcliente = :idcliente')
    Params = <
      item
        DataType = ftUnknown
        Name = 'idcliente'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcliente'
        ParamType = ptUnknown
      end>
    object QRVercontaCliidcontas: TIntegerField
      FieldName = 'idcontas'
      ReadOnly = True
    end
    object QRVercontaClinumeroconta: TIntegerField
      FieldName = 'numeroconta'
      Required = True
    end
    object QRVercontaCliidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object QRVercontaCliidbanco: TIntegerField
      FieldName = 'idbanco'
    end
  end
  object QRConsultaCli: TZQuery
    Connection = DataModule1.ZConnection1
    Active = True
    SQL.Strings = (
      'select * from Clientes')
    Params = <>
    Left = 504
    Top = 406
    object QRConsultaClinomecliente: TWideStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 30
    end
    object QRConsultaCliidcliente: TIntegerField
      FieldName = 'idcliente'
      ReadOnly = True
    end
  end
end
