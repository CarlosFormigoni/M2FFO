program GraphProject;

uses
  Forms,
  GraphUnit in 'GraphUnit.pas' {GraphForm},
  Graph in '..\COMPONEN\Graph.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TGraphForm, GraphForm);
  Application.Run;
end.
