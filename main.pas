  unit main;

  interface

  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Menus, ExtCtrls, ComCtrls, JvExExtCtrls, JvImage, StdCtrls, DateUtils,
    Vcl.DBCtrls, CryptBase, HashObj;

type
  // Declaración del record para configuraciones
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
    private

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
  var
    CursorAnterior: TCursor;
  begin
    if not dm.MyConnection1.Connected then
    begin
      ShowMessage('Inicie sesion antes de abrir los oficios.');
      Exit;
    end;

    CursorAnterior := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      // SGTD.dpr ya crea esta ventana: no construir una segunda instancia.
      fscoalta.PrepararApertura;
    finally
      Screen.Cursor := CursorAnterior;
    end;

    fscoalta.Timer1.Enabled := True;
    fscoalta.Timer2.Enabled := True;
    try
      fscoalta.ShowModal;
    finally
      fscoalta.Timer1.Enabled := False;
      fscoalta.Timer2.Enabled := False;
    end;
  end;
  //----------------------------------------------------------------------------
  //
  // Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
  //
  //----------------------------------------------------------------------------
  procedure TFmain.Alta2Click(Sender: TObject);
    var
    f: tfscoage_alta;
    begin
     f:= tfscoage_alta.Create(Application);
       if not dm.Tage.Active then
          begin
             dm.Tage.Open;
          end;

          try
              f.clear;
              f.ShowModal;
          finally
             f.Free
          end;
    end;
  {============================================================================}
  {============================================================================}
  procedure TFmain.Busqueda2Click(Sender: TObject);
    VAR F : Tfscoage_bus;
    begin
        F:= Tfscoage_bus.Create(APPLICATION);
        TRY
          F.ShowModal;
        FINALLY
          F.Free;
        END;
    end;

  procedure TFmain.c1Click(Sender: TObject);
    begin
      fconfig.Show;
    end;
  {============================================================================}
  procedure TFmain.C2Click(Sender: TObject);
    var
      F: TFSCO_auxiliar_alta_edicion;
      begin
          if not dm.tcor.Active then
               dm.tcor.Open;
          if not dm.ncor.Active then
               dm.ncor.Open;
          if not dm.ccor.Active then
               dm.ccor.Open;
            f := TFSCO_auxiliar_alta_edicion.Create(application);

            try
              f.ShowModal;
            finally
              f.free;
            end;
      end;
  {============================================================================}
  procedure TFmain.consultas1Click(Sender: TObject);
  var
  ArchivoSQL: string;
begin
  try
    ArchivoSQL := ValidarYObtenerRutaArchivo(fmain.ruta, MainPath + 'co.sql');
    if dm.MyConnection1.Connected then
    begin
      // Carga QCO
      dm.QCO.Close;
      dm.QCO.SQL.Clear;
      dm.QCO.SQL.LoadFromFile(ArchivoSQL);
      dm.QCO.SQL.Add('ORDER BY CO.id');
      dm.QCO.Open;
      dm.QCO.Last;

      // Carga QCOH
      dm.QCOH.Close;
      dm.QCOH.SQL.Clear;
      dm.QCOH.SQL.LoadFromFile(ArchivoSQL);
      dm.QCOH.SQL.Add('ORDER BY CO.id');
      dm.QCOH.Open;
      dm.QCOH.Last;
    end;
    Frg.ShowModal;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
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
      ListBox1.Items.LoadFromFile(ArchivoIni);
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

      IndiceImagen := Random(8);
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
          if  not dm.Qco_his.Active then
               dm.Qco_his.Open;
          FRG_historico.Show;
        end;
    end;
  {============================================================================}
  procedure TFmain.FormClose(Sender: TObject; var Action: TCloseAction);
    begin
        dm.MyConnection1.Disconnect;
    end;
  {============================================================================}
  procedure TFmain.FormCreate(Sender: TObject);
  begin
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
      title := 'Sistema de Correspondencia del Congreso del Estado de Campeche';
      Ttitle := 'Expedido por: Sistema de Correspondencia del Congreso del Estado de Campeche';
      fmain.CopyRight := 'by vroa74 © '+IntToStr(ObtenerAnoActual)+'.';
      fmain.Caption := title+' '+IntToStr(ObtenerAnoActual)+'.';
      contx :=1;
      cambio := random(2)*3;
  end;
  {============================================================================}
  procedure TFmain.G1Click(Sender: TObject);
      VAR F:Tfcat_gru;
      begin
        if dm.MyConnection1.Connected then
             begin
                 dm.QCAT_GRU.Close;
                 dm.QCAT_GRU.SQL.Clear;
                 dm.QCAT_GRU.SQL.Add('SELECT * FROM  cat_gru');
                 dm.QCAT_GRU.SQL.Add('ORDER BY  cat_gru.id_grupo');
                 dm.QCAT_GRU.Open;
             end;
                F:= Tfcat_gru.Create(aPPLICATION);
             TRY
                 F.ShowModal;
             FINALLY
                F.Free;
             END;
        end;
  {============================================================================}
  {============================================================================}
  procedure TFmain.Loguin2Click(Sender: TObject);
  var
    ArchivoIco, ArchivoIcoh: string;
  begin
    flogin.ShowModal;

    if dm.MyConnection1.Connected then
    begin
      try
        ArchivoIco := ValidarYObtenerRutaArchivo(fmain.ruta, MainPath + 'ico.sql');
        ArchivoIcoh := ValidarYObtenerRutaArchivo(fmain.ruta, MainPath + 'icoh.sql');

        dm.QCO.Close;
        dm.QCO.SQL.Clear;
        dm.QCO.SQL.LoadFromFile(ArchivoIco);
        dm.QCO.Open;
        dm.QCO.Last;

        dm.QCOH.Close;
        dm.QCOH.SQL.Clear;
        dm.QCOH.SQL.LoadFromFile(ArchivoIcoh);
        dm.QCOH.Open;
        dm.QCOH.Last;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    end;
  end;

  end.
