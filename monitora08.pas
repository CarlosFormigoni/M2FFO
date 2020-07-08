unit monitora08;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Buttons;

type
  TFDigestores = class(TForm)
    Digestor1: TImage;
    Image1: TImage;
    Image2: TImage;
    dpTempD01: TEdit;
    dpTempD02: TEdit;
    dpTempD03: TEdit;
    tb_vaporgeral: TShape;
    dpPressaoLinha: TEdit;
    tb_vaporgeral_d01: TShape;
    tb_vaporgeral_d02: TShape;
    tb_vaporgeral_d03: TShape;
    vv_vapor_d01: TImage;
    tb_vaporgeral3: TShape;
    tb_vapord01: TShape;
    tb_vapord02: TShape;
    vv_vapor_d02: TImage;
    Shape2: TShape;
    tb_vapord03: TShape;
    vv_vapor_d03: TImage;
    Shape4: TShape;
    mtDigestor01: TImage;
    mtDigestor02: TImage;
    mtDigestor03: TImage;
    dpFaseD01: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    txCorrenteD01: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    percoladora: TShape;
    mtPercoladora: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnPrincipal: TSpeedButton;
    btnTanques: TSpeedButton;
    btnSilos: TSpeedButton;
    Image6: TImage;
    Shape3: TShape;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Shape5: TShape;
    Shape6: TShape;
    Image11: TImage;
    Shape7: TShape;
    Image12: TImage;
    Shape8: TShape;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Label7: TLabel;
    Edit9: TEdit;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure btnPrincipalClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDigestores: TFDigestores;  contador : integer = 0;

implementation

{$R *.dfm}

uses monitora01;


procedure TFDigestores.btnPrincipalClick(Sender: TObject);
begin
  //Fecha o form atual
  FDigestores.Close;
end;

procedure TFDigestores.Timer1Timer(Sender: TObject);
begin
  inc(contador);
  if contador = 30 then  contador := 0;
   panel1.Caption := fprincipal.Label1.Caption +'  '+fprincipal.Label2.Caption


end;

end.
