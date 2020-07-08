unit m2rendsys13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart;

type
  TFRelatorioDigestores = class(TForm)
    btnPrincipal: TSpeedButton;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    TblDados: TDBGrid;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    txDigestor: TEdit;
    srcConsulta: TDataSource;
    qrConsulta: TADOQuery;
    btConsultarDigestor: TBitBtn;
    grBateladasCozimento: TDBGrid;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    txBatelada: TEdit;
    btConsultarBatelada: TBitBtn;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txDataInicial: TEdit;
    txDataFinal: TEdit;
    btConsultarData: TBitBtn;
    qrListagemCozimento: TADOQuery;
    srcListagemCozimento: TDataSource;
    Label5: TLabel;
    txDigestor1: TEdit;
    procedure btConsultarDigestorClick(Sender: TObject);
    procedure btConsultarDataClick(Sender: TObject);
    procedure btConsultarBateladaClick(Sender: TObject);
    procedure btnPrincipalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioDigestores: TFRelatorioDigestores;

implementation

{$R *.dfm}

procedure TFRelatorioDigestores.btConsultarBateladaClick(Sender: TObject);
var
nbatelada, digestor: integer;
begin

  //Carrega os dados da batelada deseja com o codigo e o digestor
  nbatelada:= StrToInt(txBatelada.Text);
  digestor:= StrToInt(txDigestor1.Text);

  qrListagemCozimento.Close;
  qrListagemCozimento.SQL.Clear;
  qrListagemCOzimento.SQL.Add('SELECT * FROM Cozimento WHERE digestor = :p1 AND batelada = :p2');
  qrListagemCozimento.Parameters.ParamByName('p1').Value:= digestor;
  qrListagemCozimento.Parameters.ParamByName('p2').Value:= nbatelada;
  qrListagemCozimento.Open;

end;

procedure TFRelatorioDigestores.btConsultarDataClick(Sender: TObject);
var
data1, data2: TDateTime;
begin


  //Gera a lista de bateladas registradas filtradas por período

  data1:= StrToDate(txDataInicial.Text);
  data2:= StrToDate(txDataFinal.Text);

  qrListagemCozimento.Close;
  qrListagemCozimento.SQL.Clear;
  qrListagemCOzimento.SQL.Add('SELECT * FROM Cozimento WHERE dh_inicio BETWEEN :p1 AND :p2 ');
  qrListagemCozimento.Parameters.ParamByName('p1').Value:= data1;
  qrListagemCozimento.Parameters.ParamByName('p2').Value:= data2;
  qrListagemCozimento.Open;


end;

procedure TFRelatorioDigestores.btConsultarDigestorClick(Sender: TObject);
var
digestor: integer;
begin
  //Gera a lista de bateladas registradas filtradas por digestor

  digestor:= StrToInt(txDigestor.Text);

  qrListagemCozimento.Close;
  qrListagemCozimento.SQL.Clear;
  qrListagemCOzimento.SQL.Add('SELECT * FROM Cozimento WHERE digestor = :p1');
  qrListagemCozimento.Parameters.ParamByName('p1').Value:= digestor;
  qrListagemCozimento.Open;


end;

procedure TFRelatorioDigestores.btnPrincipalClick(Sender: TObject);
begin
  //Fecha o form atual
  FRelatorioDigestores.Close;
end;

end.
