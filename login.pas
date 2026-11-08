unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, Vcl.ExtCtrls, JvExExtCtrls, JvImage;

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
    Button1: TButton;
    JvImage1: TJvImage;
    MakeHash: TEdit;
    ExeHash: TButton;

    procedure conecta();
    procedure FormCreate(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

    // Eventos de Mouse (Hints seguros)
    procedure Edit1MouseEnter(Sender: TObject);
    procedure Edit1MouseLeave(Sender: TObject);
    procedure Edit2MouseEnter(Sender: TObject);
    procedure Edit2MouseLeave(Sender: TObject);
    procedure Edit3MouseEnter(Sender: TObject);
    procedure Edit3MouseLeave(Sender: TObject);
    procedure Edit4MouseEnter(Sender: TObject);
    procedure Edit4MouseLeave(Sender: TObject);
    procedure Edit5MouseEnter(Sender: TObject);
    procedure Edit5MouseLeave(Sender: TObject);
    procedure BitBtn1MouseEnter(Sender: TObject);
    procedure BitBtn1MouseLeave(Sender: TObject);
    procedure BitBtn2MouseEnter(Sender: TObject);
    procedure BitBtn2MouseLeave(Sender: TObject);
    procedure Button1MouseLeave(Sender: TObject);
    procedure Button2MouseLeave(Sender: TObject);

    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ViewEdit(const ban: boolean);
  private
    procedure AbrirTablasDatos;
    function ValidarYObtenerRutaArchivo(const RutaRelativa: string): string;
    procedure MostrarHintSeguro(Sender: TObject);
    procedure OcultarHintSeguro;
  public
    FContadorIntentos: Integer;
    FRutaApp: string;
  end;

var
  FLogin: TFLogin;
  FHintActual: THintWindow; // Instancia local controlada para evitar Access Violations

implementation

uses main, d_m;

{$R *.dfm}

{------------------------------------------------------------------------------}
{ Función auxiliar privada para validar existencia de archivos externos       }
{------------------------------------------------------------------------------}
function TFLogin.ValidarYObtenerRutaArchivo(const RutaRelativa: string): string;
begin
  Result := IncludeTrailingPathDelimiter(FRutaApp) + RutaRelativa;
  if not FileExists(Result) then
  begin
    raise EFOpenError.CreateFmt(
      'Error crítico: El archivo externo requerido no existe.'#13#10 +
      'Nombre del archivo: %s'#13#10 +
      'Ruta completa esperada: %s',
      [ExtractFileName(Result), Result]
    );
  end;
end;

{------------------------------------------------------------------------------}
{ Métodos auxiliares seguros para el manejo de Hints                            }
{------------------------------------------------------------------------------}
procedure TFLogin.MostrarHintSeguro(Sender: TObject);
begin
  if Assigned(fmain) and (Sender is TControl) then
  begin
    try
      // Si ya existía un hint previo, lo liberamos de forma segura antes de crear otro
      OcultarHintSeguro;
      FHintActual := fmain.RevealHint(TControl(Sender));
    except
      FHintActual := nil;
    end;
  end;
end;

procedure TFLogin.OcultarHintSeguro;
begin
  if Assigned(FHintActual) then
  begin
    try
      FHintActual.ReleaseHandle;
      FHintActual.Free;
    except
      // Previene excepciones si el handle ya fue destruido por Windows
    end;
    FHintActual := nil;
  end;
end;

{------------------------------------------------------------------------------}
{ Gestión de Configuración INI                                                 }
{------------------------------------------------------------------------------}
procedure CargarConfiguracion(const ArchivoINI: string; out AUser, APass, AServer: string; out APort: Integer);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(ArchivoINI, TEncoding.UTF8);
  try
    AUser := Ini.ReadString('Configuracion', 'Usuario', 'DefaultUser');
    APass := Ini.ReadString('Configuracion', 'Password', 'DefaultPass');
    AServer := Ini.ReadString('Configuracion', 'Servidor', 'localhost');
    APort := Ini.ReadInteger('Configuracion', 'Puerto', 3306);
  finally
    Ini.Free;
  end;
end;

{ Métodos de la Clase TFLogin }

procedure TFLogin.ViewEdit(const ban: boolean);
begin
  Edit1.Enabled := ban;
  Edit2.Enabled := ban;
  Edit3.Enabled := ban;
  Edit4.Enabled := ban;
  Edit5.Enabled := ban;
end;

procedure TFLogin.AbrirTablasDatos;
begin
  // Solo los catalogos pequenos son comunes a las ventanas.
  // Los datasets de oficios, agenda, busquedas e impresion se abren al usarlos.
  dm.TGrupo.Open;
  dm.TCAT_GRU.Open;
  dm.QCAT_GRU.Open;
  dm.QGRUPO.Open;
  dm.QAUX.Open;
  dm.ncor.Open;
  dm.tcor.Open;
  dm.ccor.Open;
end;

procedure TFLogin.conecta();
var
  RutaConfDll: string;
begin
  Inc(FContadorIntentos);

  Edit1.Text := Trim(Edit1.Text);
  Edit2.Text := Trim(Edit2.Text);
  Edit3.Text := Trim(Edit3.Text);
  Edit4.Text := Trim(Edit4.Text);
  Edit5.Text := Trim(Edit5.Text);

  dm.MyConnection1.Username := Edit1.Text;
  dm.MyConnection1.Password := Edit2.Text;
  dm.MyConnection1.Server := Edit3.Text;
  dm.MyConnection1.Database := Edit4.Text;
  dm.MyConnection1.Port := StrToIntDef(Edit5.Text, 3306);

  if DM.MyConnection1.Connected then
  begin
    DM.MyConnection1.Connected := False;
    ShowMessage('La conexión ya estaba activa. Reiniciando...');
    AbrirTablasDatos;
    Close;
  end
  else
  begin
    try
      DM.MyConnection1.Connected := True;
    except
      on E: Exception do
      begin
        ShowMessage('Error al conectar con la Base de Datos: ' + E.Message);
        Exit;
      end;
    end;

    if Assigned(fmain) then
    begin
      fmain.Oficios1.Visible := True;
      fmain.Catalogos1.Visible := True;
      fmain.Loguin2.Enabled := False;
      fmain.usuario := Edit1.Text;
    end;

    AbrirTablasDatos;

    try
      RutaConfDll := ValidarYObtenerRutaArchivo('dll\conf.dll');
      while ListBox1.Items.Count < 5 do
        ListBox1.Items.Add('');

      ListBox1.Items[0] := dm.MyConnection1.Username;
      ListBox1.Items[1] := dm.MyConnection1.Password;
      ListBox1.Items[2] := dm.MyConnection1.Server;
      ListBox1.Items[3] := dm.MyConnection1.Database;
      ListBox1.Items[4] := IntToStr(dm.MyConnection1.Port);
      ListBox1.Items.SaveToFile(RutaConfDll, TEncoding.UTF8);
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

    Close;
  end;

  if FContadorIntentos >= 3 then
  begin
    ShowMessage('Número máximo de intentos alcanzado. Datos incorrectos.');
    Close;
  end;
end;

{ Eventos de Botones }

procedure TFLogin.BitBtn1Click(Sender: TObject);
begin
  conecta;
end;

procedure TFLogin.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFLogin.Button1Click(Sender: TObject);
var
  RutaConfigIni: string;
  LUser, LPass, LServer: string;
  LPort: Integer;
begin
  try
    RutaConfigIni := ValidarYObtenerRutaArchivo('dll\Configuracion.dll');
    CargarConfiguracion(RutaConfigIni, LUser, LPass, LServer, LPort);
    Edit1.Text := LUser;
    Edit2.Text := LPass;
    Edit3.Text := LServer;
    Edit4.Text := IntToStr(LPort);
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TFLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  // Vacío intencional
end;

procedure TFLogin.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', '.', #8]) then
  begin
    Key := #0;
    ShowMessage('Por favor introduzca sólo números');
  end;
end;

{ Manejo unificado de Hints seguros }

procedure TFLogin.Edit1MouseEnter(Sender: TObject); begin MostrarHintSeguro(Sender); end;
procedure TFLogin.Edit1MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;

procedure TFLogin.Edit2MouseEnter(Sender: TObject); begin MostrarHintSeguro(Sender); end;
procedure TFLogin.Edit2MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;

procedure TFLogin.Edit3MouseEnter(Sender: TObject); begin MostrarHintSeguro(Sender); end;
procedure TFLogin.Edit3MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;

procedure TFLogin.Edit4MouseEnter(Sender: TObject); begin MostrarHintSeguro(Sender); end;
procedure TFLogin.Edit4MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;

procedure TFLogin.Edit5MouseEnter(Sender: TObject); begin MostrarHintSeguro(Sender); end;
procedure TFLogin.Edit5MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;

procedure TFLogin.BitBtn1MouseEnter(Sender: TObject); begin MostrarHintSeguro(Sender); end;
procedure TFLogin.BitBtn1MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;

procedure TFLogin.BitBtn2MouseEnter(Sender: TObject); begin MostrarHintSeguro(Sender); end;
procedure TFLogin.BitBtn2MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;

procedure TFLogin.Button1MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;
procedure TFLogin.Button2MouseLeave(Sender: TObject); begin OcultarHintSeguro; end;

{ Form Create }
procedure TFLogin.FormCreate(Sender: TObject);
var
  RutaConf: string;
  RutaImg: string;
  I: Integer;
begin
  FRutaApp := ExtractFilePath(Application.ExeName);
  FHintActual := nil;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  FContadorIntentos := 0;
  Flogin.Caption := 'SISTEMA DE GESTIÓN Y TRÁNSITO DOCUMENTAL (SGTD / Conectar)';

  try
    RutaConf := ValidarYObtenerRutaArchivo('dll\conf.dll');
    if FileExists(RutaConf) then
      ListBox1.Items.LoadFromFile(RutaConf, TEncoding.UTF8);
  except
    // Si no existe conf.dll en el primer arranque, se ignora de forma silenciosa
  end;

  for I := ListBox1.Items.Count to 4 do
    ListBox1.Items.Add('');

  if ListBox1.Items.Count >= 5 then
  begin
    Edit1.Text := ListBox1.Items[0];
    Edit2.Text := ListBox1.Items[1];
    Edit3.Text := ListBox1.Items[2];
    Edit4.Text := ListBox1.Items[3];
    Edit5.Text := ListBox1.Items[4];
  end;
  Edit1.Hint := 'Escriba el Nombre de Usuario...';
  Edit2.Hint := 'Escriba la Contraseña...';
  Edit3.Hint := 'Escriba la dirección IP o el Nombre del servidor';
  Edit4.Hint := 'Escriba el Nombre de la base de datos';
  Edit5.Hint := 'Escriba el puerto de conexión a la base de datos';
  BitBtn1.Hint := 'Presione para conectarse';
  BitBtn2.Hint := 'Presione para cancelar o Salir';

  try
    if Assigned(fmain) then
    begin
      RutaImg := ValidarYObtenerRutaArchivo(fmain.mmedia + 'legislatura.png');
      JvImage1.Picture.LoadFromFile(RutaImg);
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
  ViewEdit(True);
end;

end.
