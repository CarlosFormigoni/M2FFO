unit monitora03;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    tentativas : smallint;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses monitora01;

procedure TForm3.Button2Click(Sender: TObject);
begin
     if (edit1.Text = '') then //Verifica se o campo "Usuário" foi preenchido
    begin
        Messagedlg('O campo "Usuário" deve ser preenchido!', mtInformation, [mbOk], 0);
        if edit1.CanFocus then
        edit1.SetFocus;
        Exit;
    end;
        if (maskedit1.Text = '') then //Verifica se o campo "Senha" foi preenchido
        begin
        Messagedlg('O campo "Senha" deve ser preenchido!', mtInformation, [mbOk], 0);
        if maskedit1.CanFocus then
        maskedit1.SetFocus;
        Exit;
    end;
        if maskedit1.Text = '12345' then //Verifica se o login é válido
        ModalResult := mrOk
        else //Caso o login não seja válido então
    begin
        inc(tentativas); //Incrementa em 1 o valor da variável tentativas
        if tentativas < 3 then
    begin
        MessageDlg(Format('Tentativa %d de 3', [tentativas]), mtError, [mbOk], 0);
        if maskedit1.CanFocus then
        maskedit1.SetFocus;
    end
    else
    begin
        MessageDlg(Format('%dª tentativa de acesso ao sistema.',
        [tentativas]) + #13 + 'A aplicação será fechada!', mtError, [mbOk], 0);
        ModalResult := mrCancel;
        end;
    end;
end;

end.
