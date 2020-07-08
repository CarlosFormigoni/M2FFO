program monitora;

uses
  Vcl.Forms,
  monitora01 in 'monitora01.pas' {FPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  monitora02 in 'monitora02.pas' {Form2},
  System.UITypes,
  monitora03 in 'monitora03.pas' {Form3},
  monitora04 in 'monitora04.pas' {Form4},
  monitora05 in 'monitora05.pas' {Form5},
  monitora06 in 'monitora06.pas' {Form6},
  monitora07 in 'monitora07.pas' {Form7},
  monitora08 in 'monitora08.pas' {FDigestores},
  monitora09 in 'monitora09.pas' {FEsterilizacao},
  monitora10 in 'monitora10.pas' {FRelatorioEst},
  m2rendsys11 in 'm2rendsys11.pas' {FCalibragem},
  m2rendsys12 in 'm2rendsys12.pas' {FGerenciadorEst},
  m2rendsys13 in 'm2rendsys13.pas' {FRelatorioDigestores},
  m2rendsys14 in 'm2rendsys14.pas' {FConfiguracaoDriver};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TFDigestores, FDigestores);
  Application.CreateForm(TFEsterilizacao, FEsterilizacao);
  Application.CreateForm(TFRelatorioEst, FRelatorioEst);
  Application.CreateForm(TFCalibragem, FCalibragem);
  Application.CreateForm(TFGerenciadorEst, FGerenciadorEst);
  Application.CreateForm(TFRelatorioDigestores, FRelatorioDigestores);
  Application.CreateForm(TFConfiguracaoDriver, FConfiguracaoDriver);
  if form3.ShowModal = mrOK then
  begin
    form3.Destroy;
    Application.CreateForm(TFPrincipal, FPrincipal);
  end;
  Application.Run;
end.
