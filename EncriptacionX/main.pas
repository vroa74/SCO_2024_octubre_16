unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.Hash, System.JSON,
  System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CryptBase, HashObj, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  AESObj, MiscObj, Vcl.ComCtrls, System.IOUtils;

type
  // Objeto auxiliar para manejar los registros en memoria
  TRegistroLicencia = class
  private
    FID: Integer;
    FFecha: string; // Formato DD/MM/YYYY
    FHash: string;
  public
    constructor Create(AID: Integer; const AFecha, AHash: string);
    property ID: Integer read FID write FID;
    property Fecha: string read FFecha write FFecha;
    property Hash: string read FHash write FHash;
  end;

  TRegistroJson = record
    Version: string;
    Densidad: string;
    Temperatura: string;
    Pin: string;
    Fecha: TDateTime;
    Pon: string;
    PinTexto: string;
  end;

  TForm1 = class(TForm)
    SHA3Hash1: TSHA3Hash;
    Panel1: TPanel;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Edit2: TEdit;
    AESEncryption1: TAESEncryption;
    Edit10: TEdit;
    DateTimePicker1: TDateTimePicker;
    Button8: TButton;
    Button9: TButton;
    Memo5: TMemo;
    Button6: TButton;
    Button7: TButton;
    Button10: TButton;
    Button11: TButton;
    Edit6: TEdit;
    Version: TEdit;
    Densidad: TEdit;
    Temperatura: TEdit;
    pin: TEdit;
    Fecha: TEdit;
    Pon: TEdit;
    PinTexto: TEdit;
    Memo3: TMemo;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    txt: string;
    d, dd: TDate;
    ruta: string;
    rutaArchivo: string;
    ii: integer;
    Convertidor: TConvert;
    TextoCifradoRaw: string;
    Myhash: string;
    contador: integer;
    reg_actual: integer;
    ListaJson: TStringList;

    // Métodos principales y de negocio ordenados por relevancia
    function CargarJsonDescifrados(mymemo: Tmemo; myedit: Tedit; const ARutaArchivo: string): Boolean;
    function GuardarJsonCifrados(myedit: TEdit; const ARutaArchivo: string): Boolean;
    procedure GuardarJsonEnArchivo(const TextoJson: string; const ARutaArchivo: string);
    function CREARHASH(valor1: string): string;
    procedure ConfigurarAES(const MasterPassword: string; const ModoTexto, FormatoTexto: string);

    function BuscarRegistroVencido: Integer;
    procedure GuardarLicenciasAArchivo(const ARutaArchivo: string; ALista: TObjectList<TRegistroLicencia>);
    procedure mostrarregistros(n: integer);
    function VaciarRegistro(const NumeroLista: Integer): Boolean;
  end;

var
  ListaRegistros: TList<TRegistroJson>;
  Form1: TForm1;

implementation

{$R *.dfm}

{ TRegistroLicencia }

constructor TRegistroLicencia.Create(AID: Integer; const AFecha, AHash: string);
begin
  inherited Create;
  FID := AID;
  FFecha := AFecha;
  FHash := AHash;
end;

{ TForm1 - Funciones Principales y de Encriptación Unificada }

function TForm1.CREARHASH(valor1: string): string;
begin
  SHA3Hash1.HashSizeBits := 256;
  SHA3Hash1.OutputFormat := base64;
  SHA3Hash1.Unicode := yesUni;
  Result := SHA3Hash1.Hash(valor1);
end;

procedure TForm1.ConfigurarAES(const MasterPassword: string; const ModoTexto, FormatoTexto: string);
var
  HashRaw: string;
begin
  SHA3Hash1.HashSizeBits := 256;
  SHA3Hash1.Unicode := yesUni;
  SHA3Hash1.OutputFormat := raw;
  HashRaw := SHA3Hash1.Hash(MasterPassword);

  if UpperCase(ModoTexto) = 'CBC' then
    AESEncryption1.AType := atCBC
  else if UpperCase(ModoTexto) = 'CTR' then
    AESEncryption1.AType := atCTR;

  if LowerCase(FormatoTexto) = 'base64' then
    AESEncryption1.OutputFormat := base64
  else if LowerCase(FormatoTexto) = 'hexa' then
    AESEncryption1.OutputFormat := hexa;

  AESEncryption1.KeyLength := kl256;
  AESEncryption1.Key := HashRaw;
  AESEncryption1.Unicode := yesUni;
  AESEncryption1.PaddingMode := PKCS7;
  AESEncryption1.IVMode := rand;
end;

function TForm1.CargarJsonDescifrados(mymemo: Tmemo; myedit: Tedit; const ARutaArchivo: string): Boolean;
var
  LineaJson: string;
  JsonTexto: string;
  ModoTexto, FormatoTexto: string;
  PinDescifrado: string;
  JSONValue: TJSONValue;
  JSONObj: TJSONObject;
  Par: TJSONPair;
  Valor: TJSONValue;
  CantidadVacios: Integer;
  Indice: Integer;
  DiaTexto, AnioTexto, MesTexto: string;
  FechaTexto: string;
  Dia, Mes, Anio: Integer;
  FechaRegistro: TDateTime;
  LineasArchivo: TStringList;
  Registro: TRegistroJson;

  function DesencriptarCampo(const Nombre: string): string;
  var
    ValorDescifrar: TJSONValue;
  begin
    ValorDescifrar := JSONObj.GetValue(Nombre);
    if ValorDescifrar = nil then
      raise Exception.Create('Falta el campo "' + Nombre + '".');
    Result := AESEncryption1.Decrypt(ValorDescifrar.Value);
  end;

  function ObtenerCampo(const Nombre: string): string;
  var
    CampoJson: TJSONValue;
  begin
    CampoJson := JSONObj.GetValue(Nombre);
    if (CampoJson = nil) or (CampoJson is TJSONNull) then
      Result := ''
    else
      Result := CampoJson.Value;
  end;

  procedure EliminarCampo(const Nombre: string);
  var
    ParQuitado: TJSONPair;
  begin
    ParQuitado := JSONObj.RemovePair(Nombre);
    if ParQuitado <> nil then
      ParQuitado.Free;
  end;

  procedure ReemplazarPorTextoPlano(const Nombre, Texto: string);
  begin
    EliminarCampo(Nombre);
    JSONObj.AddPair(Nombre, Texto);
  end;

begin
  Result := False;
  mymemo.Clear;

  if ListaRegistros = nil then
    raise Exception.Create('La lista global ListaRegistros no está inicializada.');

  ListaRegistros.Clear;

  if (ARutaArchivo = '') or (not TFile.Exists(ARutaArchivo)) then
    Exit;

  if Trim(myedit.Text) = '' then
    raise Exception.Create('myedit debe contener la contraseña maestra.');

  LineasArchivo := TStringList.Create;
  try
    LineasArchivo.LoadFromFile(ARutaArchivo, TEncoding.UTF8);

    for Indice := 0 to LineasArchivo.Count - 1 do
    begin
      LineaJson := Trim(LineasArchivo[Indice]);
      if LineaJson = '' then
        Continue;

      JSONValue := TJSONObject.ParseJSONValue(LineaJson);
      if not (JSONValue is TJSONObject) then
      begin
        JSONValue.Free;
        Continue;
      end;

      try
        JSONObj := TJSONObject(JSONValue);

        CantidadVacios := 0;
        for Par in JSONObj do
        begin
          Valor := Par.JsonValue;
          if (Valor is TJSONString) and (Valor.Value = '') then
            Inc(CantidadVacios);
        end;

        if CantidadVacios > 4 then
          Continue;

        if (JSONObj.GetValue('densidad') = nil) or
           (JSONObj.GetValue('temperatura') = nil) then
          Continue;

        ModoTexto := UpperCase(ObtenerCampo('densidad'));
        FormatoTexto := LowerCase(ObtenerCampo('temperatura'));

        if (ModoTexto <> 'CBC') and (ModoTexto <> 'CTR') then
          Continue;
        if (FormatoTexto <> 'base64') and (FormatoTexto <> 'hexa') then
          Continue;

        ConfigurarAES(myedit.Text, ModoTexto, FormatoTexto);

        PinDescifrado := DesencriptarCampo('pin');
        ReemplazarPorTextoPlano('pin', PinDescifrado);

        DiaTexto := DesencriptarCampo('t1');
        AnioTexto := DesencriptarCampo('t2');
        MesTexto := DesencriptarCampo('t3');

        Dia := StrToInt(DiaTexto);
        Anio := StrToInt(AnioTexto);
        Mes := StrToInt(MesTexto);

        FechaRegistro := EncodeDate(Anio, Mes, Dia);
        FechaTexto := Format('%.2d/%.2d/%.4d', [Dia, Mes, Anio]);

        Registro.Version := ObtenerCampo('version');
        Registro.Densidad := ModoTexto;
        Registro.Temperatura := FormatoTexto;
        Registro.Pin := PinDescifrado;
        Registro.Fecha := FechaRegistro;
        Registro.Pon := ObtenerCampo('pon');
        Registro.PinTexto := ObtenerCampo('pinTexto');

        ListaRegistros.Add(Registro);

        EliminarCampo('t1');
        EliminarCampo('t2');
        EliminarCampo('t3');
        JSONObj.AddPair('fecha', FechaTexto);

        JsonTexto := JSONObj.ToJSON;
        JsonTexto := StringReplace(JsonTexto, '\/', '/', [rfReplaceAll]);
        mymemo.Lines.Add(JsonTexto);

        Result := True;
      finally
        JSONValue.Free;
      end;
    end;
  finally
    LineasArchivo.Free;
  end;
end;

function TForm1.GuardarJsonCifrados(myedit: TEdit; const ARutaArchivo: string): Boolean;
var
  VersionTexto: string;
  PinEncriptado: string;
  DiaTexto, MesTexto, AnioTexto: string;
  SalidaJson: TStringList;
  JSONSalida: TJSONObject;
  Registro: TRegistroJson;
  Indice: Integer;
  Dia, Mes, Anio: Word;
  FechaValida: Boolean;
begin
  Result := False;

  if ListaRegistros = nil then
  begin
    ShowMessage('La lista global ListaRegistros no está inicializada.');
    Exit;
  end;

  if Trim(myedit.Text) = '' then
  begin
    ShowMessage('myedit debe contener la contraseña maestra.');
    Exit;
  end;

  SalidaJson := TStringList.Create;
  try
    try
      for Indice := 0 to ListaRegistros.Count - 1 do
      begin
        Registro := ListaRegistros[Indice];

        if (Trim(Registro.Densidad) = '') or
           (Trim(Registro.Temperatura) = '') or
           (Trim(Registro.Pin) = '') or
           (Trim(Registro.PinTexto) = '') or
           (Registro.Fecha <= 0) then
          Continue;

        if (not SameText(Trim(Registro.Densidad), 'CBC')) and
           (not SameText(Trim(Registro.Densidad), 'CTR')) then
          Continue;

        if (not SameText(Trim(Registro.Temperatura), 'base64')) and
           (not SameText(Trim(Registro.Temperatura), 'hexa')) then
          Continue;

        FechaValida := True;
        try
          DecodeDate(Registro.Fecha, Anio, Mes, Dia);
        except
          FechaValida := False;
        end;

        if not FechaValida then
          Continue;

        DiaTexto := Format('%.2d', [Dia]);
        MesTexto := Format('%.2d', [Mes]);
        AnioTexto := Format('%.4d', [Anio]);

        ConfigurarAES(myedit.Text, Registro.Densidad, Registro.Temperatura);

        PinEncriptado := AESEncryption1.Encrypt(Registro.Pin);

        JSONSalida := TJSONObject.Create;
        try
          VersionTexto := Trim(Registro.Version);
          if VersionTexto = '' then
            VersionTexto := '1';

          JSONSalida.AddPair('version', VersionTexto);
          JSONSalida.AddPair('densidad', UpperCase(Trim(Registro.Densidad)));
          JSONSalida.AddPair('temperatura', LowerCase(Trim(Registro.Temperatura)));
          JSONSalida.AddPair('pin', PinEncriptado);
          JSONSalida.AddPair('t1', AESEncryption1.Encrypt(DiaTexto));
          JSONSalida.AddPair('t2', AESEncryption1.Encrypt(AnioTexto));
          JSONSalida.AddPair('t3', AESEncryption1.Encrypt(MesTexto));
          JSONSalida.AddPair('pon', CREARHASH(Registro.Pin));
          JSONSalida.AddPair('pinTexto', Registro.PinTexto);

          SalidaJson.Add(JSONSalida.ToJSON);
        finally
          JSONSalida.Free;
        end;
      end;

      if SalidaJson.Count = 0 then
        SalidaJson.Add('[]');

      SalidaJson.SaveToFile(ARutaArchivo, TEncoding.UTF8);
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        ShowMessage('No se pudieron guardar los JSON: ' + E.Message);
      end;
    end;
  finally
    SalidaJson.Free;
  end;
end;

procedure TForm1.GuardarJsonEnArchivo(const TextoJson: string; const ARutaArchivo: string);
begin
  if not TFile.Exists(ARutaArchivo) then
    TFile.WriteAllText(ARutaArchivo, '', TEncoding.UTF8);

  TFile.AppendAllText(ARutaArchivo, TextoJson + sLineBreak, TEncoding.UTF8);
end;

{ Funciones Auxiliares y Procedimientos de Interfaz }

function TForm1.VaciarRegistro(const NumeroLista: Integer): Boolean;
var
  Registro: TRegistroJson;
begin
  Result := False;

  if (ListaRegistros = nil) or
     (NumeroLista < 0) or
     (NumeroLista >= ListaRegistros.Count) then
    Exit;

  Registro := ListaRegistros[NumeroLista];

  if (Trim(Registro.Version) = '') and
     (Trim(Registro.Densidad) = '') and
     (Trim(Registro.Temperatura) = '') and
     (Trim(Registro.Pin) = '') and
     (Trim(Registro.Pon) = '') and
     (Trim(Registro.PinTexto) = '') and
     (Registro.Fecha = 0) then
    Exit;

  Registro.Version := '';
  Registro.Densidad := '';
  Registro.Temperatura := '';
  Registro.Pin := '';
  Registro.Pon := '';
  Registro.PinTexto := '';
  Registro.Fecha := 0;

  ListaRegistros[NumeroLista] := Registro;
  Result := True;
end;

procedure TForm1.mostrarregistros(n: integer);
begin
  if (ListaRegistros = nil) or
     (n < 0) or
     (n >= ListaRegistros.Count) then
    Exit;

  Version.Text := ListaRegistros[n].Version;
  Densidad.Text := ListaRegistros[n].Densidad;
  Temperatura.Text := ListaRegistros[n].Temperatura;
  Pin.Text := ListaRegistros[n].Pin;
  Fecha.Text := FormatDateTime('dd/mm/yyyy', ListaRegistros[n].Fecha);
  Pon.Text := ListaRegistros[n].Pon;
  PinTexto.Text := ListaRegistros[n].PinTexto;
end;

function TForm1.BuscarRegistroVencido: Integer;
var
  Indice: Integer;
begin
  Result := 0;
  if ListaRegistros = nil then
    Exit;

  for Indice := 0 to ListaRegistros.Count - 1 do
  begin
    if Trunc(Date) >= Trunc(ListaRegistros[Indice].Fecha) then
    begin
      Result := Indice + 1;
      Exit;
    end;
  end;
end;

procedure TForm1.GuardarLicenciasAArchivo(const ARutaArchivo: string; ALista: TObjectList<TRegistroLicencia>);
var
  Contenido: TStringList;
  Reg: TRegistroLicencia;
  PartesFecha: TArray<string>;
  Dia, Mes, Anio: string;
  JsonTexto: string;
begin
  Contenido := TStringList.Create;
  try
    for Reg in ALista do
    begin
      PartesFecha := Reg.Fecha.Split(['/']);
      if Length(PartesFecha) = 3 then
      begin
        Dia := IntToStr(StrToIntDef(PartesFecha[0], 0));
        Mes := IntToStr(StrToIntDef(PartesFecha[1], 0));
        Anio := PartesFecha[2];
      end
      else
      begin
        Dia := '1';
        Mes := '1';
        Anio := '2026';
      end;
      JsonTexto := Format('{"id": %d, "t1": "%s",' + sLineBreak +
                          '"t2": "%s","t3": "%s",' + sLineBreak +
                          '"hash":' + sLineBreak +
                          '"%s"}', [Reg.ID, Mes, Anio, Dia, Reg.Hash]);

      Contenido.Add(JsonTexto);
    end;

    Contenido.SaveToFile(ARutaArchivo, TEncoding.UTF8);
  finally
    Contenido.Free;
  end;
end;

{ Eventos de Botones y del Formulario }

procedure TForm1.Button10Click(Sender: TObject);
begin
  if GuardarJsonCifrados(Edit1, rutaArchivo) then
    ShowMessage('Los registros se guardaron correctamente.');
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  reg_actual := BuscarRegistroVencido - 1;
  Label2.Caption := IntToStr(reg_actual);
  mostrarregistros(reg_actual);
  if ListaRegistros[reg_actual].Pon = CREARHASH(Edit10.Text) then
  begin
    ShowMessage('Son iguales');
    VaciarRegistro(reg_actual);
    mostrarregistros(reg_actual);
  end
  else
    ShowMessage('NO....... Son iguales');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Hash1, Hash2: string;
begin
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('Ingresa un texto en Edit1.');
    Exit;
  end;

  if Trim(Edit2.Text) = '' then
  begin
    ShowMessage('Ingresa un texto en Edit2.');
    Exit;
  end;

  Hash1 := CREARHASH(Edit1.Text);
  Hash2 := CREARHASH(Edit2.Text);
  Memo1.Lines.Text := Hash1;
  Memo2.Lines.Text := Hash2;
  Application.ProcessMessages;

  if Hash1 = Hash2 then
    ShowMessage('Son iguales')
  else
    ShowMessage('Son diferentes');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if ListaRegistros = nil then
    Exit;

  if ListaRegistros.Count = 0 then
  begin
    if not CargarJsonDescifrados(memo5, edit1, rutaArchivo) then
      Exit;

    contador := 0;
    mostrarregistros(contador);
    Label1.Caption := Format('%d / %d', [contador + 1, ListaRegistros.Count]);
    Exit;
  end;

  if contador <= 0 then
    contador := ListaRegistros.Count - 1
  else
    Dec(contador);

  mostrarregistros(contador);
  Label1.Caption := Format('%d / %d', [contador + 1, ListaRegistros.Count]);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if ListaRegistros = nil then
    Exit;

  if ListaRegistros.Count = 0 then
  begin
    if not CargarJsonDescifrados(memo5, Edit1, rutaArchivo) then
      Exit;

    contador := 0;
    mostrarregistros(contador);
    Label1.Caption := Format('%d / %d', [contador + 1, ListaRegistros.Count]);
    Exit;
  end;

  contador := (contador + 1) mod ListaRegistros.Count;

  mostrarregistros(contador);
  Label1.Caption := Format('%d / %d', [contador + 1, ListaRegistros.Count]);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  GuardarJsonEnArchivo(memo5.Text, rutaArchivo);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  CargarJsonDescifrados(memo5, edit1, rutaArchivo);
end;

procedure TForm1.Button8Click(Sender: TObject);
const
  Modos: array[0..1] of string = ('CBC', 'CTR');
  Formatos: array[0..1] of string = ('base64', 'hexa');
var
  Anio, Mes, Dia: Word;
  ModoTexto, FormatoTexto: string;
  Json: TJSONObject;
begin
  try
    if Trim(Edit10.Text) = '' then
      raise Exception.Create('Escribe el valor que quieres cifrar.');

    if Edit1.Text = '' then
      raise Exception.Create('Edit1 debe contener la contraseña maestra.');

    ModoTexto := Modos[Random(2)];
    FormatoTexto := Formatos[Random(2)];

    ConfigurarAES(Edit1.Text, ModoTexto, FormatoTexto);

    DecodeDate(DateTimePicker1.Date, Anio, Mes, Dia);

    Json := TJSONObject.Create;
    try
      Json.AddPair('version', '1');
      Json.AddPair('densidad', ModoTexto);
      Json.AddPair('temperatura', FormatoTexto);
      Json.AddPair('pin', AESEncryption1.Encrypt(Edit10.Text));
      Json.AddPair('t1', AESEncryption1.Encrypt(Format('%.2d', [Dia])));
      Json.AddPair('t2', AESEncryption1.Encrypt(IntToStr(Anio)));
      Json.AddPair('t3', AESEncryption1.Encrypt(Format('%.2d', [Mes])));
      Json.AddPair('pon', CREARHASH(Edit10.Text));
      Json.AddPair('pinTexto', Edit10.Text);

      Memo5.Lines.Add(Json.ToJSON);
    finally
      Json.Free;
    end;

    Edit10.Clear;
  except
    on E: Exception do
      ShowMessage(E.ClassName + ': ' + E.Message);
  end;

  DateTimePicker1.Date := Date;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  JSONValue: TJSONValue;
  JSONObj: TJSONObject;
  ModoTexto, FormatoTexto: string;
  PinOriginal, DiaTexto, AnioTexto, MesTexto: string;
  Dia, Mes, Anio: Integer;

  function DesencriptarCampo(const Nombre: string): string;
  var
    Valor: TJSONValue;
  begin
    Valor := JSONObj.GetValue(Nombre);
    if Valor = nil then
      raise Exception.Create('No se encontró el campo "' + Nombre + '".');
    try
      Result := AESEncryption1.Decrypt(Valor.Value);
    except
      on E: Exception do
        raise Exception.Create('Falló al descifrar "' + Nombre + '": ' + E.Message);
    end;
  end;

begin
  JSONValue := TJSONObject.ParseJSONValue(Memo5.Text);

  if not (JSONValue is TJSONObject) then
  begin
    JSONValue.Free;
    ShowMessage('Memo5 no contiene un JSON válido.');
    Exit;
  end;

  try
    try
      JSONObj := TJSONObject(JSONValue);

      if Edit1.Text = '' then
        raise Exception.Create('Edit1 debe contener la misma contraseña maestra.');

      if (JSONObj.GetValue('densidad') = nil) or
         (JSONObj.GetValue('temperatura') = nil) or
         (JSONObj.GetValue('pin') = nil) or
         (JSONObj.GetValue('t1') = nil) or
         (JSONObj.GetValue('t2') = nil) or
         (JSONObj.GetValue('t3') = nil) then
        raise Exception.Create('Al JSON le faltan campos.');

      ModoTexto := UpperCase(JSONObj.GetValue('densidad').Value);
      FormatoTexto := LowerCase(JSONObj.GetValue('temperatura').Value);

      if (ModoTexto <> 'CBC') and (ModoTexto <> 'CTR') then
        raise Exception.Create('Modo AES desconocido: ' + ModoTexto);

      if (FormatoTexto <> 'base64') and (FormatoTexto <> 'hexa') then
        raise Exception.Create('Formato desconocido: ' + FormatoTexto);

      ConfigurarAES(Edit1.Text, ModoTexto, FormatoTexto);

      PinOriginal := DesencriptarCampo('pin');
      DiaTexto := DesencriptarCampo('t1');
      AnioTexto := DesencriptarCampo('t2');
      MesTexto := DesencriptarCampo('t3');

      Dia := StrToInt(DiaTexto);
      Anio := StrToInt(AnioTexto);
      Mes := StrToInt(MesTexto);

      DateTimePicker1.Date := EncodeDate(Anio, Mes, Dia);
      Edit10.Text := PinOriginal;
    except
      on E: Exception do
        ShowMessage(E.ClassName + ': ' + E.Message);
    end;
  finally
    JSONValue.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  txt := '20/10/2026';
  DateTimePicker1.Date := Date;
  ruta := ExtractFilePath(ParamStr(0));

  rutaArchivo := ruta + 'mysqld.dll';
  if not TFile.Exists(rutaArchivo) then
    TFile.WriteAllText(rutaArchivo, '', TEncoding.UTF8);

  ii := 0;
  ListaJson := TStringList.Create;

  Edit1.Text := 'BlackWolfMX';
  contador := 0;

  SHA3Hash1.HashSizeBits := 256;
  SHA3Hash1.OutputFormat := hexa;
  SHA3Hash1.Unicode := yesUni;
  Myhash := SHA3Hash1.Hash('BlackWolfMX');

  if ListaRegistros = nil then
    ListaRegistros := TList<TRegistroJson>.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ListaJson.Free;
end;

end.
