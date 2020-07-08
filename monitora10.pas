unit monitora10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.StdCtrls, Vcl.Buttons;

type
  TFRelatorioEst = class(TForm)
    tblDados: TDBGrid;
    srcConsulta: TDataSource;
    qrConsulta: TADOQuery;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    txBatelada: TEdit;
    Label3: TLabel;
    btConsultar: TBitBtn;
    btnPrincipal: TSpeedButton;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    tblListaEst: TDBGrid;
    srcListaEst: TDataSource;
    qrListaEst: TADOQuery;
    Label4: TLabel;
    procedure btnPrincipalClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure tblListaEstCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioEst: TFRelatorioEst;

implementation

{$R *.dfm}

procedure TFRelatorioEst.btConsultarClick(Sender: TObject);
var
nbatelada: integer;
begin
  //Executa a consulta SQL - referencia de batelada e esterilizador

  nbatelada:= StrToInt(txBatelada.Text);

  QrConsulta.Close;
  QrConsulta.SQL.Clear;
  qrConsulta.SQL.Add('SELECT * FROM Esterilizacao WHERE batelada = :p1');
  qrConsulta.Parameters.ParamByName('p1').Value:= nbatelada;
  qrConsulta.Open;

end;

procedure TFRelatorioEst.btnPrincipalClick(Sender: TObject);
begin
  //Fecha o form atual e retorna para a tela principal
  FRelatorioEst.Close;
end;

procedure TFRelatorioEst.tblListaEstCellClick(Column: TColumn);
var
nbatelada: integer;
begin
  //Executa a consulta SQL - referencia de batelada e esterilizador
  txBatelada.Text:= tblListaEst.Fields[0].Text;
  nbatelada:= StrToInt(txBatelada.Text);

  QrConsulta.Close;
  QrConsulta.SQL.Clear;
  qrConsulta.SQL.Add('SELECT * FROM Esterilizacao WHERE batelada = :p1');
  qrConsulta.Parameters.ParamByName('p1').Value:= nbatelada;
  qrConsulta.Open;

end;

end.
