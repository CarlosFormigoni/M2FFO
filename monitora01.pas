unit monitora01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,System.Win.Registry,
  CPort;

type
  TFPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Empresa1: TMenuItem;
    Usurioesenha1: TMenuItem;
    ComunicaoDBA1: TMenuItem;
    Encerrar1: TMenuItem;
    Monitoramento1: TMenuItem;
    Relatrios1: TMenuItem;
    Cozimento1: TMenuItem;
    empodeOperao1: TMenuItem;
    empodeParadas1: TMenuItem;
    EficinciaOperacional1: TMenuItem;
    Ajuda1: TMenuItem;
    ManualdoSoftware1: TMenuItem;
    SobreoSistema1: TMenuItem;
    Digestores: TMenuItem;
    Esterilizacao1: TMenuItem;
    ConexaoPrincipal: TADOConnection;
    relEsterilizacao: TMenuItem;
    Engenharia1: TMenuItem;
    Calibragem1: TMenuItem;
    GerenciadorDBA1: TMenuItem;
    Calibragem2: TMenuItem;
    Drivercomunicao1: TMenuItem;
    Estoque1: TMenuItem;
    Silos1: TMenuItem;
    anques1: TMenuItem;
    Prensas1: TMenuItem;
    Pesagens1: TMenuItem;
    Entrada1: TMenuItem;
    Fluxo1: TMenuItem;
    Ensacadeiras1: TMenuItem;
    Timer2: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Iniciar1Click(Sender: TObject);
    procedure SobreoSistema1Click(Sender: TObject);
    procedure Encerrar1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Usurioesenha1Click(Sender: TObject);
    procedure ComunicaoDBA1Click(Sender: TObject);
    procedure Calibrao1Click(Sender: TObject);
    procedure Visualizaoengenharia1Click(Sender: TObject);
    procedure Cozimento1Click(Sender: TObject);
    procedure empodeOperao1Click(Sender: TObject);
    procedure empodeParadas1Click(Sender: TObject);
    procedure EficinciaOperacional1Click(Sender: TObject);
    procedure ManualdoSoftware1Click(Sender: TObject);
    procedure DigestoresClick(Sender: TObject);
    procedure Esterilizacao1Click(Sender: TObject);
    procedure relEsterilizacaoClick(Sender: TObject);
    procedure Calibragem1Click(Sender: TObject);
    procedure GerenciadorDBA1Click(Sender: TObject);
    procedure Drivercomunicao1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure verifica_com;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   rxdataWords: array[0..1023] of word;
   tag_pre,tag_t1 : word;
   contador_minuto : integer;
   porta_com : string;
  end;

const
  DLL_API='Modbus_RTU.dll';

var
  FPrincipal: TFPrincipal; conta_valores : integer = 0;
  valoresP,valoresT : array[1..10] of word;

Function OpenCom(ComNo: integer): integer;stdcall;external DLL_API;
Function CloseCom(): bool;stdcall;external DLL_API;
Function SetBaudRate(BaudRate: integer): integer;stdcall;external DLL_API;
Function readMW(PLCaddr: integer; MWaddr: integer; length: integer; var buff): integer;stdcall;external DLL_API;
procedure setReadDelay(ADelayTime: integer);stdcall;external DLL_API;

implementation

{$R *.dfm}

uses monitora02, monitora03, monitora04, monitora05, monitora06, monitora07,
  monitora08, monitora09, monitora10, m2rendsys11, m2rendsys12, m2rendsys13,
  m2rendsys14;

procedure  TFPrincipal.verifica_com;
var mediaP,mediaT : real;  i : integer;
begin
   inc(conta_valores);
   valoresP[conta_valores] := tag_Pre;
   valoresT[conta_valores] := tag_T1;
   if conta_valores = 10 then
   begin
      conta_valores := 0;
      sleep(1000);
      for i := 1 to 10 do
        begin
           mediaP := mediaP + valoresP[i];
           mediaT := mediaT + valoresT[i];
        end;
        mediaP := mediaP/10;
        mediaT := mediaT/10;
        if ((mediaP = tag_Pre) and (mediaT = tag_t1)) then
           begin
             panel2.Caption := ' Comunicação Interrompida';
             panel2.Color := clRed;
           end
             else
                begin
                    for i := 1 to 10 do
                    begin
                     valoresP[i] := 0;
                     valoresT[i] := 0;
                     end;
                     panel2.Caption := ' Comunicação Ativa';
                     panel2.Color := clLime;
                end;
   end;

end;

procedure TFPrincipal.Calibragem1Click(Sender: TObject);
begin
    //Chama o form de calibragem
    FCalibragem.showmodal;
end;

procedure TFPrincipal.Calibrao1Click(Sender: TObject);
begin
  // calibração
end;

procedure TFPrincipal.ComunicaoDBA1Click(Sender: TObject);
begin
  // comunicação DBA
  form7.showmodal;
end;

procedure TFPrincipal.Cozimento1Click(Sender: TObject);
begin
 // relatorio de cozimento
 FRelatorioDigestores.showmodal;
end;

procedure TFPrincipal.DigestoresClick(Sender: TObject);
begin
  //Chama Form de monitoramento dos digestores
  FDigestores.showmodal;
end;

procedure TFPrincipal.Drivercomunicao1Click(Sender: TObject);
begin
 //Chama Form de configuração do MODBUS
 FConfiguracaoDriver.showmodal;
end;

procedure TFPrincipal.EficinciaOperacional1Click(Sender: TObject);
begin
  // relatorio de eficiencia operacional
end;

procedure TFPrincipal.empodeOperao1Click(Sender: TObject);
begin
  // relatorio de tempo de operação
end;

procedure TFPrincipal.empodeParadas1Click(Sender: TObject);
begin
  //  relatorio de tempo de parada
end;

procedure TFPrincipal.Empresa1Click(Sender: TObject);
begin
  // sistema -- empresa
  form5.showmodal;
end;

procedure TFPrincipal.Encerrar1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente encerrar ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then application.Terminate;
end;

procedure TFPrincipal.Esterilizacao1Click(Sender: TObject);
begin
  //Chama Form de monitoramento da esterilizacao
  FEsterilizacao.showmodal;
end;

procedure TFPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   timer2.Enabled := false;
   CloseCom;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
   panel2.Left := statusbar1.Left+550;
   panel2.Top := statusbar1.Top+123;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
var
  NomeArquivo: string;
  f: TextFile;
begin
  contador_minuto := 0;
  NomeArquivo := ExtractFilePath(ParamStr(0))+'\wincom.dll';
  if not FileExists(NomeArquivo) then
    raise Exception.CreateFmt(' Erro de comunicação 1. Configure o sistema',[]);
  AssignFile(f, NomeArquivo);
  Reset(f);
  try
     readln(f,porta_com);
     if OpenCom(strtoint(trim(porta_com))) > 0 then
     begin
      SetBaudRate(19200);
      SetReadDelay(20);
      timer2.Enabled := true;
     end;
  finally
    CloseFile(f);
  end;

end;

procedure TFPrincipal.GerenciadorDBA1Click(Sender: TObject);
begin
  //Abre o gerenciador de bateladas esterilizador
  FGerenciadorEst.showmodal;
end;

procedure TFPrincipal.Iniciar1Click(Sender: TObject);
begin
  form2.showmodal;
end;

procedure TFPrincipal.ManualdoSoftware1Click(Sender: TObject);
begin
  // manual do software
end;

procedure TFPrincipal.Novo1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFPrincipal.relEsterilizacaoClick(Sender: TObject);
begin
    //Chama form de consulta de esterilizacoes
    FRelatorioEst.showmodal;
end;

procedure TFPrincipal.SobreoSistema1Click(Sender: TObject);
begin
     // sobre o sistema
     form4.showmodal;
end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
begin
  statusbar1.Panels[0].Text := datetostr(date());
  statusbar1.Panels[1].Text := timetostr(time());
end;

procedure TFPrincipal.Timer2Timer(Sender: TObject);
var  i: integer;
begin
    if(readMW(100,1,40,rxdataWords) > 0) then  // 100 -> endereco do CLP
    begin
       tag_pre :=  rxdataWords[13];
       tag_t1 :=  rxdataWords[14];
       label1.Caption  := inttostr(tag_pre);
       label2.Caption := inttostr(tag_t1);
       verifica_com;
    end;
  inc(contador_minuto);
  if (contador_minuto = 3) then
  begin
    contador_minuto := 0;
    for i := 0 to 1023 do rxdataWords[i] := 0;
    panel1.Caption := 'Pressao = '+inttostr(tag_pre)+
                          '  Temperatura = '+ inttostr(tag_t1);
    end;
end;

procedure TFPrincipal.Usurioesenha1Click(Sender: TObject);
begin
   // usuario e senha
   form6.showmodal;
end;

procedure TFPrincipal.Visualizaoengenharia1Click(Sender: TObject);
begin
  // visualização engenharia
end;

end.
