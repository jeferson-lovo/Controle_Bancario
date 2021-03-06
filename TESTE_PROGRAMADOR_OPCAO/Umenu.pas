unit Umenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormMenu = class(TForm)
    MainMenu1: TMainMenu;
    bc: TMenuItem;
    Relatorios1: TMenuItem;
    Saldo1: TMenuItem;
    Extrato: TMenuItem;
    Contas: TMenuItem;
    Contasinativas: TMenuItem;
    Clientes: TMenuItem;
    Bancos: TMenuItem;
    C: TMenuItem;
    Cli: TMenuItem;
    BtnSair: TBitBtn;
    procedure ClientesClick(Sender: TObject);
    procedure bcClick(Sender: TObject);
    procedure Analitico2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ContasClick(Sender: TObject);
    procedure BancosClick(Sender: TObject);
    procedure Saldo1Click(Sender: TObject);
    procedure ExtratoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.dfm}

uses Ubanco, Uconsulta, Uconta, Ucredito, Udebito, Udmdados,
  Urelatorio, UCliente;

procedure TFormMenu.Analitico2Click(Sender: TObject);
begin
FormContas.Show;
end;

procedure TFormMenu.BancosClick(Sender: TObject);
begin
  FormBancos.Show;
end;

procedure TFormMenu.ClientesClick(Sender: TObject);
begin
  FormCliente.Show;
end;

procedure TFormMenu.ContasClick(Sender: TObject);
begin
  FormContas.Show;
end;

procedure TFormMenu.ExtratoClick(Sender: TObject);
begin
  FormRelatorio.show;
end;

procedure TFormMenu.bcClick(Sender: TObject);
begin
FormBancos.Show;
end;

procedure TFormMenu.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormMenu.FormCreate(Sender: TObject);
begin
  DataModule1 :=  TDataModule1.Create(self);
  DataModule1.ZConnection1.SQLHourGlass := true;
  DataModule1.ZConnection1.Protocol := 'mssql';
  DataModule1.ZConnection1.LibraryLocation := 'C:\Users\JEFERSON\Documents\TESTE_PROGRAMADOR_OPCAO\ntwdblib.dll';
  DataModule1.ZConnection1.HostName := '.\TESTEPROGRAMADOR' ;
  DataModule1.ZConnection1.Port :=1433;
  DataModule1.ZConnection1.User :='teste';
  DataModule1.ZConnection1.Password :='teste';
  DataModule1.ZConnection1.Database := 'dbteste';
  DataModule1.ZConnection1.Connected := true;
end;

procedure TFormMenu.Saldo1Click(Sender: TObject);
begin
  FormConsulta.show;
end;

end.
