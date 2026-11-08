  unit main;

  interface

  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Menus, ExtCtrls, ComCtrls, JvExExtCtrls, JvImage, StdCtrls, DateUtils,
    Vcl.DBCtrls, CryptBase, HashObj, AESObj, MiscObj, System.JSON,
    System.Generics.Collections, System.IOUtils, System.UITypes;

type
  // Declaración del record para configuraciones
  TRestriccion = record
    Linea: Integer;
    Fecha: TDateTime;
    Hash: string;
  end;

  TEstadoControl = record
    Control: TControl;
    Visible: Boolean;
  end;

  TConfiguracion = record
    AnchoVentana: Integer;
    AltoVentana: Integer;
    ColorFondo: TColor;
//    procedure CargarDesdeIni(const NombreArchivo: string);
//    procedure GuardarAIni(const NombreArchivo: string);
  end;

  type
    TFmain = class(TForm)
      StatusBar1: TStatusBar;
      Timer1: TTimer;
      MainMenu1: TMainMenu;
      Loguin1: TMenuItem;
      Loguin2: TMenuItem;
      Salir1: TMenuItem;
      Oficios1: TMenuItem;
      Alta1: TMenuItem;
      consultas1: TMenuItem;
      Reportes2: TMenuItem;
      Catalogos1: TMenuItem;
      Acerca1: TMenuItem;
      de1: TMenuItem;
      DateTimePicker1: TDateTimePicker;
      DateTimePicker2: TDateTimePicker;
      ListBox1: TListBox;
      Alta2: TMenuItem;
      Busqueda2: TMenuItem;
      A1: TMenuItem;
      c1: TMenuItem;
      Reportesgenerales1: TMenuItem;
      bg: TDBImage;
      N1: TMenuItem;
      C2: TMenuItem;
      N2: TMenuItem;
      N3: TMenuItem;
      N4: TMenuItem;
      SHA3Hash1: TSHA3Hash;
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    DateTimePicker3: TDateTimePicker;
    MostrarClave: TCheckBox;

      Procedure  endweek(fecha:TDateTimePicker);
      function PutDate : String;
      function PutTime : String;
      function RevealHint (Control: TControl): THintWindow;
      procedure RemoveHint ( Hint: THintWindow);
      procedure Loguin2Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure Alta1Click(Sender: TObject);
      procedure Alta2Click(Sender: TObject);
      procedure Busqueda2Click(Sender: TObject);
//      procedure Reportes1Click(Sender: TObject);
      procedure de1Click(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
      procedure consultas1Click(Sender: TObject);
      procedure Salir1Click(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure G1Click(Sender: TObject);
      procedure c1Click(Sender: TObject);
      procedure Reportesgenerales1Click(Sender: TObject);
      procedure C2Click(Sender: TObject);
    procedure SeguimientoaTrmitedeRespuesta1Click(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure MostrarClaveClick(Sender: TObject);
    private
      FEstados: TArray<TEstadoControl>;
      FMenuOriginal: TMainMenu;
      FTimerOriginal: Boolean;
      FLicencias: TList<TRestriccion>;
      FLineas: TStringList;
      FCopiaArchivo: TBytes;
      FBloqueo: TFileStream;
      FAES: TAESEncryption;
      FRutaLicencias: string;
      FActual, FIntentos: Integer;
      FIniciado, FLiberado, FTerminando: Boolean;
      FTimerAdvertencia: TTimer;
      procedure MostrarAdvertencia(Sender: TObject);
      procedure BloquearInterfaz;
      procedure AdquirirBloqueoLicencias;
      procedure CargarRestricciones;
      function LeerRestriccion(const ALinea: string; AIndice: Integer): TRestriccion;
      procedure ConfigurarCifrado(const AObjeto: TJSONObject);
      function DescifrarFecha(const AObjeto: TJSONObject): TDateTime;
      function BuscarRestriccionVencida: Integer;
      procedure RestaurarInterfaz;
      procedure RegistrarIntentoFallido;
      procedure VerificarArchivoSinCambios;
      procedure ActualizarIndices(AIndiceLinea: Integer);
      procedure ContinuarValidacion;
      procedure GuardarSinRegistro;
      procedure TerminarValidacion(const ACodigo: string);
      function CrearHashAcceso(const ATexto: string): string;

    public
       ruta: string;
       mmedia : string;
       cconfig: string;
       usuario : string;
       MainPath:string;
       title :string;
       Ttitle : String;
       CopyRight : String;
       cambio:integer;
       contx:integer;
       archval:string;
      destructor Destroy; override;
    end;

  var
    Fmain: TFmain;

implementation

    uses d_m, login,  scoage_alta,
    scoage_bus, scoalta,
//    scoconsultas,
    about, rg,
    sco_cat_grupo,
    config, Reportearchivar,
    RG_historico, SCO_auxiliar_alta_edicion;

    {$R *.dfm}

{
    victor = 승리자
    roman = 로마인
    ortiz = 오티즈
    Abreu = 아브레
    Inicio de la app
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
}


const
  MaxIntentosLicencia = 3;
  ErrorCargaLicencias = 'SGTD-LIC-001';
  ErrorGuardadoLicencias = 'SGTD-LIC-002';
  ErrorIntentosLicencia = 'SGTD-LIC-003';
  // Compatibilidad con los archivos existentes del generador EncriptacionX.
  ClaveMaestraLicencias = 'BlackWolfMX';

{ Validacion de licencias: no cargar este archivo como biblioteca de Windows. }
procedure TFmain.BloquearInterfaz;
var
  I: Integer;
begin
  FActual := -1;
  FMenuOriginal := Menu;
  Menu := nil; // Desactiva tambien los atajos de este menu.
  FTimerOriginal := Timer1.Enabled;
  Timer1.Enabled := False;
  SetLength(FEstados, ControlCount);
  for I := 0 to ControlCount - 1 do
  begin
    FEstados[I].Control := Controls[I];
    FEstados[I].Visible := Controls[I].Visible;
    if (Controls[I] <> bg) and (Controls[I] <> Panel1) then
      Controls[I].Visible := False;
  end;
  Panel1.Visible := True;
  Panel1.BringToFront;
  Edit1.Clear;
  MostrarClave.Checked := False;
  MostrarClave.Enabled := False;
  DateTimePicker3.Visible := False;
  Edit1.PasswordChar := '*';
  Edit1.Enabled := False;
  Button1.Enabled := False;
  Button1.Default := True;
end;

function TFmain.CrearHashAcceso(const ATexto: string): string;
begin
  SHA3Hash1.HashSizeBits := 256;
  SHA3Hash1.OutputFormat := base64;
  SHA3Hash1.Unicode := yesUni;
  Result := SHA3Hash1.Hash(ATexto);
end;

function CampoLicencia(const AObjeto: TJSONObject; const ANombre: string): string;
var
  Valor: TJSONValue;
begin
  Valor := AObjeto.GetValue(ANombre);
  if not (Valor is TJSONString) then
    raise EConvertError.CreateFmt('Campo de licencia invalido: %s', [ANombre]);
  Result := Valor.Value;
  if Result = '' then
    raise EConvertError.CreateFmt('Campo de licencia vacio: %s', [ANombre]);
end;

procedure TFmain.AdquirirBloqueoLicencias;
var
  HandleBloqueo: THandle;
begin
  // Crear sin truncar; la apertura exclusiva determina la instancia autorizada.
  HandleBloqueo := CreateFile(PChar(FRutaLicencias + '.lock'),
    GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE,
    nil, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if HandleBloqueo = INVALID_HANDLE_VALUE then
    RaiseLastOSError;
  CloseHandle(HandleBloqueo);
  FBloqueo := TFileStream.Create(FRutaLicencias + '.lock',
    fmOpenReadWrite or fmShareExclusive);
end;

procedure TFmain.ConfigurarCifrado(const AObjeto: TJSONObject);
var
  Modo, Formato: string;
begin
  Modo := UpperCase(CampoLicencia(AObjeto, 'densidad'));
  Formato := LowerCase(CampoLicencia(AObjeto, 'temperatura'));
  if Modo = 'CBC' then
    FAES.AType := atCBC
  else if Modo = 'CTR' then
    FAES.AType := atCTR
  else
    raise EConvertError.Create('Modo AES invalido');

  if Formato = 'base64' then
    FAES.OutputFormat := base64
  else if Formato = 'hexa' then
    FAES.OutputFormat := hexa
  else
    raise EConvertError.Create('Formato AES invalido');
end;

function TFmain.DescifrarFecha(const AObjeto: TJSONObject): TDateTime;
var
  Dia, Mes, Anio: Integer;
begin
  Dia := StrToInt(FAES.Decrypt(CampoLicencia(AObjeto, 't1')));
  Anio := StrToInt(FAES.Decrypt(CampoLicencia(AObjeto, 't2')));
  Mes := StrToInt(FAES.Decrypt(CampoLicencia(AObjeto, 't3')));
  if (Dia < 1) or (Dia > 31) or (Mes < 1) or (Mes > 12) or
     (Anio < 1) or (Anio > 9999) then
    raise EConvertError.Create('Fecha fuera de rango');
  Result := EncodeDate(Anio, Mes, Dia);
end;

function TFmain.LeerRestriccion(const ALinea: string;
  AIndice: Integer): TRestriccion;
var
  Valor: TJSONValue;
  Objeto: TJSONObject;
begin
  Valor := TJSONObject.ParseJSONValue(ALinea);
  try
    if not (Valor is TJSONObject) then
      raise EConvertError.Create('Registro de licencia invalido');
    Objeto := TJSONObject(Valor);
    ConfigurarCifrado(Objeto);
    Result.Linea := AIndice;
    Result.Fecha := DescifrarFecha(Objeto);
    Result.Hash := CampoLicencia(Objeto, 'pon');
    if CrearHashAcceso(FAES.Decrypt(CampoLicencia(Objeto, 'pin'))) <> Result.Hash then
      raise EConvertError.Create('Hash de licencia inconsistente');
  finally
    Valor.Free;
  end;
end;

procedure TFmain.CargarRestricciones;
var
  I: Integer;
  Contenido: string;
begin
  AdquirirBloqueoLicencias;
  FCopiaArchivo := TFile.ReadAllBytes(FRutaLicencias);
  FLineas := TStringList.Create;
  FLineas.LoadFromFile(FRutaLicencias, TEncoding.UTF8);
  FLicencias := TList<TRestriccion>.Create;
  Contenido := Trim(FLineas.Text);
  if (Contenido = '') or (Contenido = '[]') then
    Exit;

  FAES := TAESEncryption.Create(Self);
  // La clave y las opciones comunes se calculan una sola vez por carga.
  SHA3Hash1.HashSizeBits := 256;
  SHA3Hash1.Unicode := yesUni;
  SHA3Hash1.OutputFormat := raw;
  FAES.KeyLength := kl256;
  FAES.Key := SHA3Hash1.Hash(ClaveMaestraLicencias);
  FAES.Unicode := yesUni;
  FAES.PaddingMode := PKCS7;
  FAES.IVMode := rand;
  for I := 0 to FLineas.Count - 1 do
    if Trim(FLineas[I]) <> '' then
      FLicencias.Add(LeerRestriccion(FLineas[I], I));
end;

procedure TFmain.FormShow(Sender: TObject);
begin
  if FIniciado then
    Exit;
  FIniciado := True;
  try
    CargarRestricciones;
    ContinuarValidacion;
  except
    on E: Exception do
      TerminarValidacion(ErrorCargaLicencias);
  end;
end;

function TFmain.BuscarRestriccionVencida: Integer;
var
  I: Integer;
  Hoy: TDateTime;
begin
  Hoy := Date;
  for I := 0 to FLicencias.Count - 1 do
    if Hoy > FLicencias[I].Fecha then
      Exit(I);
  Result := -1;
end;

procedure TFmain.RestaurarInterfaz;
var
  I: Integer;
begin
  FTimerAdvertencia.Enabled := False;
  Panel1.Visible := False;
  MostrarClave.Checked := False;
  MostrarClave.Enabled := False;
  Edit1.PasswordChar := '*';
  DateTimePicker3.Visible := False;
  Edit1.Enabled := False;
  Button1.Enabled := False;
  for I := 0 to Length(FEstados) - 1 do
    if FEstados[I].Control <> Panel1 then
      FEstados[I].Control.Visible := FEstados[I].Visible;
  Menu := FMenuOriginal;
  Timer1.Enabled := FTimerOriginal;
  FLiberado := True;
  FreeAndNil(FBloqueo);
end;

procedure TFmain.ContinuarValidacion;
begin
  FActual := BuscarRestriccionVencida;
  FIntentos := 0;
  Edit1.Clear;
  MostrarClave.Checked := False;
  Edit1.PasswordChar := '*';
  if FActual < 0 then
  begin
    RestaurarInterfaz;
    Exit;
  end;
  DateTimePicker3.Date := FLicencias[FActual].Fecha;
  DateTimePicker3.Visible := True;
  MostrarClave.Enabled := True;
  Panel1.Visible := True;
  Edit1.Enabled := True;
  Button1.Enabled := True;
  FTimerAdvertencia.Enabled := False;
  FTimerAdvertencia.Enabled := True;
  Edit1.SetFocus;
end;

procedure TFmain.MostrarAdvertencia(Sender: TObject);
begin
  FTimerAdvertencia.Enabled := False;
  if not Visible or FTerminando or FLiberado or (FActual < 0) then
    Exit;
  // Procesar el pintado pendiente antes de abrir el aviso modal.
  Update;
  Panel1.Update;
  MessageDlg('El programa necesita un código de acceso para continuar.' + sLineBreak +
    'Escriba el código en el cuadro de texto y presione el botón "Validar" para enviarlo.',
    mtWarning, [mbOK], 0);
  if Edit1.CanFocus then Edit1.SetFocus;
end;

procedure TFmain.VerificarArchivoSinCambios;
var
  Actual: TBytes;
begin
  Actual := TFile.ReadAllBytes(FRutaLicencias);
  if Length(Actual) <> Length(FCopiaArchivo) then
    raise EInOutError.Create('Archivo modificado externamente');
  if Length(Actual) > 0 then
    if not CompareMem(@Actual[0], @FCopiaArchivo[0], Length(Actual)) then
      raise EInOutError.Create('Archivo modificado externamente');
end;

procedure TFmain.ActualizarIndices(AIndiceLinea: Integer);
var
  I: Integer;
  Registro: TRestriccion;
begin
  for I := 0 to FLicencias.Count - 1 do
  begin
    Registro := FLicencias[I];
    if Registro.Linea > AIndiceLinea then
    begin
      Dec(Registro.Linea);
      FLicencias[I] := Registro;
    end;
  end;
end;

procedure TFmain.GuardarSinRegistro;
var
  Salida: TStringList;
  LineaQuitada: Integer;
  Temporal: string;
begin
  LineaQuitada := FLicencias[FActual].Linea;
  Salida := TStringList.Create;
  Temporal := FRutaLicencias + '.' + IntToHex(GetCurrentProcessId, 8) + '.tmp';
  try
    Salida.Assign(FLineas);
    Salida.Delete(LineaQuitada);
    if Trim(Salida.Text) = '' then
      Salida.Text := '[]';
    VerificarArchivoSinCambios;
    Salida.SaveToFile(Temporal, TEncoding.UTF8);
    // Reemplazo atomico: el original se conserva si falla la escritura previa.
    if not MoveFileEx(PChar(Temporal), PChar(FRutaLicencias),
      MOVEFILE_REPLACE_EXISTING or MOVEFILE_WRITE_THROUGH) then
      RaiseLastOSError;
    FCopiaArchivo := TFile.ReadAllBytes(FRutaLicencias);
    FLineas.Assign(Salida);
    FLicencias.Delete(FActual);
    ActualizarIndices(LineaQuitada);
  finally
    if FileExists(Temporal) then System.SysUtils.DeleteFile(Temporal);
    Salida.Free;
  end;
end;

procedure TFmain.RegistrarIntentoFallido;
begin
  Inc(FIntentos);
  if FIntentos >= MaxIntentosLicencia then
  begin
    TerminarValidacion(ErrorIntentosLicencia);
    Exit;
  end;
  ShowMessage(Format('Clave incorrecta. Intentos restantes: %d.',
    [MaxIntentosLicencia - FIntentos]));
  Edit1.SetFocus;
end;

procedure TFmain.MostrarClaveClick(Sender: TObject);
begin
  if MostrarClave.Checked then
    Edit1.PasswordChar := #0
  else
    Edit1.PasswordChar := '*';
end;

procedure TFmain.Button1Click(Sender: TObject);
var
  HashIngresado: string;
begin
  if FTerminando or FLiberado or (FActual < 0) or not Button1.Enabled then
    Exit;
  Button1.Enabled := False;
  try
    try
      HashIngresado := CrearHashAcceso(Edit1.Text);
      Edit1.Clear;
      if HashIngresado <> FLicencias[FActual].Hash then
      begin
        RegistrarIntentoFallido;
        Exit;
      end;
      GuardarSinRegistro;
      ContinuarValidacion;
    except
      on E: Exception do
        TerminarValidacion(ErrorGuardadoLicencias);
    end;
  finally
    Button1.Enabled := not FTerminando and not FLiberado;
  end;
end;

procedure TFmain.TerminarValidacion(const ACodigo: string);
begin
  if FTerminando then Exit;
  FTerminando := True;
  FTimerAdvertencia.Enabled := False;
  MostrarClave.Checked := False;
  MostrarClave.Enabled := False;
  Edit1.PasswordChar := '*';
  Timer1.Enabled := False;
  Edit1.Clear;
  Edit1.Enabled := False;
  Button1.Enabled := False;
  try
    ShowMessage('Codigo de error: ' + ACodigo + sLineBreak +
      'Solicite acceso al ingeniero de software.');
  finally
    Application.Terminate;
  end;
end;

destructor TFmain.Destroy;
begin
  FBloqueo.Free;
  FLicencias.Free;
  FLineas.Free;
  inherited Destroy;
end;

function ValidarYObtenerRutaArchivo(const RutaBase, RutaRelativa: string): string;
begin
  Result := IncludeTrailingPathDelimiter(RutaBase) + RutaRelativa;
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

  function ObtenerAnoActual: Integer;
    begin
      Result := YearOf(Now);
    end;


  procedure TFmain.Alta1Click(Sender: TObject);
  begin
    if not dm.MyConnection1.Connected then
    begin
      ShowMessage('Inicie sesion antes de abrir los oficios.');
      Exit;
    end;
    fscoalta.SolicitarApertura;
    fscoalta.ShowModal;
  end;
  //----------------------------------------------------------------------------
  //
  // Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
  //
  //----------------------------------------------------------------------------
  procedure TFmain.Alta2Click(Sender: TObject);
  var
    Inicio: UInt64;
    CursorAnterior: TCursor;
  begin
    if not dm.MyConnection1.Connected then
    begin
      ShowMessage('Inicie sesion antes de abrir la agenda.');
      Exit;
    end;
    Inicio := GetTickCount64;
    CursorAnterior := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      if not dm.Tage.Active then
        dm.Tage.Open;
      // El formulario y su reporte ya existen desde el inicio del programa.
      fscoage_alta.clear;
      OutputDebugString(PChar('Agenda - preparar apertura: ' +
        IntToStr(Int64(GetTickCount64 - Inicio)) + ' ms'));
    finally
      Screen.Cursor := CursorAnterior;
    end;
    fscoage_alta.ShowModal;
  end;
  {============================================================================}
  {============================================================================}
  procedure TFmain.Busqueda2Click(Sender: TObject);
  begin
    if not dm.MyConnection1.Connected then Exit;
    Fscoage_bus.clave := 0;
    Fscoage_bus.ShowModal;
  end;

  {============================================================================}
  procedure TFmain.c1Click(Sender: TObject);
  begin
    FConfig.Show;
  end;

  procedure TFmain.C2Click(Sender: TObject);
  begin
    if not dm.MyConnection1.Connected then Exit;
    FSCO_auxiliar_alta_edicion.PrepararApertura;
    FSCO_auxiliar_alta_edicion.ShowModal;
  end;

  {============================================================================}
  procedure TFmain.consultas1Click(Sender: TObject);
begin
  if not dm.MyConnection1.Connected then
  begin
    ShowMessage('Inicie sesion antes de abrir los reportes.');
    Exit;
  end;
  Frg.PrepararApertura('');
  Frg.ShowModal;
end;

  {============================================================================}
  procedure TFmain.de1Click(Sender: TObject);
    var f:tfabout;
    begin
        Fabout.Show;
    end;
  {============================================================================}
  procedure Tfmain.endweek(fecha: TDateTimePicker);
  var
    ArchivoIni: string;
    fecha0, dateh: Tdate;
    A, M, D: Word;
    week: Integer;
    sabado, domingo, fecha1: Tdate;
    i, j: integer;
  begin
    DateTimePicker1 := fecha;
    fecha0 := DateTimePicker1.Date;

    try
      ArchivoIni := ValidarYObtenerRutaArchivo(ruta, 'date.ini');
      ListBox1.Items.LoadFromFile(ArchivoIni, TEncoding.UTF8);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
        Exit;
      end;
    end;

    j := ListBox1.Items.Count;
    for i := 0 to j - 1 do
    begin
      DateTimePicker2.Date := StrToDate(ListBox1.Items.Strings[i]);
      dateh := DateTimePicker2.Date;
      if (DateTimePicker1.Date = dateh) then
        ShowMessage('Este día es inhábil......................');
    end;

    DecodeDate(fecha0, A, M, D);
    M := 1;
    D := 1;
    fecha0 := EncodeDate(A, M, D); // frstDay

    fecha0 := DateTimePicker1.Date;
    DecodeDate(fecha0, A, M, D);
    week := Trunc((DateTimePicker1.Date - fecha0) / 7) + 1; // Simplificado lógico

    domingo := EndOfAWeek(A, week - 1);
    fecha1 := EndOfAWeek(A, week); // sábado
    sabado := fecha1 - 1;

    DateTimePicker2.Date := domingo;
    if (DateTimePicker1.Date = DateTimePicker2.Date) then
      ShowMessage('Este día es Domingo Fin de semana...');

    DateTimePicker2.Date := sabado;
    if (DateTimePicker1.Date = DateTimePicker2.Date) then
      ShowMessage('Este día es Sábado Fin de semana...');
  end;
  {============================================================================}
  function Tfmain.PutDate : String;
    var
       stSystemTime : TSystemTime;
    begin
       Windows.GetLocalTime( stSystemTime );
       Result := DateToStr( SystemTimeToDateTime( stSystemTime ) );
    end;
  {============================================================================}
  function Tfmain.PutTime : String;
    var
       stSystemTime : TSystemTime;
    begin
       Windows.GetLocalTime( stSystemTime );
       Result := TimeToStr( SystemTimeToDateTime( stSystemTime ) );
    end;
  {============================================================================}
  function Tfmain.RevealHint (Control: TControl): THintWindow;
     var
         ShortHint: string;
         AShortHint: array[0..255] of Char;
         HintPos: TPoint;
         HintBox: TRect;
     begin
         Result := THintWindow.Create(Control);
         ShortHint := GetShortHint(Control.Hint);
         HintPos := Control.ClientOrigin;
         Inc(HintPos.Y, Control.Height + 6);
         HintBox := Bounds(0, 0, Screen.Width, 0);
         DrawText(Result.Canvas.Handle,
             StrPCopy(AShortHint, ShortHint), -1, HintBox,
             DT_CALCRECT or DT_LEFT or DT_WORDBREAK or DT_NOPREFIX);
         OffsetRect(HintBox, HintPos.X, HintPos.Y);
         Inc(HintBox.Right, 6);
         Inc(HintBox.Bottom, 2);
         Result.ActivateHint(HintBox, ShortHint);
     end;
  {============================================================================}
  procedure TFmain.Salir1Click(Sender: TObject);
    begin
       close;
    end;
  procedure TFmain.SeguimientoaTrmitedeRespuesta1Click(Sender: TObject);
begin

end;

{============================================================================}
  {============================================================================}
  {============================================================================}
  procedure TFmain.Timer1Timer(Sender: TObject);
  var
    RutaImagen: string;
    IndiceImagen: Integer;
  begin
    fmain.StatusBar1.Panels[2].Text := fmain.PutDate;
    fmain.StatusBar1.Panels[3].Text := fmain.PutTime;
    fmain.StatusBar1.Panels[3].Text := 'cambio ' + IntToStr(cambio);
    fmain.StatusBar1.Panels[4].Text := 'contador ' + IntToStr(contx);

    if usuario <> '' then
      fmain.StatusBar1.Panels[1].Text := 'Usuario : ' + fmain.usuario;

    if ((cambio = contx) or (contx = 1)) then
    begin
      Randomize;
      repeat
        cambio := Random(7) * 60;
      until cambio <> 0;

      IndiceImagen := Random(14);
      RutaImagen := ValidarYObtenerRutaArchivo(fmain.ruta, 'media\cp\cam' + IntToStr(IndiceImagen) + '.png');

      if FileExists(RutaImagen) then
        bg.Picture.LoadFromFile(RutaImagen);
    end;

    Inc(contx);
  end;

{===================================================================================}

  procedure Tfmain.RemoveHint ( Hint: THintWindow);
     begin
       Hint.ReleaseHandle;
       Hint.Free;
     end;
  {============================================================================}
  {============================================================================}
  {============================================================================}
  procedure TFmain.Reportesgenerales1Click(Sender: TObject);
    begin
     if dm.MyConnection1.Connected then
        begin
          FRG_historico.Show;
        end;
    end;
  {============================================================================}
  procedure TFmain.FormClose(Sender: TObject; var Action: TCloseAction);
    begin
        FTimerAdvertencia.Enabled := False;
        dm.MyConnection1.Disconnect;
    end;
  {============================================================================}
  procedure TFmain.FormCreate(Sender: TObject);
  begin
      FTimerAdvertencia := TTimer.Create(Self);
      FTimerAdvertencia.Enabled := False;
      FTimerAdvertencia.Interval := 1;
      FTimerAdvertencia.OnTimer := MostrarAdvertencia;
      BloquearInterfaz;
      usuario := '';
      archval:='mysqld.dll';
      randomize;
      mmedia :='Media\';
      cconfig := 'dll\';
      OFICIOS1.Visible := FALSE;
      CATALOGOS1.Visible := FALSE;
      ruta := ExtractFilePath(Application.ExeName);//  JvImage1.Picture.LoadFromFile(ruta+'sco.jpg');
      fmain.StatusBar1.Panels[2].Text := fmain.PutDate;
      fmain.StatusBar1.Panels[3].Text := fmain.PutTime;
      MainPath := 'sql\main\';
      title := 'SISTEMA DE GESTIÓN Y TRÁNSITO DOCUMENTAL (SGTD / Main)';
      Ttitle := 'Expedido por: Sistema de Correspondencia del Congreso del Estado de Campeche';
      fmain.CopyRight := 'by vroa74 © '+IntToStr(ObtenerAnoActual)+'.';
      fmain.Caption := title+' '+IntToStr(ObtenerAnoActual)+'.';
      contx :=1;
      cambio := random(2)*3;
      if FileExists(ruta + 'media\cp\cam0.png') then
        bg.Picture.LoadFromFile(ruta + 'media\cp\cam0.png');
      // Capturar el estado normal despues de la inicializacion original.
      FRutaLicencias := IncludeTrailingPathDelimiter(ruta) + 'dll\mysqld.dll';
  end;
  {============================================================================}
  procedure TFmain.G1Click(Sender: TObject);
  begin
    if not dm.MyConnection1.Connected then Exit;
    dm.QCAT_GRU.Close;
    dm.QCAT_GRU.SQL.Text := 'SELECT * FROM cat_gru ORDER BY id_grupo';
    dm.QCAT_GRU.Open;
    Fcat_gru.ShowModal;
  end;

  {============================================================================}
  {============================================================================}
  procedure TFmain.Loguin2Click(Sender: TObject);
  begin
    // Las consultas de oficios se abren al entrar a su ventana.
    Flogin.ShowModal;
  end;

  end.
