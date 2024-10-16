  unit main;

  interface

  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Menus, ExtCtrls, ComCtrls, JvExExtCtrls, JvImage, StdCtrls, DateUtils,
    Vcl.DBCtrls;

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
      Busqueda1: TMenuItem;
      Reportes1: TMenuItem;
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
      Archivo2: TMenuItem;
      SCOArchivar1: TMenuItem;
      SeguimientoaTrmitedeRespuesta1: TMenuItem;
      A1: TMenuItem;
      AGENDAGRUPO1: TMenuItem;
      GRUPOPERSONA1: TMenuItem;
      grupos1: TMenuItem;
      c1: TMenuItem;
      Reportesgenerales1: TMenuItem;
      bg: TDBImage;
      N1: TMenuItem;
      C2: TMenuItem;
      N2: TMenuItem;
      N3: TMenuItem;
      N4: TMenuItem;

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
      procedure Busqueda1Click(Sender: TObject);
      procedure Reportes1Click(Sender: TObject);
      procedure de1Click(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
      procedure consultas1Click(Sender: TObject);
      procedure Reportes2Click(Sender: TObject);
      procedure SCOArchivar1Click(Sender: TObject);
      procedure SeguimientoaTrmitedeRespuesta1Click(Sender: TObject);
      procedure Salir1Click(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure G1Click(Sender: TObject);
      procedure A1Click(Sender: TObject);
      procedure AGENDAGRUPO1Click(Sender: TObject);
      procedure GRUPOPERSONA1Click(Sender: TObject);
      procedure c1Click(Sender: TObject);
      procedure Reportesgenerales1Click(Sender: TObject);
      procedure C2Click(Sender: TObject);
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
    end;

  var
    Fmain: TFmain;

implementation

    uses login, d_m, scoage_alta, scoage_edi, scoage_bus, scoalta, scoedi, scobus, scoconsultas, about,
    rg, SEGUIMIENTO, Archivo, SArchivo, sco_cat_grupo, SCOALTAGRUPO, sco_ins_gru, sco_bus_gru,
    sco_alta_gru,  sco_alta_gru_per, SCO_alta_age_grupo, config, Reportearchivar, RG_historico,
    SCO_auxiliar_alta_edicion;

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

  function ObtenerAnoActual: Integer;
    begin
      Result := YearOf(Now);
    end;

  procedure TFmain.A1Click(Sender: TObject);
    VAR   F:TFSCOALTAGRUPO;
  begin
      F:= TFSCOALTAGRUPO.Create(APPLICATION);
        TRY
           F.ShowModal;
        FINALLY
           F.Free;
        END;
  end;

  procedure TFmain.AGENDAGRUPO1Click(Sender: TObject);
    VAR F:Tfsco_alta_gru;
    begin
         F:= TFsco_alta_gru.Create(aPPLICATION);
         TRY
           F.ShowModal;
         FINALLY
           F.Free;
         END;
    end;

  procedure TFmain.Alta1Click(Sender: TObject);
    var f : tfscoalta;
    begin
          f := tfscoalta.Create(application);
            if not dm.tcor.Active then
             dm.tcor.Open;

            if not dm.ncor.Active then
                 dm.ncor.Open;

            if not dm.ccor.Active then
                 dm.ccor.Open;

          try
            f.ShowModal;
          finally
            f.free;
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
  procedure TFmain.Busqueda1Click(Sender: TObject);
    var
       f : TFscobus;
    begin
      if dm.MyConnection1.Connected then
         begin
             dm.QCO.Close;
             dm.QCO.SQL.Clear;
             dm.QCO.SQL.LoadFromFile(fmain.ruta+ MainPath + 'co.sql');
             dm.QCO.SQL.add('ORDER BY  CO.id');
             dm.QCO.Open;
             dm.QCO.Last;

             dm.QCOH.Close;
             dm.QCOH.SQL.Clear;
             dm.QCOH.SQL.LoadFromFile(fmain.ruta+  MainPath +  'co.sql');
             dm.QCOH.SQL.add('ORDER BY  CO.id');
             dm.QCOH.Open;
             dm.QCOH.Last;
         end;
         f := TFscobus.Create(Application);
         try
           f.ShowModal
         finally
           f.free;
         end;
    end;
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
    begin
      if dm.MyConnection1.Connected then
         begin
             dm.QCO.Close;
             dm.QCO.SQL.Clear;
             dm.QCO.SQL.LoadFromFile(fmain.ruta+  MainPath +  'co.sql');
             dm.QCO.SQL.add('ORDER BY  CO.id');
             dm.QCO.Open;
             dm.QCO.Last;
      {------------------------------------------------------------------------------}
             dm.QCOH.Close;
             dm.QCOH.SQL.Clear;
             dm.QCOH.SQL.LoadFromFile(fmain.ruta +  MainPath +  'co.sql');
             dm.QCOH.SQL.add('ORDER BY  CO.id');
             dm.QCOH.Open;
             dm.QCOH.Last;
         end;
         Frg.ShowModal;
    end;
  {============================================================================}
  procedure TFmain.de1Click(Sender: TObject);
    var f:tfabout;
    begin
        Fabout.Show;
    end;
  {============================================================================}
  procedure   Tfmain.endweek(fecha:TDateTimePicker);
  var
      FIni, FFin  :String;
      A,M,D : Word;
      va, vb,vc,vd : integer;
      aa,mm,dd:integer;
      fecha0, fecha1:tdate;
      frstDay,toDay, dateh : TDateTime;
      sabado, domingo : Tdate;
      helpdate: TDateTimePicker;
      week : Integer;
      i,j:integer;
      aux:char;
  begin
       DateTimePicker1 := fecha;
       fecha0:= DateTimePicker1.Date;
       i := 0;
       j := 0;
       ListBox1.Items.LoadFromFile(ruta+'date.ini');
       j:= ListBox1.Items.Count;
       for i := 0 to  j- 1 do
         begin
            DateTimePicker2.Date := StrToDate (ListBox1.Items.Strings[i]);
            dateh := DateTimePicker2.Date;
            if (DateTimePicker1.Date = dateh) then
                ShowMessage('este dia es inhabil......................');
         end;
          begin
              fecha0:= DateTimePicker1.Date;
              DecodeDate(fecha0,A,M,D);
               aa:=a;
               M:=1;
               d:=1;
              frstDay :=EncodeDate(A,M,D);
              fecha0:= DateTimePicker1.Date;
              DecodeDate(fecha0,A,M,D);
              toDay := DateTimePicker1.Date;
              week := Trunc((toDay - frstDay) / 7)+1 ;
              domingo:= (EndOfAWeek( a,week-1 ));
              fecha1:= EndOfAWeek( a,week );//sabado
              sabado:= fecha1-1;
              DateTimePicker2.Date := domingo;
              if (DateTimePicker1.Date = DateTimePicker2.Date) then
                  ShowMessage('Este dia es Domingo Fin de semana...');
              DateTimePicker2.Date := sabado;
              if (DateTimePicker1.Date = DateTimePicker2.Date) then
                  ShowMessage('Este dia es Sabado Fin de semana...');
          end;
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
  {============================================================================}
  procedure TFmain.SCOArchivar1Click(Sender: TObject);
    begin
        if dm.MyConnection1.Connected then
         begin
             dm.QCO.Close;
             dm.QCO.SQL.Clear;
             dm.QCO.SQL.LoadFromFile(fmain.ruta+  MainPath +  'ico.sql');
             dm.QCO.Open;
             dm.QCO.Last;
             FArchivo.DBGrid1.Refresh;
      {------------------------------------------------------------------------------}
             dm.QCOH.Close;
             dm.QCOH.SQL.Clear;
             dm.QCOH.SQL.LoadFromFile(fmain.ruta+  MainPath +   'icoh.sql');
             dm.QCOH.Open;
             dm.QCOH.Last;
             FArchivo.DBGrid2.Refresh;
           end;
      fArchivo.ShowModal;
    end;
  {============================================================================}
  procedure TFmain.SeguimientoaTrmitedeRespuesta1Click(Sender: TObject);
    begin
      FSArchivo.ShowModal;
    end;
  {============================================================================}
  procedure TFmain.Timer1Timer(Sender: TObject);
    begin
       fmain.StatusBar1.Panels[2].Text := fmain.PutDate;
       fmain.StatusBar1.Panels[3].Text := fmain.PutTime;
       fmain.StatusBar1.Panels[3].Text := inttostr(cambio);
       fmain.StatusBar1.Panels[4].Text := inttostr(contx);
         if usuario <> ''  then
            fmain.StatusBar1.Panels[1].Text := 'Usuario :  ' +fmain.usuario;

          if (cambio = contx) then
              begin
                 randomize;
                  cambio := random(10)*60;
                  bg.Picture.LoadFromFile( fmain.ruta+'media\cp\cam'+inttostr(random(8))+'.png');

              end;
          contx := contx + 1;
    end;

  procedure Tfmain.RemoveHint ( Hint: THintWindow);
     begin
       Hint.ReleaseHandle;
       Hint.Free;
     end;
  {============================================================================}
  procedure TFmain.Reportes1Click(Sender: TObject);
    var
    f: TFscoconsultas;
    begin
      if dm.MyConnection1.Connected then
           begin
               dm.QCO.Close;
               dm.QCO.SQL.Clear;
               dm.QCO.SQL.LoadFromFile(fmain.ruta+  MainPath +  'co.sql');
               dm.QCO.SQL.add('ORDER BY  CO.id');
               dm.QCO.Open;
               dm.QCO.Last;
        {------------------------------------------------------------------------------}
               dm.QCOH.Close;
               dm.QCOH.SQL.Clear;
               dm.QCOH.SQL.LoadFromFile(fmain.ruta+  MainPath +   'co.sql');
               dm.QCOH.SQL.add('ORDER BY  CO.id');
               dm.QCOH.Open;
               dm.QCOH.Last;
           end;
      f := TFscoconsultas.Create(Application);
       try
         f.ShowModal;
       finally
         f.Free;
       end;
    end;
  {============================================================================}
  procedure TFmain.Reportes2Click(Sender: TObject);
    VAR F : TFSEGUIMIENTO;
    begin
      if dm.MyConnection1.Connected then
         begin
             dm.QCO.Close;
             dm.QCO.SQL.Clear;
             dm.QCO.SQL.LoadFromFile(fmain.ruta+  MainPath +  'co.sql');
             dm.QCO.SQL.add('ORDER BY  CO.id');
             dm.QCO.Open;
             dm.QCO.Last;
             dm.QCOH.Close;
             dm.QCOH.SQL.Clear;
             dm.QCOH.SQL.LoadFromFile(fmain.ruta  +   MainPath +  'co.sql');
             dm.QCOH.SQL.add('ORDER BY  CO.id');
             dm.QCOH.Open;
             dm.QCOH.Last;
         end;
         F := TFSEGUIMIENTO.Create(APPLICATION);
         TRY
           F.ShowModal;
         FINALLY
           F.Free;
         END;
    end;
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
      randomize;
      mmedia :='Media\';
      cconfig := 'dll\';
      OFICIOS1.Visible := FALSE;
      Archivo2.Visible := FALSE;
      CATALOGOS1.Visible := FALSE;
      grupos1.Visible := false;
      ruta := ExtractFilePath(Application.ExeName);//  JvImage1.Picture.LoadFromFile(ruta+'sco.jpg');
      fmain.StatusBar1.Panels[2].Text := fmain.PutDate;
      fmain.StatusBar1.Panels[3].Text := fmain.PutTime;
      MainPath := 'sql\main\';
      title := 'Sistema de Correspondencia del Congreso del Estado de Campeche';
      Ttitle := 'Expedido por: Sistema de Correspondencia del Congreso del Estado de Campeche';
      fmain.CopyRight := 'by vroa74 © '+IntToStr(ObtenerAnoActual)+'.';
      fmain.Caption := title+' '+IntToStr(ObtenerAnoActual)+'.';
      contx :=0;
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
  procedure TFmain.GRUPOPERSONA1Click(Sender: TObject);
    var f:tFSCO_alta_age_grupo;
    begin
          f:= tFSCO_alta_age_grupo.Create(Application);
          try
            f.ShowModal;
          finally
             f.Free
          end;
    end;
  {============================================================================}
  procedure TFmain.Loguin2Click(Sender: TObject);
    begin
      flogin.ShowModal;
        if dm.MyConnection1.Connected then
           begin
               dm.QCO.Close;
               dm.QCO.SQL.Clear;
               dm.QCO.SQL.LoadFromFile(fmain.ruta+  MainPath +  'ico.sql');
               dm.QCO.Open;
               dm.QCO.Last;

               dm.QCOH.Close;
               dm.QCOH.SQL.Clear;
               dm.QCOH.SQL.LoadFromFile(fmain.ruta+  MainPath +  'icoh.sql');
               dm.QCOH.Open;
               dm.QCOH.Last;
             end;
    end;

end.
