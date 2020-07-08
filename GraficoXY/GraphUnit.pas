unit GraphUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Graph, CheckLst;

type
  TGraphForm = class(TForm)
    Graph: TXYGraph;
    ViewListBox: TCheckListBox;
    PanListBox: TCheckListBox;
    StatusPanel: TPanel;
    ModeText: TStaticText;
    ModeLabel: TLabel;
    CurveText: TStaticText;
    CurveLabel: TLabel;
    ColorPanel: TPanel;
    IndexText: TStaticText;
    IndexLabel: TLabel;
    XEdit: TEdit;
    YEdit: TEdit;
    XEditText: TStaticText;
    YEditText: TStaticText;
    DemoGroupBox: TGroupBox;
    Sinus: TButton;
    Cosinus: TButton;
    Parameter: TButton;
    Spiral: TButton;
    Lissajous: TButton;
    Infinitive: TButton;
    Loop: TButton;
    Fish: TButton;
    Diamond: TButton;
    SaveLoadGroupBox: TGroupBox;
    SaveCurveButton: TButton;
    SaveGraphButton: TButton;
    LoadCurveButton: TButton;
    LoadGraphButton: TButton;
    DXFButton: TButton;
    AngleLabel: TLabel;
    AngleText: TStaticText;
    OptionGroupBox: TGroupBox;
    AspectRatio: TCheckBox;
    MainGrid: TCheckBox;
    SubGrid: TCheckBox;
    HintPanel: TCheckBox;
    ControlGroupBox: TGroupBox;
    ClearButton: TButton;
    Reset: TButton;
    PanButton: TButton;
    ViewButton: TButton;
    ModeBox: TGroupBox;
    ModeNone: TRadioButton;
    ModeCursor: TRadioButton;
    ModeMove: TRadioButton;
    ModeInsert: TRadioButton;
    ModeDelete: TRadioButton;
    procedure SinusClick(Sender: TObject);
    procedure CosinusClick(Sender: TObject);
    procedure ParameterClick(Sender: TObject);
    procedure SpiralClick(Sender: TObject);
    procedure LissajousClick(Sender: TObject);
    procedure InfinitiveClick(Sender: TObject);
    procedure LoopClick(Sender: TObject);
    procedure FishClick(Sender: TObject);
    procedure DiamondClick(Sender: TObject);
    procedure SaveCurveButtonClick(Sender: TObject);
    procedure SaveGraphButtonClick(Sender: TObject);
    procedure LoadCurveButtonClick(Sender: TObject);
    procedure LoadGraphButtonClick(Sender: TObject);
    procedure DXFButtonClick(Sender: TObject);
  private
  public
    { Public-Deklarationen }
  end;

var
  GraphForm: TGraphForm;

implementation

{$R *.DFM}

function DtR(Deg: TFloat): TFloat;
begin
  DtR:=(Deg * Pi) / 180;
end;

procedure TGraphForm.SinusClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Sinus',clLime,1,psSolid,True);
  for I:=-180 to 180 do Graph.AddPoint(H,I,Sin(I * Pi / 180) * 50);
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.SetCurveFont(H,'arial',7,[fsItalic]);
  Graph.SetMarkSize(H,3);
  Graph.AddMark(H,0,mtCross,clWhite);
  Graph.AddText(H,0,4,-5,'0°',clWhite);
  Graph.AddMark(H,45,mtCross,clWhite);
  Graph.AddText(H,45,4,-5,'45°',clWhite);
  Graph.AddMark(H,90,mtCross,clWhite);
  Graph.AddText(H,90,-5,-14,'90°',clWhite);
  Graph.AddMark(H,135,mtCross,clWhite);
  Graph.AddText(H,135,-22,-5,'135°',clWhite);
  Graph.AddMark(H,180,mtCross,clWhite);
  Graph.AddText(H,180,-22,-5,'180°',clWhite);
  Graph.AddMark(H,225,mtCross,clWhite);
  Graph.AddText(H,225,-22,-6,'225°',clWhite);
  Graph.AddMark(H,270,mtCross,clWhite);
  Graph.AddText(H,270,-8,6,'270°',clWhite);
  Graph.AddMark(H,315,mtCross,clWhite);
  Graph.AddText(H,315,-24,-5,'315°',clWhite);
  Graph.AddMark(H,360,mtCross,clWhite);
  Graph.AddText(H,360,-24,-6,'360°',clWhite);
  Graph.Paint;
end;

procedure TGraphForm.CosinusClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Cosinus',clRed,1,psSolid,True);
  for I:=-180 to 180 do Graph.AddPoint(H,I,Cos(I * Pi / 180) * 50);
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.Paint;
end;

procedure TGraphForm.ParameterClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Parameter',clYellow,1,psSolid,True);
  for I:=-180 to 180 do Graph.AddPoint(H,Sin(2 * Dtr(I))* 180,Sin(3 * Dtr(I)) * 50);
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.Paint;
end;

procedure TGraphForm.SpiralClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Spiral',clWhite,1,psSolid,True);
  for I:=0 to 360 do Graph.AddPoint(H,I * Cos(I / 10) / 2.5,I * Sin(I / 10) / 7);
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.Paint;
end;

procedure TGraphForm.LissajousClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Lissajous',clFuchsia,1,psSolid,True);
  for I:=-180 to 180 do Graph.AddPoint(H,Sin(4 * 2 * Pi * (I / 360)) * 180,
                                       Cos(5 * 2 * Pi * (I / 360)) * 50);
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.Paint;
end;

procedure TGraphForm.InfinitiveClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Invinitive',clBlue,1,psSolid,True);
  for I:=0 to 314 do Graph.AddPoint(H,180 * Sin(I / 50),50 * Sin(I / 25));
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.Paint;
end;

procedure TGraphForm.LoopClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Loop',clTeal,1,psSolid,True);
  for I:=-180 to 180 do Graph.AddPoint(H,50 * (I / 50 - Sin(4 * I / 50)),
                                       10 * (- (22 / 10) * Cos(4 * I / 50)));
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.Paint;
end;

procedure TGraphForm.FishClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Fish',clLime,1,psSolid,True);
  for I:=-314 to 314 do Graph.AddPoint(H,135 - 100 * 3 / 2 * Cos(I / 100) *
                                       (Cos(I / 100) + 1),20 * 2 * Sin(I / 50));
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.Paint;
end;

procedure TGraphForm.DiamondClick(Sender: TObject);
var
  H,I: Integer;
begin
  H:=Graph.MakeCurve('Diamond',clYellow,1,psSolid,True);
  for I:=-314 to 314 do Graph.AddPoint(H,135 * Cos(I /100) * Cos(I / 100) * Cos(I / 100),
                                       50 * Sin(I / 100) * Sin(I / 100) * Sin(I / 100));
  Graph.HintPanel.Strings.Add(Graph.GetCurveName(H));
  Graph.Paint;
end;

procedure TGraphForm.SaveCurveButtonClick(Sender: TObject);
begin
  if Graph.SaveCurveToFile('curve.gsc',0) then
    ShowMessage('Curve ' + Graph.GetCurveName(0) + ' saved to curve.gsc')
      else ShowMessage('No curve to save!');
end;

procedure TGraphForm.SaveGraphButtonClick(Sender: TObject);
begin
  if Graph.SaveGraphToFile('graph.gph') then
    ShowMessage('Graph saved to graph.gph')
      else ShowMessage('Graph not saveed!');
end;

procedure TGraphForm.LoadCurveButtonClick(Sender: TObject);
var
  Ok: Boolean;
begin
  Ok:=Graph.LoadCurveFromFile('curve.gsc');
  Graph.Paint;
  if Ok then ShowMessage('Curve loaded') else ShowMessage('Curve not loaded!');
end;

procedure TGraphForm.LoadGraphButtonClick(Sender: TObject);
begin
  if Graph.LoadGraphFromFile('graph.gph') then
    ShowMessage('Graph loaded')
      else ShowMessage('Graph not loaded!');
end;

procedure TGraphForm.DXFButtonClick(Sender: TObject);
begin
  Graph.Reset;
  Graph.MakeDXF('graph.dxf',Graph.XAxis.Min,Graph.YAxis.Min,Graph.XAxis.Max,
                Graph.YAxis.Max,0,0,300,240,3,3);
end;

end.

