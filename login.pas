unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFLogin = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure conecta();
    procedure FormCreate(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1MouseEnter(Sender: TObject);
    procedure Edit1MouseLeave(Sender: TObject);
    procedure Edit2MouseLeave(Sender: TObject);
    procedure Edit3MouseLeave(Sender: TObject);
    procedure Edit4MouseLeave(Sender: TObject);
    procedure Edit5MouseLeave(Sender: TObject);
    procedure Edit2MouseEnter(Sender: TObject);
    procedure Edit3MouseEnter(Sender: TObject);
    procedure Edit4MouseEnter(Sender: TObject);
    procedure Edit5MouseEnter(Sender: TObject);
    procedure Button2MouseLeave(Sender: TObject);
    procedure Button1MouseLeave(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1MouseEnter(Sender: TObject);
    procedure BitBtn2MouseEnter(Sender: TObject);
    procedure BitBtn2MouseLeave(Sender: TObject);
    procedure BitBtn1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;
  mango:THintWindow;
  cont: integer;
implementation

           uses main, d_m;

{$R *.dfm}
 procedure TFLogin.conecta();
 begin
       cont := cont +1;
       Edit1.Text := trim(Edit1.Text);
       Edit2.Text := trim(Edit2.Text);
       Edit3.Text := trim(Edit3.Text);
       Edit4.Text := trim(Edit4.Text);
       Edit5.Text := trim(Edit5.Text);
//------------------------------------------------------------------------------
       dm.MyConnection1.Username := Edit1.Text;
       dm.MyConnection1.Password := Edit2.Text;
       dm.MyConnection1.Server := Edit3.Text;
       dm.MyConnection1.Database := Edit4.Text;
       dm.MyConnection1.Port := StrToInt(Edit5.Text);
       if DM.MyConnection1.Connected  then
          begin
           DM.MyConnection1.Connected := false;
           showmessage('Ya estaba Conectada .....');
             try
               // base de datos
             Except
               ShowMessage('Error al abrir la Bases de Datos de Servicios');
             end;
             dm.Tage.Open;
             dm.tco.Open;
             dm.TGrupo.Open;
             dm.TCAT_GRU.Open;
             dm.QCOH.Open;
             dm.QCO.Open;
             dm.QCOH.Open;
             dm.QAGE.Open;
             dm.Qgrupo.Open;
             dm.QCAT_GRU.Open;
             dm.QGRUPO.Open;
             dm.QAUX.Open;
             dm.QImpresion.Open;
          close;
          end else
          begin
             DM.MyConnection1.Connected:= true;
             fmain.Oficios1.Visible := true;
             fmain.Archivo2.Visible := true;
             fmain.grupos1.Visible := true;
             dm.Tage.Open;
             dm.tco.Open;
             dm.TGrupo.Open;
             dm.TCAT_GRU.Open;
             dm.QCO.Open;
             dm.QCOH.Open;
             dm.QAGE.Open;
             dm.Qgrupo.Open;
             dm.QCAT_GRU.Open;
             dm.QGRUPO.Open;
             dm.QAUX.Open;
             dm.QImpresion.Open;
             fmain.Loguin2.Enabled := false;
// -------   activa los menus
           FMAIN.OFICIOS1.Visible := true;
           FMAIN.CATALOGOS1.Visible := true;
          fmain.grupos1.Visible := true;
           ListBox1.Items.Strings[0] := dm.MyConnection1.Username;
           ListBox1.Items.Strings[1] := dm.MyConnection1.Password;
           ListBox1.Items.Strings[2] := dm.MyConnection1.Server;
           ListBox1.Items.Strings[3] := dm.MyConnection1.Database;
           ListBox1.Items.Strings[4] := inttostr(dm.MyConnection1.Port);
           ListBox1.Items.SaveToFile(fmain.ruta+'conf.ini');
           Application.ProcessMessages;
          close;
          end;
      if  cont >= 3 then
      begin
       ShowMessage('Alguno de los datos no es correcto...');
        close;
      end;
 end;

procedure TFLogin.BitBtn1Click(Sender: TObject);
begin
  conecta;

end;

procedure TFLogin.BitBtn1MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn1);
end;

procedure TFLogin.BitBtn1MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TFLogin.BitBtn2MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn2);
end;

procedure TFLogin.BitBtn2MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.Button1MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.Button2MouseLeave(Sender: TObject);          
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin// si presionas una tecla...

end;

procedure TFLogin.Edit1MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Edit1);
end;

procedure TFLogin.Edit1MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.Edit2MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Edit2);
end;

procedure TFLogin.Edit2MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.Edit3MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Edit3);
end;

procedure TFLogin.Edit3MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.Edit4MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Edit4);
end;

procedure TFLogin.Edit4MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
begin
    key:=#0;
    showmessage('Por favor introduzca numeros')
end
end;

procedure TFLogin.Edit5MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Edit5);
end;

procedure TFLogin.Edit5MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
   Edit1.Text := '';
   Edit2.Text := '';
   Edit3.Text := '';
   Edit4.Text := '';
   Edit5.Text := '';
   cont := 0;
  {----------------------------------------------------------------------------}
   ListBox1.Items.LoadFromFile(fmain.ruta+'conf.ini');
  {----------------------------------------------------------------------------}
   Edit1.Text := ListBox1.Items.Strings[0];
   Edit2.Text := ListBox1.Items.Strings[1];
   Edit3.Text := ListBox1.Items.Strings[2];
   Edit4.Text := ListBox1.Items.Strings[3];
   Edit5.Text := ListBox1.Items.Strings[4];
   Edit1.Hint := 'Esciba el Nombre de Usuario...';
   Edit2.Hint := 'Escriba la Contraseña...';
   Edit3.Hint := 'Escriba la direccion IP o el Nombre del servidor';
   Edit4.Hint := 'Escriba el Nombre de la base de datos';
   Edit5.Hint := 'Escriba el puerto de conexion a la base de datos';
   BitBtn1.Hint := 'Presione para conectarse';
   BitBtn2.Hint := 'Presione para cancelar o Salir';



end;

end.
