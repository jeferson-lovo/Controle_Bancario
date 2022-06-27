unit Uconta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, ZSqlUpdate,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormContas = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGridContas: TDBGrid;
    BtnInserir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    DBEditnumeroconta: TDBEdit;
    QRVerCli: TZQuery;
    QRUpdateConta: TZUpdateSQL;
    QRVerBc: TZQuery;
    QRConsultact: TZQuery;
    DSConta: TDataSource;
    QRConta: TZQuery;
    BtnInativar: TBitBtn;
    QRVerMovimento: TZQuery;
    QRContaidcontas: TIntegerField;
    QRContanumeroconta: TIntegerField;
    QRContaidcliente: TIntegerField;
    QRContaidbanco: TIntegerField;
    QRContaativaconta: TBooleanField;
    QRConsultactidcontas: TIntegerField;
    QRConsultactnumeroconta: TIntegerField;
    QRConsultactidcliente: TIntegerField;
    QRConsultactidbanco: TIntegerField;
    QRConsultactativaconta: TBooleanField;
    QRVerCliidcliente: TIntegerField;
    QRVerClinomecliente: TWideStringField;
    QRVerBcidbanco: TIntegerField;
    QRVerBcnomebanco: TWideStringField;
    QRContanomecliente: TWideStringField;
    QRContanomebanco: TWideStringField;
    DBEditnomecli: TDBLookupComboBox;
    DBEditnomebc: TDBLookupComboBox;
    DataSourcevercli: TDataSource;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnInativarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure stAcao(Ativa: Boolean);
  end;

var
  FormContas: TFormContas;

implementation

{$R *.dfm}

uses Udmdados;

procedure TFormContas.BtnAlterarClick(Sender: TObject);
begin
  if QRConta.IsEmpty then
    exit;

  stAcao(false);
  QRConta.Edit;
  DBEditnumeroconta.SetFocus;
end;

procedure TFormContas.BtnCancelarClick(Sender: TObject);
begin
  stAcao(true);
end;

procedure TFormContas.BtnConfirmarClick(Sender: TObject);
var cod : integer;
begin
if trim(DBEditnumeroconta.Text) = '' then
  begin
    messagedlg('Por Favor Informe o Numero da Conta!', mtwarning, [mbok], 0);
    DBEditnumeroconta.SetFocus;
    exit;
  end;

  if (QRConta.State = DsInsert) then
  begin
    QRConsultact.Close;
    QRConsultact.Open;
    if QRConsultact.IsEmpty
     then QRContaidcontas.Value := 1
  //  else QRContaidcontas.Value := QRConsultact.RecordCount + 1;
  end;
  cod := QRContaidcontas.Value;

  try

    QRConta.post;
    QRConta.ApplyUpdates;
    QRConta.CommitUpdates;
    //
    //
    except
    messagedlg('Erro na Gravação!', mtinformation, [mbok], 0)
  end;


  QRConta.Close;
  QRConta.Open;
  stAcao(true);
  QRConta.Locate('idcontas', cod, []);

end;

procedure TFormContas.BtnExcluirClick(Sender: TObject);
begin
  stAcao(false);
end;

procedure TFormContas.BtnInativarClick(Sender: TObject);
begin
  stAcao(false);

end;

procedure TFormContas.BtnInserirClick(Sender: TObject);
begin
  stAcao(false);
  QRConta.Append;
  DBEditnumeroconta.SetFocus;
end;

procedure TFormContas.BtnSairClick(Sender: TObject);
begin
  stAcao(true);
  close;
end;

procedure TFormContas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (not (QRConta.State in dsEditModes));
end;

procedure TFormContas.FormShow(Sender: TObject);
begin
    stAcao(true);
    QRConta.Close;
    QRConta.Open;
    QRVerCli.Close;
    QRVerCli.Open;
    QRConsultact.Close;
    QRConsultact.Open;
    QRVerBc.Close;
    QRVerBc.Open;
    QRVerMovimento.Close;
    QRVerMovimento.Open;
end;

procedure TFormContas.stAcao(ativa: Boolean);
begin
   BtnInserir.Enabled := ativa;
   BtnAlterar.Enabled := ativa;
   BtnExcluir.Enabled := ativa;
   BtnInativar.Enabled := ativa;
   BtnConfirmar.Enabled := not ativa;
   BtnCancelar.Enabled := not ativa;
   BtnSair.Enabled := ativa;
   DBEditnumeroconta.ReadOnly := ativa;
   DBEditnomecli.ReadOnly := ativa;
   DBEditnomebc.ReadOnly := ativa;
   DBGridContas.Enabled := ativa;
end;

end.
