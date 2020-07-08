unit m2rendsys11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TFCalibragem = class(TForm)
    GrupoLeiturasGerais: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txLclpPressEst: TEdit;
    txLclpTempEst: TEdit;
    Label3: TLabel;
    txLclpCorrEst: TEdit;
    Label4: TLabel;
    txLclpAlivioEst: TEdit;
    GrupoPressEst: TGroupBox;
    Label5: TLabel;
    spclpRangeSupPressEst: TEdit;
    Label6: TLabel;
    spclpRangeInfPressEst: TEdit;
    GrupoTempEst: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    spclpRangeSupTempEst: TEdit;
    spclpRangeInfTempEst: TEdit;
    spPressMax: TEdit;
    spPressMin: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    spTempMax: TEdit;
    spTempMin: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    btnPrincipal: TSpeedButton;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    spclpRangeSupCorrEst: TEdit;
    spclpRangeInfCorrEst: TEdit;
    spCorrMax: TEdit;
    spCorrMin: TEdit;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    spVaporOn: TEdit;
    spCorrEst: TEdit;
    spVaporOff: TEdit;
    spclpVaporOff: TEdit;
    spclpVaporOn: TEdit;
    btnValidarCalib: TButton;
    Label7: TLabel;
    Label8: TLabel;
    spPressEst: TEdit;
    spclpPressEst: TEdit;
    spTempEst: TEdit;
    spclpTempEst: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    spclpCorrEst: TEdit;
    Label31: TLabel;
    LogoM2: TImage;
    srcCalibragemEst: TDataSource;
    qrCalibragemEst: TADOQuery;
    Label32: TLabel;
    Label33: TLabel;
    procedure btnPrincipalClick(Sender: TObject);
    procedure spPressMaxExit(Sender: TObject);
    procedure spPressMinExit(Sender: TObject);
    procedure spclpRangeSupPressEstExit(Sender: TObject);
    procedure spclpRangeInfPressEstExit(Sender: TObject);
    procedure btnValidarCalibClick(Sender: TObject);
    procedure spVaporOnExit(Sender: TObject);
    procedure spclpRangeSupTempEstExit(Sender: TObject);
    procedure spclpRangeInfTempEstExit(Sender: TObject);
    procedure spTempMaxExit(Sender: TObject);
    procedure spTempMinExit(Sender: TObject);
    procedure spclpRangeSupCorrEstExit(Sender: TObject);
    procedure spclpRangeInfCorrEstExit(Sender: TObject);
    procedure spCorrMaxExit(Sender: TObject);
    procedure spCorrMinExit(Sender: TObject);
    procedure spPressEstExit(Sender: TObject);
    procedure spVaporOffExit(Sender: TObject);
    procedure spTempEstExit(Sender: TObject);
    procedure spCorrEstExit(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
  var
  cal_vaporon, cal_vaporoff, cal_vaporon_eng, cal_vaporoff_eng: real; //variaveis de ajuste de controle da valvula de entr. vapor
  cal_vaporok, cal_vaporok_eng, cal_tempok, cal_tempok_eng, cal_cargaok, cal_cargaok_eng: real; //variaveis de ajuste do processo - calibragem vapor e temp de trabalho e carga
    { Public declarations }
  end;

var
  FCalibragem: TFCalibragem;

  clp_temph, clp_templ, sensor_temph, sensor_templ: real; //variaveis de calibragem pt100 do esterilizador - clp e sensor
  clp_pressaoh, clp_pressaol, sensor_pressaoh, sensor_pressaol: real; //variaveis de calibragem transm. pressao do esterilizador - clp e sensor
  clp_correnteh, clp_correntel, sensor_correnteh, sensor_correntel: real; //variaveis de calibragem corrente motor - clp e sensor



implementation

{$R *.dfm}

uses monitora09;

procedure TFCalibragem.btnPrincipalClick(Sender: TObject);
begin
  //Fecha a tela atual e volta para a principal
  FCalibragem.Close;
end;

procedure TFCalibragem.btnValidarCalibClick(Sender: TObject);
begin
  //Validar e registrar a calibragem interpolado os valores conversor AD CLP e range do sensor - Pressao
  //SP controle da valvula de vapor - abrir
  cal_vaporon_eng:= clp_pressaol + ((clp_pressaoh - clp_pressaol)*((cal_vaporon - sensor_pressaol)/(sensor_pressaoh - sensor_pressaol)));
  spclpVaporOn.Text:= FloatToStr(trunc(cal_vaporon_eng));
  //Controle da valvula de vapor - fechar
  cal_vaporoff_eng:= clp_pressaol + ((clp_pressaoh - clp_pressaol)*((cal_vaporoff - sensor_pressaol)/(sensor_pressaoh - sensor_pressaol)));
  spclpVaporOff.Text:= FloatToStr(trunc(cal_vaporoff_eng));

  //SP conversão de sp pressão de trabalho em pontos - clp
  cal_vaporok_eng:= clp_pressaol + ((clp_pressaoh - clp_pressaol)*((cal_vaporok - sensor_pressaol)/(sensor_pressaoh - sensor_pressaol)));
  spclpPressEst.Text:= FloatToStr(trunc(cal_vaporok_eng));

  //Conversão de sp temperatura de trabalho em pontos - clp
  cal_tempok_eng:= clp_templ + ((clp_temph - clp_templ)*((cal_tempok - sensor_templ)/(sensor_temph - sensor_templ)));
  spclpTempEst.Text:= FloatToStr(trunc(cal_tempok_eng));

  //Conversão de sp corrente de carga em pontos - clp
  cal_cargaok_eng:= clp_correntel + ((clp_correnteh - clp_correntel)*((cal_cargaok - sensor_correntel)/(sensor_correnteh - sensor_correntel)));
  spclpCorrEst.Text:= FloatToStr(trunc(cal_cargaok_eng));

  qrCalibragemEst.Close;
  qrCalibragemEst.SQL.Clear;
  qrCalibragemEst.SQL.Add('INSERT INTO CalibragemEst (nome_receita, sp_pressao, spclp_pressao, sp_temp, spclp_temp, sp_vaporon, spclp_vaporon, sp_vaporoff, spclp_vaporoff, sp_carga, spclp_carga,' );
  qrCalibragemEst.SQL.Add('sp_pressaoh, spclp_pressaoh, sp_pressaol, spclp_pressaol, sp_temph, spclp_temph, sp_templ, spclp_templ, sp_correnteh, spclp_correnteh, sp_correntel, spclp_correntel)');
  qrCalibragemEst.SQL.Add('VALUES (:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8,:p9,:p10,:p11,:p12,:p13,:p14,:p15,:p16,:p17,:p18,:p19,:p20,:p21,:p22,:p23)');
  qrCalibragemEst.Parameters.ParamByName('p1').Value:= 'esterilizador';
  qrCalibragemEst.Parameters.ParamByName('p2').Value:= cal_vaporok;
  qrCalibragemEst.Parameters.ParamByName('p3').Value:= cal_vaporok_eng;
  qrCalibragemEst.Parameters.ParamByName('p4').Value:= cal_tempok;
  qrCalibragemEst.Parameters.ParamByName('p5').Value:= cal_tempok_eng;
  qrCalibragemEst.Parameters.ParamByName('p6').Value:= cal_vaporon;
  qrCalibragemEst.Parameters.ParamByName('p7').Value:= cal_vaporon_eng;
  qrCalibragemEst.Parameters.ParamByName('p8').Value:= cal_vaporoff;
  qrCalibragemEst.Parameters.ParamByName('p9').Value:= cal_vaporoff_eng;
  qrCalibragemEst.Parameters.ParamByName('p10').Value:= cal_cargaok;
  qrCalibragemEst.Parameters.ParamByName('p11').Value:= cal_cargaok_eng;
  qrCalibragemEst.Parameters.ParamByName('p12').Value:= sensor_pressaoh;
  qrCalibragemEst.Parameters.ParamByName('p13').Value:= clp_pressaoh;
  qrCalibragemEst.Parameters.ParamByName('p14').Value:= sensor_pressaol;
  qrCalibragemEst.Parameters.ParamByName('p15').Value:= clp_pressaol;
  qrCalibragemEst.Parameters.ParamByName('p16').Value:= sensor_temph;
  qrCalibragemEst.Parameters.ParamByName('p17').Value:= clp_temph;
  qrCalibragemEst.Parameters.ParamByName('p18').Value:= sensor_templ;
  qrCalibragemEst.Parameters.ParamByName('p19').Value:= clp_templ;
  qrCalibragemEst.Parameters.ParamByName('p20').Value:= sensor_correnteh;
  qrCalibragemEst.Parameters.ParamByName('p21').Value:= clp_correnteh;
  qrCalibragemEst.Parameters.ParamByName('p22').Value:= sensor_correntel;
  qrCalibragemEst.Parameters.ParamByName('p23').Value:= clp_correntel;
  qrCalibragemEst.ExecSQL;

end;


procedure TFCalibragem.spPressEstExit(Sender: TObject);
begin
  //Atribui o valor na variavel de ajuste de sp da pressao esterilizacao
  cal_vaporok:= StrToFloat(spPressEst.Text);
end;

procedure TFCalibragem.spPressMaxExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  sensor_pressaoh:= StrToFloat(spPressMax.Text);
end;

procedure TFCalibragem.spPressMinExit(Sender: TObject);
begin
//Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  sensor_pressaol:= StrToFloat(spPressMin.Text);
end;

procedure TFCalibragem.spTempEstExit(Sender: TObject);
begin
  //Atribui o valor na variavel de ajuste de sp da temperatura esterilizacao
  cal_tempok:= StrToFloat(spTempEst.Text);
end;

procedure TFCalibragem.spTempMaxExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  sensor_temph:= StrToFloat(spTempMax.Text);
end;

procedure TFCalibragem.spTempMinExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  sensor_templ:= StrToFloat(spTempMin.Text);
end;

procedure TFCalibragem.spclpRangeInfCorrEstExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  clp_correntel:= StrToFloat(spclpRangeInfCorrEst.Text);
end;

procedure TFCalibragem.spclpRangeInfPressEstExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  clp_pressaol:= StrToFloat(spclpRangeInfPressEst.Text);
end;

procedure TFCalibragem.spclpRangeInfTempEstExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  clp_templ:= StrToFloat(spclpRangeInfTempEst.Text);
end;

procedure TFCalibragem.spclpRangeSupCorrEstExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  clp_correnteh:= StrToFloat(spclpRangeSupCorrEst.Text);
end;

procedure TFCalibragem.spclpRangeSupPressEstExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  clp_pressaoh:= StrToFloat(spclpRangeSupPressEst.Text);
end;

procedure TFCalibragem.spclpRangeSupTempEstExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  clp_temph:= StrToFloat(spclpRangeSupTempEst.Text);
end;

procedure TFCalibragem.spCorrEstExit(Sender: TObject);
begin
  //Atribui o valor na variavel de ajuste de sp da carga da esterilizacao
  cal_cargaok:= StrToFloat(spCorrEst.Text);
end;

procedure TFCalibragem.spCorrMaxExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  sensor_correnteh:= StrToFloat(spCorrMax.Text);
end;

procedure TFCalibragem.spCorrMinExit(Sender: TObject);
begin
  //Atribui o valor da grandeza fisica na varial de referenciamento dos pontos máximos do conversor AD do CLP
  sensor_correntel:= StrToFloat(spCorrMin.Text);
end;

procedure TFCalibragem.spVaporOffExit(Sender: TObject);
begin
  //Atribui o valor na variavel de ajuste de abertura do vapor
  cal_vaporoff:= StrToFloat(spVaporOff.Text);
end;

procedure TFCalibragem.spVaporOnExit(Sender: TObject);
begin
  //Atribui o valor na variavel de ajuste de abertura do vapor
  cal_vaporon:= StrToFloat(spVaporOn.Text);
end;

procedure TFCalibragem.FormShow(Sender: TObject);
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

  spclpRangeSupPressEst.Text:= qrCalibragemEst.FieldValues['spclp_pressaoh'];
  spclpRangeInfPressEst.Text:= qrCalibragemEst.FieldValues['spclp_pressaol'];

  spclpRangeSupTempEst.Text:= qrCalibragemEst.FieldValues['spclp_temph'];
  spclpRangeInfTEmpEst.Text:= qrCalibragemEst.FieldValues['spclp_templ'];

  spclpRangeSupCorrEst.Text:= qrCalibragemEst.FieldValues['spclp_correnteh'];
  spclpRangeInfCorrEst.Text:= qrCalibragemEst.FieldValues['spclp_correntel'];

  spPressMax.Text:= qrCalibragemEst.FieldValues['sp_pressaoh'];
  spPressMin.Text:= qrCalibragemEst.FieldValues['sp_pressaol'];

  spTempMax.Text:= qrCalibragemEst.FieldValues['sp_temph'];
  spTempMin.Text:= qrCalibragemEst.FieldValues['sp_templ'];

  spCorrMax.Text:= qrCalibragemEst.FieldValues['sp_correnteh'];
  spCorrMin.Text:= qrCalibragemEst.FieldValues['sp_correntel'];

  spPressEst.Text:= qrCalibragemEst.FieldValues['sp_pressao'];
  spclpPressEst.Text:= qrCalibragemEst.FieldValues['spclp_pressao'];

  spTempEst.Text:= qrCalibragemEst.FieldValues['sp_temp'];
  spclpTempEst.Text:= qrCalibragemEst.FieldValues['spclp_temp'];

  spCorrEst.Text:= qrCalibragemEst.FieldValues['sp_carga'];
  spclpCorrEst.Text:= qrCalibragemEst.FieldValues['spclp_carga'];

  spVaporOn.Text:= qrCalibragemEst.FieldValues['sp_vaporon'];
  spclpVaporOn.Text:= qrCalibragemEst.FieldValues['spclp_vaporon'];
  spVaporOff.Text:= qrCalibragemEst.FieldValues['sp_vaporoff'];
  spclpVaporOff.Text:= qrCalibragemEst.FieldValues['spclp_vaporoff'];

  FEsterilizacao.dp_vapor_on.Text:= spVaporOn.Text;
  FEsterilizacao.dp_vapor_off.Text:= spVaporOff.Text;
  FEsterilizacao.dp_carga_ok.Text:= SpCorrEst.Text;
end;

end.
