program AperturaSinConexion;

{$APPTYPE CONSOLE}

uses
  Forms, System.SysUtils, Winapi.Windows, ImagenesReportes, ppCtrls, System.Classes, Data.DB,
  main in '..\main.pas' {Fmain},
  d_m in '..\d_m.pas' {DM: TDataModule},
  login in '..\login.pas' {FLogin},
  SCOAlta in '..\Forms\SCOAlta.pas' {fscoalta},
  scoage_alta in '..\Forms\scoage_alta.pas' {fscoage_alta},
  about in '..\Forms\about.pas' {Fabout},
  RG in '..\Forms\RG.pas' {Frg},
  sco_aux_impresion in '..\Forms\sco_aux_impresion.pas' {F_aux_imp},
  rg_1 in '..\Forms\rg_1.pas' {Frg_1},
  scoage_bus in '..\Forms\scoage_bus.pas' {Fscoage_bus},
  sco_cat_grupo in '..\Forms\sco_cat_grupo.pas' {Fcat_gru},
  config in '..\Forms\config.pas' {FConfig},
  Reportearchivar in '..\Forms\Reportearchivar.pas' {FReportearchivar},
  RG_historico in '..\Forms\RG_historico.pas' {FRG_historico},
  SCO_auxiliar_alta_edicion in '..\Forms\SCO_auxiliar_alta_edicion.pas' {FSCO_auxiliar_alta_edicion},
  sco_age_aux in '..\Forms\sco_age_aux.pas' {fsco_age_aux},
  scoconsultas in '..\Forms\scoconsultas.pas' {FSCOconsultas};



type
  TContadorAperturas = class
    Total: Integer;
    procedure Contar(DataSet: TDataSet);
  end;

procedure TContadorAperturas.Contar(DataSet: TDataSet);
begin
  Inc(Total);
end;

procedure ProbarLecturasBase;
var
  Configuracion: TStringList;
  InicioLectura: UInt64;
  Base: string;
  Contador: TContadorAperturas;
begin
  Base := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  Configuracion := TStringList.Create;
  try
    Configuracion.LoadFromFile(Base + 'dll\conf.dll', TEncoding.UTF8);
    if Configuracion.Count < 5 then
      raise Exception.Create('Configuracion incompleta para la prueba de lectura');
    DM.MyConnection1.Username := Configuracion[0];
    DM.MyConnection1.Password := Configuracion[1];
    DM.MyConnection1.Server := Configuracion[2];
    DM.MyConnection1.Database := Configuracion[3];
    DM.MyConnection1.Port := StrToInt(Configuracion[4]);
  finally
    Configuracion.Free;
  end;
  InicioLectura := GetTickCount64;
  DM.MyConnection1.Connected := True;
  // Estas opciones solo se aplican al proceso de prueba, nunca a la aplicacion.
  DM.TCO.ReadOnly := True;
  DM.Tage.ReadOnly := True;
  DM.QCO.ReadOnly := True;
  DM.QAGE.ReadOnly := True;
  DM.Qco_his.ReadOnly := True;
  try
    Writeln('Conexion: ', GetTickCount64 - InicioLectura, ' ms.');
    InicioLectura := GetTickCount64;
    fscoalta.PrepararApertura;
    Writeln('Preparar Altas (conexion real, solo lectura): ',
      GetTickCount64 - InicioLectura, ' ms.');
    if DM.TCO.State <> dsBrowse then
      raise Exception.Create('La preparacion dejo el oficio en edicion');
    if not DM.TCO.IsEmpty then
    begin
      DM.TCO.Locate('id', DM.TCO.FieldByName('id').AsInteger, []);
    end;
    DM.QCO.DisableControls;
    try
      DM.QCO.Close;
      DM.QCO.SQL.LoadFromFile(Base + 'sql\main\co.sql', TEncoding.UTF8);
      DM.QCO.SQL.Add('ORDER BY co.id');
      InicioLectura := GetTickCount64;
      DM.QCO.Open;
      Writeln('Reporte, apertura progresiva: ', GetTickCount64 - InicioLectura, ' ms.');
      DM.QCO.Close;
      DM.QCO.FetchAll := True;
      InicioLectura := GetTickCount64;
      DM.QCO.Open;
      Writeln('Reporte, carga completa de ', DM.QCO.RecordCount,
        ' filas: ', GetTickCount64 - InicioLectura, ' ms.');
      DM.QCO.Close;
      DM.QCO.FetchAll := False;
    finally
      DM.QCO.EnableControls;
    end;
    InicioLectura := GetTickCount64;
    DM.ConsultarAgenda('', '', '', '', '');
    Writeln('Agenda, busqueda inicial: ', GetTickCount64 - InicioLectura, ' ms.');
    DM.ConsultarAgenda('O''Connor' + #241, '', '', '', '');
    DM.Tage.Open;
    if not DM.Tage.IsEmpty then
    begin
      DM.Tage.Locate('id_age', DM.Tage.FieldByName('id_age').AsInteger, []);
    end;
    FRG_historico.Query(True);
    FReportearchivar.Query(True);
    // Un cambio de tipo puede cambiar tambien el combo de clase: solo una consulta.
    Contador := TContadorAperturas.Create;
    try
      Frg.Query(True);
      DM.QCO.BeforeOpen := Contador.Contar;
      Contador.Total := 0;
      Frg.ComboBox3Change(Frg.ComboBox3);
      if Contador.Total <> 1 then
        raise Exception.Create('Reportes repitio la consulta por un cambio de combo');
      DM.Qco_his.BeforeOpen := Contador.Contar;
      Contador.Total := 0;
      FRG_historico.ComboBox3Change(FRG_historico.ComboBox3);
      if Contador.Total <> 1 then
        raise Exception.Create('Historico repitio la consulta por un cambio de combo');
      Contador.Total := 0;
      FReportearchivar.ComboBox3Change(FReportearchivar.ComboBox3);
      if Contador.Total <> 1 then
        raise Exception.Create('Archivo repitio la consulta por un cambio de combo');
    finally
      DM.QCO.BeforeOpen := nil;
      DM.Qco_his.BeforeOpen := nil;
      Contador.Free;
    end;
    Writeln('OK: un cambio de combo produce una sola consulta en los tres reportes.');
    Writeln('OK: seleccion y filtros de reportes.');
    Writeln('OK: lecturas terminadas sin Insert, Edit, Post ni ExecSQL.');
  finally
    DM.MyConnection1.Disconnect;
  end;
end;

var
  Inicio: UInt64;
  I, Imagenes: Integer;
  Ventana: TComponent;
begin
  try
  Inicio := GetTickCount64;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Control de Oficios';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFmain, Fmain);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(Tfscoage_alta, fscoage_alta);
  Application.CreateForm(TFabout, Fabout);
  Application.CreateForm(TFrg, Frg);
  Application.CreateForm(Tfscoalta, fscoalta);
  Application.CreateForm(TF_aux_imp, F_aux_imp);
  Application.CreateForm(TFrg_1, Frg_1);
  Application.CreateForm(TFscoage_bus, Fscoage_bus);
  Application.CreateForm(TFcat_gru, Fcat_gru);
  Application.CreateForm(TFConfig, FConfig);
  Application.CreateForm(TFReportearchivar, FReportearchivar);
  Application.CreateForm(TFRG_historico, FRG_historico);
  Application.CreateForm(TFSCO_auxiliar_alta_edicion, FSCO_auxiliar_alta_edicion);
  Application.CreateForm(Tfsco_age_aux, fsco_age_aux);
  Application.CreateForm(TFSCOconsultas, FSCOconsultas);
  if DM.MyConnection1.Connected then
    raise Exception.Create('La prueba no debe abrir una conexion');
  if DM.QCO.Active or DM.TCO.Active or DM.Tage.Active then
    raise Exception.Create('La construccion abrio datos sin conexion');
  if DM.QCO.FetchAll or DM.TCO.FetchAll or DM.Tage.FetchAll then
    raise Exception.Create('La carga progresiva no esta configurada');
  if (DM.QCO.FetchRows <> 50) or (DM.TCO.FetchRows <> 50) or
     (DM.Tage.FetchRows <> 50) then
    raise Exception.Create('Tamano de bloque incorrecto');
  Writeln('OK: formularios construidos sin conexion ni consultas activas.');
  Writeln('OK: carga progresiva de oficios, agenda y reportes.');
  Writeln('Construccion local: ', GetTickCount64 - Inicio, ' ms.');
  Frg.PrepararApertura('Alta');
  if DM.QCO.Active then
    raise Exception.Create('PrepararApertura consulto antes de mostrar la ventana');
  Imagenes := 0;
  for Ventana in TArray<TComponent>.Create(TComponent(Frg), TComponent(FRG_historico),
    TComponent(FReportearchivar), TComponent(fscoage_alta),
    TComponent(Fscoage_bus), TComponent(F_aux_imp), TComponent(FSCOconsultas)) do
  begin
    PrepararLogosImpresion(Ventana);
    for I := 0 to Ventana.ComponentCount - 1 do
      if Ventana.Components[I] is TppImage then
      begin
        if TppImage(Ventana.Components[I]).Picture.Graphic = nil then
          raise Exception.Create('Falta el logotipo del reporte');
        if TppImage(Ventana.Components[I]).Picture.Width <= 0 then
          raise Exception.Create('Logotipo invalido');
        Inc(Imagenes);
      end;
  end;
  if Imagenes <> 11 then
    raise Exception.Create('No se comprobaron los once logotipos');
  Writeln('OK: once logotipos cargados del recurso compartido sin imprimir.');
  Writeln('OK: preparacion del reporte sin abrir su consulta.');
  if FindCmdLineSwitch('base-solo-lectura') then ProbarLecturasBase;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      ExitCode := 1;
    end;
  end;
end.
