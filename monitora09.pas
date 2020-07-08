unit monitora09;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Graph, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, VCLTee.TeeDBCrossTab, Data.DB,
  Data.Win.ADODB;

type
  TFEsterilizacao = class(TForm)
    tx_corrente_est: TLabel;
    mt_esterilizador: TImage;
    Digestor1: TImage;
    vv_vapor_camisa_est: TImage;
    tb_vapor_camisa_est: TShape;
    tb_vaporgeral_est1: TShape;
    tb_vaporgeral_est: TShape;
    tmp_descarga_est: TImage;
    tb_vaporgeral_est2: TShape;
    tb_vaporgeral_est3: TShape;
    vv_vapor_est: TImage;
    tb_vapor_est: TShape;
    dp_pressao_linha: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    dp_condicao_est: TEdit;
    dp_faseprocesso_est: TEdit;
    dp_tempo_est: TEdit;
    dpTempEst: TEdit;
    dpPressaoEst: TEdit;
    vv_alivio_est: TImage;
    tb_alivio_est: TShape;
    tb_alivio_est1: TShape;
    btnPrincipal: TSpeedButton;
    btnTanques: TSpeedButton;
    btnSilos: TSpeedButton;
    SpeedButton1: TSpeedButton;
    dp_batelada_est: TEdit;
    tx_abertura_valvula_alivio_est: TLabel;
    tmp_carga_est: TImage;
    Shape5: TShape;
    Image8: TImage;
    Shape7: TShape;
    mt_rosca_entrada_est: TImage;
    Shape8: TShape;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dp_vapor_on: TEdit;
    dp_carga_ok: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dp_vapor_off: TEdit;
    Image3: TImage;
    Shape9: TShape;
    mt_rosca_saida_est: TImage;
    Shape10: TShape;
    btnEstAuto: TBitBtn;
    Timer1: TTimer;
    btnRelatorioEst: TSpeedButton;
    srcCalibragemEst: TDataSource;
    qrCalibragemEst: TADOQuery;
    srcConsulta: TDataSource;
    qrConsulta: TADOQuery;
    procedure btnPrincipalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
  var
  tag_temperatura, tag_pressao: real;
  tag_acvapormassa, tag_acvaporcamisa, tag_acmotor: boolean;
  tag_vapormassa, tag_vaporcamisa, tag_confmotor: boolean;
  tag_alivio: real;
  tag_contador_est: integer;
  tag_faseprocesso_est, tag_condicao_est: string;
    { Public declarations }
  end;

var
  FEsterilizacao: TFEsterilizacao;
  nbatelada: integer;


implementation

{$R *.dfm}

uses m2rendsys11;

procedure TFEsterilizacao.btnPrincipalClick(Sender: TObject);
begin
  //Fecha a tela esterilizacao
  FEsterilizacao.Close;
end;

procedure TFEsterilizacao.FormCreate(Sender: TObject);
begin
 //coleta as leituras do modbus
 if (tag_pressao = 0 ) then
 begin
   dpPressaoEst.Text:= '-' + ' bar';
 end else
 begin
  dpPressaoEst.Text:= FloatToStr(tag_pressao);
 end;

 if (tag_temperatura = 0) then
 begin
   dpTempEst.Text:= '-' + ' ºC';
 end else
 begin
  dpTempEst.Text:= FloatToStr(tag_pressao);
 end;

end;


procedure TFEsterilizacao.FormShow(Sender: TObject);
var
consultareceita: string;
begin
    //Rotina para chamar a receita salva
  qrCalibragemEst.Close;
  qrCalibragemEst.SQL.Clear;
  qrCalibragemEst.SQL.Add('SELECT TOP 1 * FROM CalibragemEst WHERE nome_receita = :p1 ORDER BY id DESC');
  qrCalibragemEst.Parameters.ParamByName('p1').Value:='esterilizador';
  qrCalibragemEst.Open;

  consultareceita:= qrCalibragemEst.FieldValues['nome_receita'];

  qrCalibragemEst.Close;
  qrCalibragemEst.SQL.Clear;
  qrCalibragemEst.SQL.Add('SELECT * FROM CalibragemEst WHERE nome_receita = :p1 ORDER BY id DESC');
  qrCalibragemEst.Parameters.ParamByName('p1').Value:= consultareceita;
  qrCalibragemEst.Open;

  dp_carga_ok.Text:= qrCalibragemEst.FieldValues['sp_carga'];
  dp_vapor_on.Text:= qrCalibragemEst.FieldValues['sp_vaporon'];
  dp_vapor_off.Text:= qrCalibragemEst.FieldValues['sp_vaporoff'];

  //Chama a ultima batelada
  QrConsulta.Close;
  QrConsulta.SQL.Clear;
  qrConsulta.SQL.Add('SELECT TOP 1 * FROM Esterilizacao ORDER BY batelada DESC');
  qrConsulta.Open;

  nbatelada:= qrConsulta.FieldValues['batelada'];

  dp_faseprocesso_est.Text:= 'FASE: ' + tag_faseprocesso_est;
  dp_condicao_est.Text:= 'EST: ' + tag_condicao_est;
  dp_batelada_est.Text:= 'BATELADA: ' + IntToStr(nbatelada);
  dp_tempo_est.Text:= 'TEMPO: ' + IntToStr(tag_contador_est) + ' s';


end;

end.
