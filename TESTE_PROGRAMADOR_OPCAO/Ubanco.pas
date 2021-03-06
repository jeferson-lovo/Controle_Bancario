unit Ubanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFormBancos = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BtnInserir: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    DBGridBanco: TDBGrid;
    DBEditBanco: TDBEdit;
    QRBanco: TZQuery;
    QRUpdateBanco: TZUpdateSQL;
    DSBanco: TDataSource;
    QRBancoidbanco: TIntegerField;
    QRBanconomebanco: TWideStringField;
    QRVerConta: TZQuery;
    QRConsultabc: TZQuery;
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
  FormBancos: TFormBancos;

implementation

{$R *.dfm}

uses Udmdados;

procedure TFormBancos.stAcao(ativa: Boolean);
begin
   BtnInserir.Enabled := ativa;
   BtnAlterar.Enabled := ativa;
   BtnExcluir.Enabled := ativa;
   BtnConfirmar.Enabled := not ativa;
   BtnCancelar.Enabled := not ativa;
   BtnSair.Enabled := ativa;
   DBEditBanco.ReadOnly := ativa;
   DBGridBanco.Enabled := ativa;
end;

procedure TFormBancos.BtnAlterarClick(Sender: TObject);
begin
  if QRBanco.IsEmpty then
    exit;

  stAcao(false);
  QRBanco.Edit;
  DBEditBanco.SetFocus;
end;

procedure TFormBancos.BtnCancelarClick(Sender: TObject);
begin
  QRBanco.Cancel;
  stAcao(true);
end;

procedure TFormBancos.BtnConfirmarClick(Sender: TObject);
var cod : integer;
begin
  if trim(DBEditBanco.Text) = '' then
  begin
    messagedlg('Por Favor Informe o Nome do Banco!', mtwarning, [mbok], 0);
    DBEditBanco.SetFocus;
    exit;
  end;

  if (QRBanco.State = DsInsert) then
  begin
    QRConsultabc.Close;
    QRConsultabc.Open;
    if QRConsultabc.IsEmpty
     then QRBancoidbanco.Value := 1
  //  else QRBancoidbanco.Value := QRConsultabc.RecordCount + 1;
  end;
  cod := QRBancoidbanco.Value;

  try

    QRBanco.post;
    QRBanco.ApplyUpdates;
    QRBanco.CommitUpdates;
    //
    //
    except
    messagedlg('Erro na Grava??o!', mtinformation, [mbok], 0)
  end;


  QRBanco.Close;
  QRBanco.Open;
  stAcao(true);
  QRBanco.Locate('idbanco', cod, []);

  end;

procedure TFormBancos.BtnExcluirClick(Sender: TObject);
begin
  QRVerConta.Close;
  QRVerConta.ParamByName('idbanco').Value := QRBancoidbanco.Value;
  QRVerConta.Open;
  if not QRVerConta.isEmpty then
    begin
      messagedlg('Aten??o! Exclus?o n?o permitida! Existe(m) Conta(s)' +
      'vinculada(s) a este banco!',mtinformation, [mbok],0);
      exit;
    end;

  if messagedlg('Opera??o Irreversivel! Confirma a exclus?o do Banco?'
     ,mtconfirmation, [mbyes,mbno],0)=mryes then
    begin
      try
        QRBanco.Delete;
        QRBanco.ApplyUpdates;
        QRBanco.CommitUpdates;
      finally
     // messagedlg('Erro na exclus?o do Banco!', mtinformation, [mbok], 0)
      end;
      QRBanco.Close;
      QRBanco.Open;
    end;
end;

procedure TFormBancos.BtnInserirClick(Sender: TObject);
begin
  stAcao(false);
  QRBanco.Append;
  DBEditBanco.SetFocus;
end;

procedure TFormBancos.BtnSairClick(Sender: TObject);
begin
  stAcao(false);
  close;
end;

procedure TFormBancos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (not (QRBanco.State in dsEditModes));
end;

procedure TFormBancos.FormShow(Sender: TObject);
begin
  QRVerConta.Close;
  QRVerConta.Open;
  QRBanco.Close;
  QRBanco.Open;
  QRConsultabc.Close;
  QRConsultabc.Open;
  stAcao(true);
end;

end.
