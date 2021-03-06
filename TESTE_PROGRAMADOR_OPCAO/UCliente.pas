unit UCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZSqlUpdate, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormCliente = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGridClientes: TDBGrid;
    BtnInserir: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    DBEditCliente: TDBEdit;
    QRCliente: TZQuery;
    QRUpdateCliente: TZUpdateSQL;
    DSCliente: TDataSource;
    QRClientenomecliente: TWideStringField;
    QRVercontaCli: TZQuery;
    QRConsultaCli: TZQuery;
    QRConsultaClinomecliente: TWideStringField;
    QRVercontaCliidcontas: TIntegerField;
    QRVercontaClinumeroconta: TIntegerField;
    QRVercontaCliidcliente: TIntegerField;
    QRVercontaCliidbanco: TIntegerField;
    QRClienteidcliente: TIntegerField;
    QRConsultaCliidcliente: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure stAcao(ativa: Boolean);
  end;

var
  FormCliente: TFormCliente;

implementation

{$R *.dfm}

uses Udmdados;

procedure TFormCliente.BtnAlterarClick(Sender: TObject);
begin
  if QRCliente.IsEmpty then
    exit;

  stAcao(false);
  QRCliente.Edit;
  DBEditCliente.SetFocus;
end;

procedure TFormCliente.BtnCancelarClick(Sender: TObject);
begin
  QRCliente.Cancel;
  stAcao(true);
end;

procedure TFormCliente.BtnConfirmarClick(Sender: TObject);
var cod : integer;
begin
  if trim(DBEditCliente.Text) = '' then
  begin
    messagedlg('Por Favor Informe o Nome do Cliente!', mtwarning, [mbok], 0);
    DBEditCliente.SetFocus;
    exit;
  end;

  if (QRCliente.State = DsInsert) then
  begin
    QRConsultaCli.Close;
    QRConsultaCli.Open;
    if QRConsultaCli.IsEmpty
     then QRClienteidcliente.Value := 1
  //  else QRClienteidcliente.Value := QRConsultaCli.RecordCount + 1;
  end;
  cod := QRClienteidcliente.Value;

  try

    QRCliente.post;
    QRCliente.ApplyUpdates;
    QRCliente.CommitUpdates;
    //
    //
    except
    messagedlg('Erro na Grava??o!', mtinformation, [mbok], 0)
  end;


  QRCliente.Close;
  QRCliente.Open;
  stAcao(true);
  QRCliente.Locate('idcliente', cod, []);

end;

procedure TFormCliente.BtnExcluirClick(Sender: TObject);
begin

  QRVercontaCli.Close;
  QRVercontaCli.ParamByName('idcliente').Value := QRClienteidcliente.Value;
  QRVercontaCli.Open;
  if not QRVercontaCli.IsEmpty then
  begin
    messagedlg('Aten??o! Exclus?o n?o permitida! Existe(m) conta(s)' +
               'vinculada(s) a este Cliente!', mtinformation, [mbok], 0);
    exit;
  end;

  if messagedlg('Opera??o Irreversivel! Confirma a exclus?o do Cliente?',
    mtconfirmation, [mbyes,mbno], 0) =mryes then
    begin
      try
        QRCliente.Delete;
        QRCliente.ApplyUpdates;
        QRCliente.CommitUpdates;
      except
        messagedlg('Erro na exclus?o do Cliente!', mtinformation, [mbok], 0)
      end;
      QRCliente.Close;
      QRCliente.Open;
    end;
end;

procedure TFormCliente.BtnInserirClick(Sender: TObject);
begin
  stAcao(false);
  QRCliente.Append;
  DBEditCliente.SetFocus;
end;

procedure TFormCliente.BtnSairClick(Sender: TObject);
begin
  stAcao(true);
  close;
end;

procedure TFormCliente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (not (QRCliente.State in dsEditModes));
end;

procedure TFormCliente.FormShow(Sender: TObject);
begin
  stAcao(true);
  QRCliente.Close;
  QRCliente.Open;
  QRConsultaCli.Close;
  QRConsultaCli.Open;
  QRVercontaCli.Close;
  QRVercontaCli.Open;

end;

procedure TFormCliente.stAcao(ativa : Boolean);
begin
  BtnInserir.Enabled := ativa;
   BtnAlterar.Enabled := ativa;
   BtnExcluir.Enabled := ativa;
   BtnConfirmar.Enabled := not ativa;
   BtnCancelar.Enabled := not ativa;
   BtnSair.Enabled := ativa;
   DBEditCliente.ReadOnly := ativa ;
   DBGridClientes.Enabled :=  ativa;
end;

end.
