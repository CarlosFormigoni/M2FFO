unit m2rendsys14;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Win.Registry, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.TabNotBk, Vcl.ExtCtrls;

type
  TFConfiguracaoDriver = class(TForm)
    btnPrincipal: TSpeedButton;
    ListaProtocolos: TComboBox;
    Label1: TLabel;
    TabbedNotebook1: TTabbedNotebook;
    combo_listacoms: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    tx_ipcom: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure combo_listacomsChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  DLL_API='Modbus_RTU.dll';

var
  FConfiguracaoDriver: TFConfiguracaoDriver;


Function OpenCom(ComNo: integer): integer;stdcall;external DLL_API;
Function CloseCom(): bool;stdcall;external DLL_API;
Function SetBaudRate(BaudRate: integer): integer;stdcall;external DLL_API;
Function readMW(PLCaddr: integer; MWaddr: integer; length: integer; var buff): integer;stdcall;external DLL_API;

implementation

{$R *.dfm}

procedure TFConfiguracaoDriver.Button1Click(Sender: TObject);
var f : textfile;
begin
  assignfile(f,ExtractFilePath(ParamStr(0))+'\wincom.dll');
   reset(f);
  showmessage('Comunicação Iniciada !');
end;

procedure TFConfiguracaoDriver.combo_listacomsChange(Sender: TObject);
var linha,porta : string; po1 : integer;
    f : textfile;
begin
   assignfile(f,ExtractFilePath(ParamStr(0))+'\wincom.dll');
   rewrite(f);
   linha := combo_listacoms.Text;
   po1 := pos('COM',linha);
   porta := copy(linha,po1+3,2);
   writeln(f,porta);
   closefile(f);
   label5.Caption := 'COM'+porta;
   button1.Enabled := true;
end;

procedure TFConfiguracaoDriver.FormShow(Sender: TObject);
var
  vReg: TRegistry;
  vLista: TStrings;
  vI: integer;
begin
  try
    vReg := TRegistry.Create;
    try
      vReg.Access := KEY_READ;
      vReg.RootKey := HKEY_LOCAL_MACHINE;
      if vReg.OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM', false) then
      begin
        combo_listacoms.Clear;
        vLista := TStringList.Create;
        try
          vReg.GetValueNames(vLista);
          for vI := 0 to vLista.Count - 1 do
          begin
            combo_listacoms.Items.Add(vReg.ReadString(vLista.Strings[vI]) + ' - ' + vLista.Strings[vI]);
          end;
        finally
          vLista.Free;
        end;
        vReg.CloseKey;
      end;
    finally
      vReg.Free;
    end;
  except
    on E: Exception do
  end;

end;

end.
