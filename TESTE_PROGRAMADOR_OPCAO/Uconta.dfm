object FormContas: TFormContas
  Left = 0
  Top = 0
  Caption = 'Contas'
  ClientHeight = 438
  ClientWidth = 640
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
    Top = 302
    Width = 640
    Height = 136
    Align = alBottom
    Caption = 'Criar Conta'
    TabOrder = 0
    object BtnInserir: TBitBtn
      Left = 3
      Top = 84
      Width = 68
      Height = 25
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = BtnInserirClick
    end
    object BtnAlterar: TBitBtn
      Left = 77
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExcluir: TBitBtn
      Left = 239
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnConfirmar: TBitBtn
      Left = 327
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = BtnConfirmarClick
    end
    object BtnCancelar: TBitBtn
      Left = 408
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = BtnCancelarClick
    end
    object BtnSair: TBitBtn
      Left = 489
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object DBEditnumeroconta: TDBEdit
      Left = 3
      Top = 47
      Width = 149
      Height = 21
      DataField = 'numeroconta'
      DataSource = DSConta
      TabOrder = 6
    end
    object BtnInativar: TBitBtn
      Left = 158
      Top = 83
      Width = 75
      Height = 25
      Caption = 'Inativar'
      TabOrder = 7
      OnClick = BtnInativarClick
    end
    object DBEditnomecli: TDBLookupComboBox
      Left = 158
      Top = 47
      Width = 145
      Height = 21
      DataSource = DSConta
      TabOrder = 8
    end
    object DBEditnomebc: TDBLookupComboBox
      Left = 320
      Top = 47
      Width = 145
      Height = 21
      DataField = 'nomebanco'
      DataSource = DSConta
      ListSource = DSConta
      TabOrder = 9
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 640
    Height = 302
    Align = alClient
    Caption = 'Contas Cadastradas'
    TabOrder = 1
    object DBGridContas: TDBGrid
      Left = 2
      Top = 15
      Width = 636
      Height = 285
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'idcontas'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numeroconta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idcliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idbanco'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativaconta'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomecliente'
          Width = 141
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomebanco'
          Width = 117
          Visible = True
        end>
    end
  end
  object QRVerCli: TZQuery
    Connection = DataModule1.ZConnection1
    Active = True
    SQL.Strings = (
      'select * from Clientes')
    Params = <>
    Left = 456
    Top = 302
    object QRVerCliidcliente: TIntegerField
      FieldName = 'idcliente'
      ReadOnly = True
    end
    object QRVerClinomecliente: TWideStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 30
    end
  end
  object QRUpdateConta: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Contas'
      'WHERE'
      
        '  ((Contas.idcontas IS NULL AND :OLD_idcontas IS NULL) OR (Conta' +
        's.idcontas = :OLD_idcontas)) AND'
      '  Contas.numeroconta = :OLD_numeroconta AND'
      '  Contas.idcliente = :OLD_idcliente AND'
      '  Contas.idbanco = :OLD_idbanco AND'
      '  Contas.ativaconta = :OLD_ativaconta')
    InsertSQL.Strings = (
      'INSERT INTO Contas'
      '  (numeroconta, idcliente, idbanco, ativaconta, nomecliente, '
      '   nomebanco)'
      'VALUES'
      
        '  (:numeroconta, :idcliente, :idbanco, :ativaconta, :nomecliente' +
        ', '
      '   :nomebanco)')
    ModifySQL.Strings = (
      'UPDATE Contas SET'
      '  idcontas = :idcontas,'
      '  numeroconta = :numeroconta,'
      '  idcliente = :idcliente,'
      '  idbanco = :idbanco,'
      '  ativaconta = :ativaconta,'
      '  nomecliente = :nomecliente,'
      '  nomebanco = :nomebanco'
      'WHERE'
      
        '  ((Contas.idcontas IS NULL AND :OLD_idcontas IS NULL) OR (Conta' +
        's.idcontas = :OLD_idcontas)) AND'
      '  Contas.numeroconta = :OLD_numeroconta AND'
      '  Contas.idcliente = :OLD_idcliente AND'
      '  Contas.idbanco = :OLD_idbanco AND'
      '  Contas.ativaconta = :OLD_ativaconta')
    UseSequenceFieldForRefreshSQL = False
    Left = 376
    Top = 302
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcontas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numeroconta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idbanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ativaconta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nomecliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nomebanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcontas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numeroconta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idbanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ativaconta'
        ParamType = ptUnknown
      end>
  end
  object QRVerBc: TZQuery
    Connection = DataModule1.ZConnection1
    Active = True
    SQL.Strings = (
      'select * from Bancos')
    Params = <>
    Left = 512
    Top = 310
    object QRVerBcidbanco: TIntegerField
      FieldName = 'idbanco'
      ReadOnly = True
    end
    object QRVerBcnomebanco: TWideStringField
      FieldName = 'nomebanco'
      Required = True
      Size = 30
    end
  end
  object QRConsultact: TZQuery
    Connection = DataModule1.ZConnection1
    Filtered = True
    CachedUpdates = True
    Active = True
    SQL.Strings = (
      'select * from Contas')
    Params = <>
    Left = 280
    Top = 302
    object QRConsultactidcontas: TIntegerField
      FieldName = 'idcontas'
      ReadOnly = True
    end
    object QRConsultactnumeroconta: TIntegerField
      FieldName = 'numeroconta'
      Required = True
    end
    object QRConsultactidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object QRConsultactidbanco: TIntegerField
      FieldName = 'idbanco'
    end
    object QRConsultactativaconta: TBooleanField
      FieldName = 'ativaconta'
      ReadOnly = True
    end
  end
  object DSConta: TDataSource
    DataSet = QRConta
    Left = 576
    Top = 382
  end
  object QRConta: TZQuery
    Connection = DataModule1.ZConnection1
    UpdateObject = QRUpdateConta
    Active = True
    SQL.Strings = (
      'select  c.*, cl.nomecliente, bc.nomebanco '
      'from Contas c, Clientes cl, Bancos bc'
      'where'
      ' c.idcliente = cl.idcliente'
      'AND c.idbanco = bc.idbanco'
      'AND c.ativaconta = 1'
      'ORDER BY c.numeroconta')
    Params = <>
    Left = 216
    Top = 302
    object QRContaidcontas: TIntegerField
      FieldName = 'idcontas'
      ReadOnly = True
    end
    object QRContanumeroconta: TIntegerField
      FieldName = 'numeroconta'
      Required = True
    end
    object QRContaidcliente: TIntegerField
      FieldName = 'idcliente'
      Required = True
    end
    object QRContaidbanco: TIntegerField
      FieldName = 'idbanco'
      Required = True
    end
    object QRContaativaconta: TBooleanField
      FieldName = 'ativaconta'
      Required = True
    end
    object QRContanomecliente: TWideStringField
      FieldName = 'nomecliente'
      Required = True
      Size = 30
    end
    object QRContanomebanco: TWideStringField
      FieldName = 'nomebanco'
      Required = True
      Size = 30
    end
  end
  object QRVerMovimento: TZQuery
    Connection = DataModule1.ZConnection1
    Active = True
    SQL.Strings = (
      'select * from Movimentos')
    Params = <>
    Left = 584
    Top = 318
  end
  object DataSourcevercli: TDataSource
    DataSet = QRVerCli
    Left = 136
    Top = 302
  end
end
