program ProjectProgramadorJeferson;

uses
  Vcl.Forms,
  Umenu in 'Umenu.pas' {FormMenu},
  Uconta in 'Uconta.pas' {FormContas},
  Ubanco in 'Ubanco.pas' {FormBancos},
  Udebito in 'Udebito.pas' {Form5},
  Ucredito in 'Ucredito.pas' {Form6},
  Urelatorio in 'Urelatorio.pas' {FormRelatorio},
  Uconsulta in 'Uconsulta.pas' {FormConsulta},
  Udmdados in 'Udmdados.pas' {DataModule1: TDataModule},
  UCliente in 'UCliente.pas' {FormCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormContas, FormContas);
  Application.CreateForm(TFormBancos, FormBancos);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TFormRelatorio, FormRelatorio);
  Application.CreateForm(TFormConsulta, FormConsulta);
  Application.CreateForm(TFormCliente, FormCliente);
  Application.Run;
end.
