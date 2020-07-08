unit m2rendsys12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Buttons, Vcl.ComCtrls, DateUtils, Vcl.Grids, Vcl.DBGrids;

type
  TFGerenciadorEst = class(TForm)
    btnGerarEst: TBitBtn;
    srcInsertEst: TDataSource;
    qrInsertEst: TADOQuery;
    ConfDataEst: TEdit;
    ConfHoraEst: TEdit;
    SelDataEst: TDateTimePicker;
    SelHoraEst: TDateTimePicker;
    txNumBatelada: TEdit;
    grDadosInseridos: TDBGrid;
    qrConsultaEstg: TADOQuery;
    srcConsultaEstg: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    txSpPressaoEstg: TEdit;
    Label7: TLabel;
    txSpTempEstg: TEdit;
    btnValidarEst: TBitBtn;
    btnPrincipal: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure btnGerarEstClick(Sender: TObject);
    procedure SelHoraEstChange(Sender: TObject);
    procedure SelDataEstChange(Sender: TObject);
    procedure txNumBateladaExit(Sender: TObject);
    procedure txSpPressaoEstgChange(Sender: TObject);
    procedure txSpTempEstgChange(Sender: TObject);
    procedure btnValidarEstClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPrincipalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  batelada_g: integer;
  pressao_g, temp_g, corrente_g, pesocarga_g: real;
  FGerenciadorEst: TFGerenciadorEst;

implementation

{$R *.dfm}

procedure TFGerenciadorEst.btnValidarEstClick(Sender: TObject);
var
tempv, pressv: integer;
begin
  //Confere o valor da variavel temperatura
  if temp_g < 92 then
  begin
  MessageDlg('Temperatura baixa',mtInformation, [mbOk], 0);
  txSpTempEstg.SetFocus;
  txSpTempEstg.Text:= '0,0 ';
  tempv:= 0;
  end;

  if temp_g > 102 then
  begin
  MessageDlg('Temperatura elevada',mtInformation, [mbOk], 0);
  txSpTempEstg.SetFocus;
  txSpTempEstg.Text:= '0,0';
  tempv:= 0;
  end;

   //Confere o valor da variavel temperatura
  if pressao_g < 1.2 then
  begin
  MessageDlg('Pressão baixa',mtInformation, [mbOk], 0);
  txSpPressaoEstg.SetFocus;
  txSpPressaoEstg.Text:= '1,0 ';
  pressv:= 0;
  end;

  if pressao_g > 1.5 then
  begin
  MessageDlg('Pressão elevada',mtInformation, [mbOk], 0);
  txSpPressaoEstg.SetFocus;
  txSpPressaoEstg.Text:= '1,0';
  pressv:= 0;
  end;

  //Variaveis validadas liberar btnGerar
  if (temp_g >92) and (temp_g <102) then
  begin
  tempv:= 1;
  end;
  if (pressao_g >1.2) and (pressao_g <1.5) then
  begin
  pressv:= 1;
  end;

  if (pressv = 1) and (tempv = 1) then
  begin
    btnGerarEst.Enabled:= true;
  end else
  begin
    btnGerarEst.Enabled:= false;
  end;

end;

procedure TFGerenciadorEst.BitBtn1Click(Sender: TObject);
begin
  //Consulta ultima batelada registrada

  qrConsultaEstg.Close;
  qrConsultaEstg.SQL.Clear;
  qrConsultaEstg.SQL.Add('SELECT TOP 1 batelada FROM Esterilizacao ORDER BY batelada DESC');
  qrConsultaEstg.Open;

  txNumBatelada.Text:= IntToStr(qrConsultaEstg.FieldValues['batelada']);

  qrConsultaEstg.Close;
  qrConsultaEstg.SQL.Clear;
  qrConsultaEstg.SQL.Add('SELECT * FROM Esterilizacao WHERE batelada = :batelada');
  qrConsultaEstg.Parameters.ParamByName('batelada').Value:= txNumBatelada.Text;
  qrConsultaEstg.Open;

end;

procedure TFGerenciadorEst.btnGerarEstClick(Sender: TObject);
var
n, i, marca1_g, marca2_g, count: integer;
pressao_g, temp_g, corrente_g, pesocarga_g: real;
fase_g, dh_inicio_g : string;
datahora_g, horag, datag, datahora_gf, data_gf, hora_gf: TDateTime;
horarelg, minutorelg, segundorelg, mseg: Word;
dia, mes, ano : Word;

begin
  //Posiciona variaveis de controle da rotina
  n := 0;
  count := 0;
  corrente_g := 33.7;
  pesocarga_g := 4700.1;
  fase_g := 'PARADO';
  marca1_g := 0;
  marca2_g := 2000;
  pressao_g := StrToFloat(txspPressaoEstg.Text);
  temp_g := StrToFloat(txspTempEstg.Text);

  //Decodifica a data e a hora para alterações
  datag:= SelDataEst.Date;
  horag:= SelHoraEst.Time;
  DecodeDate (datag, Ano, Mes, Dia);
  DecodeTime (horag, horarelg, minutorelg, segundorelg, mseg);
  hora_gf := EncodeTime (horarelg, minutorelg, segundorelg, mseg);

  //Captura a data e hora selecionadas
  dh_inicio_g := DateToStr(datag)+ ' '+ TimeToStr(horag);


  //Rotina de inserir dados de processo manual

  While n<= 38 Do
  begin
    //Fase de pressurização
    If (n>= 1) and (n<= 5) then
    begin
    fase_g:= 'PRESSURIZANDO';
    qrInsertEst.Close;
    qrInsertEst.SQL.Clear;
    qrInsertEst.SQL.Add('Insert INTO Esterilizacao (batelada, datahora, pressao, temperatura, fase, dh_processo, marca1, marca2, corrente, peso_carga)');
    qrInsertEst.SQL.Add('values (:batelada_g, :datahora_g, :pressao_g, :temperatura_g, :fase_g, :dh_inicio_g, :marca1_g, :marca2_g, :corrente_g, :pesocarga_g)');
    //Parametros do processo de esterilizacao  - Fase Pressurizando
    qrInsertEst.Parameters.ParamByName('datahora_g').Value:= ''+FormatDateTime('dd/mm/yyyy',datag)+ ' ' + FormatDateTime('tt',hora_gf)+'';
    qrInsertEst.Parameters.ParamByName('batelada_g').Value:= batelada_g;
    qrInsertEst.Parameters.ParamByName('pressao_g').Value:= pressao_g;
    qrInsertEst.Parameters.ParamByName('temperatura_g').Value:= temp_g;
    qrInsertEst.Parameters.ParamByName('fase_g').Value:= fase_g;
    qrInsertEst.Parameters.ParamByName('dh_inicio_g').Value:= dh_inicio_g;
    qrInsertEst.Parameters.ParamByName('marca1_g').Value:= marca1_g;
    qrInsertEst.Parameters.ParamByName('marca2_g').Value:= marca2_g;
    qrInsertEst.Parameters.ParamByName('corrente_g').Value:= corrente_g;
    qrInsertEst.Parameters.ParamByName('pesocarga_g').Value:= pesocarga_g;

    qrInsertEst.ExecSQL;

    hora_gf:= IncMinute(hora_gf) ;
    temp_g:= temp_g + 6.4;
    pressao_g:= pressao_g + 0.41

    end;
    //Ponto de mudança de fase
    If n=6 then
    begin
    fase_g:= 'ESTERILIZANDO';
    temp_g:= 133;
    qrInsertEst.Close;
    qrInsertEst.SQL.Clear;
    qrInsertEst.SQL.Add('Insert INTO Esterilizacao (batelada, datahora, pressao, temperatura, fase, dh_processo, marca1, marca2, corrente, peso_carga)');
    qrInsertEst.SQL.Add('values (:batelada_g, :datahora_g, :pressao_g, :temperatura_g, :fase_g, :dh_inicio_g, :marca1_g, :marca2_g, :corrente_g, :pesocarga_g)');
    //Parametros do processo de esterilizacao  - Fase Esterilizando
    qrInsertEst.Parameters.ParamByName('datahora_g').Value:= ''+FormatDateTime('dd/mm/yyyy',datag)+ ' ' + FormatDateTime('tt',hora_gf)+'';
    qrInsertEst.Parameters.ParamByName('batelada_g').Value:= batelada_g;
    qrInsertEst.Parameters.ParamByName('pressao_g').Value:= pressao_g;
    qrInsertEst.Parameters.ParamByName('temperatura_g').Value:= temp_g;
    qrInsertEst.Parameters.ParamByName('fase_g').Value:= fase_g;
    qrInsertEst.Parameters.ParamByName('dh_inicio_g').Value:= dh_inicio_g;
    qrInsertEst.Parameters.ParamByName('marca1_g').Value:= marca1_g;
    qrInsertEst.Parameters.ParamByName('marca2_g').Value:= marca2_g;
    qrInsertEst.Parameters.ParamByName('corrente_g').Value:= corrente_g;
    qrInsertEst.Parameters.ParamByName('pesocarga_g').Value:= pesocarga_g;

    qrInsertEst.ExecSQL;

    hora_gf:= IncMinute(hora_gf) ;
    pressao_g:= pressao_g + 0.05;
    temp_g:= temp_g + 1.1;
    end;
    //Fase de esterilização
    If (n>=7) and (n<=26) then
    begin
    fase_g:= 'ESTERILIZANDO';
    marca1_g:= 2000;
    qrInsertEst.Close;
    qrInsertEst.SQL.Clear;
    qrInsertEst.SQL.Add('Insert INTO Esterilizacao (batelada, datahora, pressao, temperatura, fase, dh_processo, marca1, marca2, corrente, peso_carga)');
    qrInsertEst.SQL.Add('values (:batelada_g, :datahora_g, :pressao_g, :temperatura_g, :fase_g, :dh_inicio_g, :marca1_g, :marca2_g, :corrente_g, :pesocarga_g)');
    //Parametros do processo de esterilizacao  - Fase Esterilizando
    qrInsertEst.Parameters.ParamByName('datahora_g').Value:= ''+FormatDateTime('dd/mm/yyyy',datag)+ ' ' + FormatDateTime('tt',hora_gf)+'';
    qrInsertEst.Parameters.ParamByName('batelada_g').Value:= batelada_g;
    qrInsertEst.Parameters.ParamByName('pressao_g').Value:= pressao_g;
    qrInsertEst.Parameters.ParamByName('temperatura_g').Value:= temp_g;
    qrInsertEst.Parameters.ParamByName('fase_g').Value:= fase_g;
    qrInsertEst.Parameters.ParamByName('dh_inicio_g').Value:= dh_inicio_g;
    qrInsertEst.Parameters.ParamByName('marca1_g').Value:= marca1_g;
    qrInsertEst.Parameters.ParamByName('marca2_g').Value:= marca2_g;
    qrInsertEst.Parameters.ParamByName('corrente_g').Value:= corrente_g;
    qrInsertEst.Parameters.ParamByName('pesocarga_g').Value:= pesocarga_g;

    qrInsertEst.ExecSQL;

    hora_gf:= IncMinute(hora_gf) ;
    temp_g:= temp_g + 0.2;
    pressao_g:= pressao_g + 0.01
    end;
    //Ponto de mudança de fase
    If n=27 then
    begin
    fase_g:= 'ESTERILIZANDO';
    marca2_g:= 0;
    pressao_g:= 3;
    qrInsertEst.Close;
    qrInsertEst.SQL.Clear;
    qrInsertEst.SQL.Add('Insert INTO Esterilizacao (batelada, datahora, pressao, temperatura, fase, dh_processo, marca1, marca2, corrente, peso_carga)');
    qrInsertEst.SQL.Add('values (:batelada_g, :datahora_g, :pressao_g, :temperatura_g, :fase_g, :dh_inicio_g, :marca1_g, :marca2_g, :corrente_g, :pesocarga_g)');
    //Parametros do processo de esterilizacao  - Fase Aliviando
    qrInsertEst.Parameters.ParamByName('datahora_g').Value:= ''+FormatDateTime('dd/mm/yyyy',datag)+ ' ' + FormatDateTime('tt',hora_gf)+'';
    qrInsertEst.Parameters.ParamByName('batelada_g').Value:= batelada_g;
    qrInsertEst.Parameters.ParamByName('pressao_g').Value:= pressao_g;
    qrInsertEst.Parameters.ParamByName('temperatura_g').Value:= temp_g;
    qrInsertEst.Parameters.ParamByName('fase_g').Value:= fase_g;
    qrInsertEst.Parameters.ParamByName('dh_inicio_g').Value:= dh_inicio_g;
    qrInsertEst.Parameters.ParamByName('marca1_g').Value:= marca1_g;
    qrInsertEst.Parameters.ParamByName('marca2_g').Value:= marca2_g;
    qrInsertEst.Parameters.ParamByName('corrente_g').Value:= corrente_g;
    qrInsertEst.Parameters.ParamByName('pesocarga_g').Value:= pesocarga_g;

    qrInsertEst.ExecSQL;

    hora_gf:= IncMinute(hora_gf) ;
    temp_g:= temp_g - 2.3;
    pressao_g:= pressao_g - 0.02;
    end;
    //Fase aliviando
    If (n>=28) and (n<=37) then
    begin
    fase_g:= 'ALIVIANDO';
    qrInsertEst.Close;
    qrInsertEst.SQL.Clear;
    qrInsertEst.SQL.Add('Insert INTO Esterilizacao (batelada, datahora, pressao, temperatura, fase, dh_processo, marca1, marca2, corrente, peso_carga)');
    qrInsertEst.SQL.Add('values (:batelada_g, :datahora_g, :pressao_g, :temperatura_g, :fase_g, :dh_inicio_g, :marca1_g, :marca2_g, :corrente_g, :pesocarga_g)');
    //Parametros do processo de esterilizacao  - Fase Alivio
    qrInsertEst.Parameters.ParamByName('datahora_g').Value:= ''+FormatDateTime('dd/mm/yyyy',datag)+ ' ' + FormatDateTime('tt',hora_gf)+'';
    qrInsertEst.Parameters.ParamByName('batelada_g').Value:= batelada_g;
    qrInsertEst.Parameters.ParamByName('pressao_g').Value:= pressao_g;
    qrInsertEst.Parameters.ParamByName('temperatura_g').Value:= temp_g;
    qrInsertEst.Parameters.ParamByName('fase_g').Value:= fase_g;
    qrInsertEst.Parameters.ParamByName('dh_inicio_g').Value:= dh_inicio_g;
    qrInsertEst.Parameters.ParamByName('marca1_g').Value:= marca1_g;
    qrInsertEst.Parameters.ParamByName('marca2_g').Value:= marca2_g;
    qrInsertEst.Parameters.ParamByName('corrente_g').Value:= corrente_g;
    qrInsertEst.Parameters.ParamByName('pesocarga_g').Value:= pesocarga_g;

    qrInsertEst.ExecSQL;

    hora_gf:= IncMinute(hora_gf) ;
    temp_g:= temp_g - 0.7;
    pressao_g:= pressao_g - 0.18
    end;

    count := count+1;
    n:=n+1;

  end;
  //Notificação de batelada inserida com sucesso
  if n > 38 then
  begin
    qrConsultaEstg.ExecSQL;
    grDadosInseridos.Refresh;
    MessageDlg('Batelada gerada',mtInformation, [mbOk], 0);
  end;


end;

procedure TFGerenciadorEst.btnPrincipalClick(Sender: TObject);
begin
  //Fecha a tela atual
  FGerenciadorEst.Close;
end;

procedure TFGerenciadorEst.SelDataEstChange(Sender: TObject);
begin
 //Envia a data para campo de visualização
 ConfDataEst.Text := DateToStr(SelDataEst.Date);
end;

procedure TFGerenciadorEst.SelHoraEstChange(Sender: TObject);
begin
  //Envia a hora para campo de visualização
  ConfHoraEst.Text := TimeToStr(SelHoraEst.Time);
end;

procedure TFGerenciadorEst.txNumBateladaExit(Sender: TObject);
begin
  //Atribui valor da batelada na variável
  batelada_g:=StrToInt(txNumBatelada.Text);
end;

procedure TFGerenciadorEst.txSpPressaoEstgChange(Sender: TObject);
begin
  //Atribui o valor para a variavel pressao g
  pressao_g:= StrToFloat(txSpPressaoEstg.Text);
end;

procedure TFGerenciadorEst.txSpTempEstgChange(Sender: TObject);
begin
  //Atribui o valor para a variavel pressao g
  temp_g:= StrToFloat(txSpTempEstg.Text);

end;


end.
