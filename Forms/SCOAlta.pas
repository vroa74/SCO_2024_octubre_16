unit SCOAlta;
//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Romon Ortiz Abreu.
//
//------------------------------------------------------------------------------
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, DBAdvGlowNavigator, DBAdvNavigator,
  JvDBControls, ExtCtrls, AdvDateTimePicker, AdvDBDateTimePicker, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, Mask, JvExExtCtrls, JvImage, Grids,
  DBGrids, JvExtComponent, JvRollOut, Buttons, ppParameter, ppBands, ppMemo,
  ppStrtch, ppCtrls, jpeg, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, JvBaseDlg, JvSelectDirectory, JvExMask,
  JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,   Data.DB,
  JvDBDatePickerEdit, AdvEdit, AdvEdBtn, PlannerDatePicker, PlannerDBDatePicker;
type
  Tfscoalta = class(TForm)
    GroupBox6: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;

    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;

    Button4: TButton;
    Button5: TButton;


    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;

    JvImage1: TJvImage;
    DBAdvGlowNavigator1: TDBAdvGlowNavigator;
    ncor: TDBComboBox;
    tcor: TDBComboBox;
    ccor: TDBComboBox;
    nhoj: TDBEdit;
    nofi: TDBEdit;
    des: TDBMemo;
    seguimiento: TDBMemo;
    tramite: TDBCheckBox;
    rem_nombre: TDBEdit;
    rem_cargo: TDBEdit;
    rem_deporg: TDBEdit;
    tur_nom: TDBEdit;
    tur_cargo: TDBEdit;
    tur_deporg: TDBEdit;
    xxx: TButton;

    Edit1: TEdit;
    JvSelectDirectory1: TJvSelectDirectory;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    fcap: TJvDBDateTimePicker;
    frec: TJvDBDateTimePicker;
    fofi: TJvDBDateTimePicker;
    val: TCheckBox;
    Timer2: TTimer;


    procedure lockmsg;
    procedure lock (bandera:boolean);

    procedure myhead;
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBAdvGlowNavigator1Click(Sender: TObject;
      Button: TAdvNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);



    procedure BitBtn3MouseEnter(Sender: TObject);
    procedure Button4MouseEnter(Sender: TObject);
    procedure Button5MouseEnter(Sender: TObject);
    procedure tcorChange(Sender: TObject);
    procedure BitBtn1MouseEnter(Sender: TObject);
    procedure BitBtn2MouseEnter(Sender: TObject);
    procedure BitBtn1MouseLeave(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnInsert(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnFirst(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnLast(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnNext(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnPrior(Sender: TObject);
    procedure xxxClick(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnPost(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnEdit(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnCancel(Sender: TObject);
    procedure fcapEnter(Sender: TObject);
    procedure ncorClick(Sender: TObject);
    procedure tcorClick(Sender: TObject);
    procedure frecEnter(Sender: TObject);
    procedure ncorEnter(Sender: TObject);
    procedure tcorEnter(Sender: TObject);
    procedure ccorEnter(Sender: TObject);
    procedure nhojEnter(Sender: TObject);
    procedure nofiEnter(Sender: TObject);
    procedure fofiEnter(Sender: TObject);
    procedure desEnter(Sender: TObject);
    procedure seguimientoEnter(Sender: TObject);
    procedure rem_nombreEnter(Sender: TObject);
    procedure rem_cargoEnter(Sender: TObject);
    procedure rem_deporgEnter(Sender: TObject);
    procedure Button5Enter(Sender: TObject);
    procedure tur_nomEnter(Sender: TObject);
    procedure tur_cargoEnter(Sender: TObject);
    procedure tur_deporgEnter(Sender: TObject);
    procedure Button4Enter(Sender: TObject);
    procedure tramiteEnter(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
      mango:THintWindow;
      FPreparando: Boolean;
      FImagenCargada: string;
  public
    dir: string;
    t, e, ins, edi, I_E  :bool;
    td, ed :Tdate;
    tu, eu :string;
    registro:integer;
    mas: bool;
    myway : string;
    ntcor:integer;
    editar: boolean;
    accion:char;
    { Public declarations }
    procedure PrepararApertura;
    function ValidarYObtenerRutaArchivo(const RutaRelativa: string): string;

  end;

var
  fscoalta: Tfscoalta;

implementation

uses login, main, d_m,
sco_age_aux,
sco_aux_impresion, RG;

{$R *.dfm}

function Tfscoalta.ValidarYObtenerRutaArchivo(const RutaRelativa: string): string;
begin
  Result := IncludeTrailingPathDelimiter(fmain.ruta) + RutaRelativa;
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

procedure Tfscoalta.lockmsg;
begin
     if dm.MyConnection1.Connected then
        begin
          if editar = true then
          ShowMessage('No es posible modificar los datos, ya que el registro esta en modo de solo visualizacion. Si desea realizar otra accion, por favor, presione primero el boton "Editar" o "Insertar".');
        end;

end;
{------------------------------------------------------------------------------}

procedure Tfscoalta.lock (bandera:boolean);
//
begin//xxx
    if dm.MyConnection1.Connected then
       begin
         fcap.ReadOnly := bandera;
         frec.ReadOnly := bandera;
         ncor.ReadOnly := bandera;
         tcor.ReadOnly := bandera;
         ccor.ReadOnly := bandera;
         nofi.ReadOnly := bandera;
         nhoj.ReadOnly := bandera;
         fofi.ReadOnly := bandera;
         des.ReadOnly := bandera;
         seguimiento.ReadOnly := bandera;
         tramite.ReadOnly := bandera;
         rem_nombre.ReadOnly := bandera;
         rem_cargo.ReadOnly := bandera;
         rem_deporg.ReadOnly := bandera;
         tur_nom.ReadOnly := bandera;
         tur_cargo.ReadOnly := bandera;
         tur_deporg.ReadOnly := bandera;
       end;

end;
{-------------------------------------------------------------------------------}
procedure Tfscoalta.xxxClick(Sender: TObject);
var
  fe, fd:string;
  i: integer;
begin
  fd :='';
 JvSelectDirectory1.Execute;
 fd := JvSelectDirectory1.Directory;
 Edit1.Text := JvSelectDirectory1.Directory;
 fe := fmain.PutDate+ '///'+fmain.PutTime;
 for i := 0 to length(fe) do
  if ((fe[i] <> '/')and (fe[i] <> '.') and (fe[i] <> ':')and (fe[i] <> ' ')) then
      fe[i]:= fe[i]
       else
      fe[i]:= '_';
      Edit1.Text := fe;
     if fd = '' then
        fd :=fmain.ruta+fe;
 If not DirectoryExists(fd+fe) then
         CreateDir(fd+fe);
     dm.MyBackup1.Path := fd+fe;
//     dm.MyBackup1.Dispatch();
    try
     dm.MyBackup1.Backup;
    except
       on E: Exception do
          begin
            ShowMessage('Error: ' + E.ClassName + ' ' + E.Message);
          end;
    end;
end;

{-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------}

{**************************************************************************************************}
{**************************************************************************************************}
procedure Tfscoalta.myhead;
begin
  if dm.MyConnection1.Connected then
     begin
       Label11.Caption := IntToStr (dm.TCO.FieldByName('id').AsInteger);
     end;
   Label10.Caption := 'Folio: ';
   if dm.TCO.FieldByName('tramite').AsBoolean then
      begin
          Label11.Visible := true;
          Label10.Caption := 'Folio: ';
          Label9.Caption := 'En Tramite';
          GroupBox6.Color:= ClMaroon;
      end;
   if (dm.TCO.FieldByName('tramite').AsBoolean)and( (dm.TCO.FieldByName('estatus').AsBoolean))  then
      begin
          Label9.Caption:='Concluido';
          GroupBox6.Color:= clTeal;
      end;
   if (not dm.TCO.FieldByName('tramite').AsBoolean) and ( (dm.TCO.FieldByName('estatus').AsBoolean))  then
      begin
          Label9.Caption:='Proceso - ';
      end;
   if ((not dm.TCO.FieldByName('tramite').AsBoolean) and (not dm.TCO.FieldByName('estatus').AsBoolean))  then
      begin
          Label9.Caption:='Iniciado';
          GroupBox6.Color:= ClGreen;
      end;
   if ( dm.TCO.FieldByName('tramite').AsBoolean) and
      ( ( dm.TCO.FieldByName('estatus').AsBoolean) and
      ( dm.TCO.FieldByName('archivo').AsBoolean))  then
      begin
          Label9.Caption:='Archivado';
          GroupBox6.Color:= ClGray;
      end;
end;
procedure Tfscoalta.ncorClick(Sender: TObject);
begin
   if dm.MyConnection1.Connected then
        begin
          if editar = true then
             ShowMessage('No es posible modificar los datos, ya que el registro esta en modo de solo visualizacion. Si desea realizar otra accion, por favor, presione primero el boton "Editar" o "Insertar". ');
        end;

end;

procedure Tfscoalta.ncorEnter(Sender: TObject);         begin         lockmsg;            end;
procedure Tfscoalta.nhojEnter(Sender: TObject);         begin         lockmsg;            end;
procedure Tfscoalta.nofiEnter(Sender: TObject);         begin         lockmsg;            end;
procedure Tfscoalta.rem_cargoEnter(Sender: TObject);    begin         lockmsg;            end;
procedure Tfscoalta.rem_deporgEnter(Sender: TObject);   begin         lockmsg;            end;
procedure Tfscoalta.rem_nombreEnter(Sender: TObject);   begin         lockmsg;            end;
procedure Tfscoalta.seguimientoEnter(Sender: TObject);  begin         lockmsg;            end;


procedure Tfscoalta.Timer2Timer(Sender: TObject);        begin          val.Checked := editar;   end;
procedure Tfscoalta.tramiteEnter(Sender: TObject);       begin       lockmsg;                    end;
procedure Tfscoalta.tur_cargoEnter(Sender: TObject);     begin       lockmsg;                    end;
procedure Tfscoalta.tur_deporgEnter(Sender: TObject);    begin      lockmsg;                     end;
procedure Tfscoalta.tur_nomEnter(Sender: TObject);       begin        lockmsg;                   end;

procedure Tfscoalta.BitBtn1MouseLeave(Sender: TObject);
begin          fmain.RemoveHint(mango);      end;
procedure Tfscoalta.BitBtn1MouseEnter(Sender: TObject);
begin         mango:= fmain.RevealHint(BitBtn1);      end;

procedure Tfscoalta.BitBtn2Click(Sender: TObject);//++++++++++++++++++++++++++++
begin           close;        end;
procedure Tfscoalta.BitBtn2MouseEnter(Sender: TObject);
begin            mango:= fmain.RevealHint(BitBtn2);         end;
procedure Tfscoalta.Button4Click(Sender: TObject);
var
   f: Tfsco_age_aux;
begin
   f:= Tfsco_age_aux.Create(Application);
   try
     f.ShowModal;
   finally
     f.Free;
     tur_nom.Text:= fsco_age_aux.age_titulo +' '+fsco_age_aux.age_nombre+' '+fsco_age_aux.age_apaterno+ ' '+fsco_age_aux.age_amaterno;
     tur_cargo.Text := fsco_age_aux.age_cargo;
     tur_deporg.Text := fsco_age_aux.age_deporg;
   end;
end;


procedure Tfscoalta.Button4Enter(Sender: TObject);
begin           lockmsg;         end;

procedure Tfscoalta.Button4MouseEnter(Sender: TObject);
begin            mango:= fmain.RevealHint(Button4);         end;
//------------------------------------------------------------------------------
procedure Tfscoalta.Button5MouseEnter(Sender: TObject);
begin            mango:= fmain.RevealHint(Button5);         end;
procedure Tfscoalta.ccorEnter(Sender: TObject);
begin           lockmsg;      
end;

//------------------------------------------------------------------------------
procedure Tfscoalta.BitBtn3MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn3);
end;

procedure Tfscoalta.desEnter(Sender: TObject);
begin
    lockmsg;
end;

procedure Tfscoalta.fcapEnter(Sender: TObject);
begin
    lockmsg;
end;

procedure Tfscoalta.fofiEnter(Sender: TObject);
begin
    lockmsg;
end;
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
procedure Tfscoalta.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[2].Text := fmain.PutDate;
 StatusBar1.Panels[3].Text := fmain.PutTime;
end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
{                     BARRA DE HERRAMIENTAS                                    }
{------------------------------------------------------------------------------}

procedure Tfscoalta.BitBtn1Click(Sender: TObject);
var
  f: tF_aux_imp;
  RutaSql: string;
begin
  if dm.MyConnection1.Connected then
  begin
    try
      RutaSql := ValidarYObtenerRutaArchivo(myway + 'coh1.sql');
      dm.QImpresion.Close;
      dm.QImpresion.SQL.Clear;
      dm.QImpresion.SQL.LoadFromFile(RutaSql);
      dm.QImpresion.SQL.Add('AND id = ' + IntToStr(dm.TCO.FieldByName('id').AsInteger));
      dm.QImpresion.Open;

      f := tF_aux_imp.Create(Application);
      try
        f.ShowModal;
      finally
        f.Free;
      end;
      dm.QImpresion.Close;
      dm.QImpresion.SQL.Clear;
      dm.QImpresion.SQL.LoadFromFile(RutaSql);
      dm.QImpresion.Open;
      dm.TCO.Edit;
      dm.TCO.FieldByName('estatus').AsBoolean := True;
      dm.TCO.Post;
      dm.TCO.RefreshRecord;
      myhead;
    except
      on E: Exception do
      begin
        if dm.TCO.State in [dsEdit, dsInsert] then
          dm.TCO.Cancel;
      end;
    end;
  end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure Tfscoalta.BitBtn3Click(Sender: TObject);
var
  SqlPath: string;
  IdSeleccionado: Integer;
begin
  if not dm.MyConnection1.Connected then
  begin
    ShowMessage('No hay conexión con la base de datos.');
    Exit;
  end;

  try
    SqlPath := ValidarYObtenerRutaArchivo(myway + 'co.sql');
    dm.QCO.Close;
    dm.QCO.SQL.Clear;
    dm.QCO.SQL.LoadFromFile(SqlPath);
    dm.QCO.Open;
  except
    on E: Exception do
    begin
      ShowMessage('No se pudo abrir la consulta:' + sLineBreak + E.Message);
      Exit;
    end;
  end;

  Frg.Forma := 'Alta';
  Frg.ShowModal;

  IdSeleccionado := Frg.clave;

  if dm.TCO.Active then
  begin
    dm.TCO.Refresh;
    if IdSeleccionado <> 0 then
      dm.TCO.Locate('id', IdSeleccionado, []);
  end;

  Edit1.Text := IntToStr(IdSeleccionado);
  myhead;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

procedure Tfscoalta.Button5Click(Sender: TObject);
var
   f: Tfsco_age_aux;
begin
   f:= Tfsco_age_aux.Create(Application);
   try
     f.ShowModal;
   finally
     f.Free;
     rem_nombre.Text:= fsco_age_aux.age_titulo +' '+fsco_age_aux.age_nombre+' '+fsco_age_aux.age_apaterno+ ' '+fsco_age_aux.age_amaterno;
     rem_cargo.Text := fsco_age_aux.age_cargo;
     rem_deporg.Text := fsco_age_aux.age_deporg;
     dir := fsco_age_aux.age_dir;
   end;
end;


procedure Tfscoalta.Button5Enter(Sender: TObject);
begin
    lockmsg;
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Tfscoalta.DBAdvGlowNavigator1BtnCancel(Sender: TObject);
begin
    if dm.MyConnection1.Connected then
     begin
       label10.Caption := '';
       editar := true;
       val.Checked := editar;
       lock(editar);
       ShowMessage('Ha decidido no realizar cambios en el registro, por lo tanto, los ajustes se han revertido. Si desea modificar o agregar un nuevo registro, presione "Editar" o "Insertar", segun sus necesidades. ');
       dm.TCO.Cancel
     end;
end;

procedure Tfscoalta.DBAdvGlowNavigator1BtnEdit(Sender: TObject);
begin
     if dm.MyConnection1.Connected then
     begin
       if editar = true then
       begin
          editar := not editar;
          lock(editar);

          Edit1.Text := dm.TCO.FieldByName('id').AsString;
          dm.tco.LocateEx('ID',strtoint(Edit1.Text),[] );
          accion := 'e'
       end  else
       begin
          ShowMessage('Ah ocurrido un error se le recomienda cerrar la aplicacion y volver a intentarlo. ');
       end;
       dm.TCO.Edit;

     end;

end;

procedure Tfscoalta.DBAdvGlowNavigator1BtnFirst(Sender: TObject);
begin
   if mas then
       dm.TCO.First
       else
       ShowMessage('Esta Opcion esta deshabilitada por el momento, agregue o canceleo.....');
end;
//------------------------------------------------------------------------------
procedure Tfscoalta.DBAdvGlowNavigator1BtnInsert(Sender: TObject);
begin
//     myhead;
     BitBtn1.Enabled:= false;    //first
     BitBtn2.Enabled:= false;    //first
     BitBtn3.Enabled:= false;    //first                                        fscoalta.AdvDBDateTimePicker1.Date := StrToDate(fmain.PutDate);
     mas := false;
       if editar = true then
       begin
          editar := not editar;
          lock(editar);
       end  else
       begin
          ShowMessage('Ah ocurrido un error se le recomienda cerrar la aplicacion y volver a intentarlo. ');
       end;
     dm.TCO.Insert;
     accion := 'a';
     lock(false);
     Label9.Caption := '';
     Label11.Visible := false;
     Label10.Caption := 'INSERTANDO REGISTROS';
     GroupBox6.Color:= ClBlack;
     fcap.Date :=StrToDate(fmain.PutDate);
     frec.Date :=StrToDate(fmain.PutDate);
     fofi.Date :=StrToDate(fmain.PutDate);
     if dm.MyConnection1.Connected then
     begin
        dm.tco.FieldByName('tramite').AsBoolean := false;
        dm.tco.FieldByName('fiat').AsDateTime  :=   StrToDate(fmain.PutDate);
        dm.tco.FieldByName('Q_tra').AsString  :=dm.MyConnection1.Username;
        dm.TCO.FieldByName('estatus').AsBoolean := tramite.Checked;
        dm.TCO.FieldByName('fcat').AsDateTime :=  StrToDate(fmain.PutDate);
        dm.tco.FieldByName('Q_est').AsString := dm.MyConnection1.Username;
        dm.TCO.FieldByName('archivo').AsBoolean := false;
        dm.TCO.FieldByName('faat').AsDateTime :=  StrToDate(fmain.PutDate);
        dm.tco.FieldByName('Q_arc').AsString := dm.MyConnection1.Username;
     end;
end;
//------------------------------------------------------------------------------
procedure Tfscoalta.DBAdvGlowNavigator1Click(Sender: TObject;
  Button: TAdvNavigateBtn);
 var
   f: tF_aux_imp;
begin // REPORT
{    TNavigateBtn =
(nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh);}
  if Button = nbFirst then
  begin
   if mas then    myhead;
  end;
  if Button = nbPrior then
  begin
   if mas then      myhead;
  end;

  if Button = nbNext then
  begin
   if mas then      myhead;
  end;

  if Button = nbLast then
  begin
   if mas then       myhead;
  end;
  if Button = nbEdit then
  begin  /// HAY QUE MODIFICAR .........
       mas := false ;
       BitBtn1.Enabled:= false;    //first
       BitBtn2.Enabled:= false;    //first
       BitBtn3.Enabled:= false;    //first                                        fscoalta.AdvDBDateTimePicker1.Date := StrToDate(fmain.PutDate);
  end;

  if Button = nbPost then
  begin
       myhead;
       mas :=true;
       dm.TCO.Refresh;
       Label11.Enabled := true;   // ----
       BitBtn1.Enabled:= true;    //first
       BitBtn2.Enabled:= true;    //first
       BitBtn3.Enabled:= true;    //first fscoalta.AdvDBDateTimePicker1.Date := StrToDate(fmain.PutDate);
        if dm.MyConnection1.Connected then
           begin
{               dm.QCO.Close;
               dm.QCO.SQL.Clear;
               dm.QCO.SQL.LoadFromFile(fmain.ruta+ myway +'coh1.sql');
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('id = '+ IntToStr(dm.TCO.FieldByName('id').AsInteger) +'');
               dm.QCO.Open;
               f:= tF_aux_imp.Create(Application);
               try
                   f.ShowModal;
               finally
                   F.free;
               end;
               dm.QCO.Close;
               dm.QCO.SQL.Clear;
               dm.QCO.SQL.LoadFromFile(fmain.ruta+ myway +'coh1.sql');
               dm.QCO.Open;}
               dm.TCO.RefreshRecord;
               myhead;
           end;// fin de la validacion
  end;
  if Button = nbCancel then
  begin  /// HAY QUE MODIFICAR .........
       myhead;
       mas :=true;
       Label11.Enabled := true;
       BitBtn1.Enabled:= true;    //first
       BitBtn2.Enabled:= true;    //first
       BitBtn3.Enabled:= true;    //first                                        fscoalta.AdvDBDateTimePicker1.Date := StrToDate(fmain.PutDate);
  end;
end;

//------------------------------------------------------------------------------
procedure Tfscoalta.tcorChange(Sender: TObject);
begin
  if FPreparando or (csLoading in ComponentState) then
    Exit;
  if dm.MyConnection1.Connected then
      begin
          ntcor   :=  tcor.ItemIndex+1;

          dm.ccor.Close;
          dm.ccor.SQL.Clear;
          dm.ccor.SQL.Add('select * from ccor');
          dm.ccor.SQL.Add('where tcor = ' +  QuotedStr( inttostr( ntcor) )+'' );  // Aqui agrego un espacio antes del valor
          dm.ccor.Open;

         ccor.Items.Clear;
         dm.ccor.First;
         dm.ccor.First;
         repeat
             ccor.Items.Add(dm.ccor.FieldByName('ccor').AsString );
             dm.ccor.Next;
         until dm.ccor.Eof;
      end;
end;
procedure Tfscoalta.tcorClick(Sender: TObject);
begin
   if dm.MyConnection1.Connected then
        begin
          if editar = true then
             ShowMessage('No es posible modificar los datos, ya que el registro esta en modo de solo visualizacion. Si desea realizar otra accion, por favor, presione primero el boton "Editar" o "Insertar". ');
        end;

end;

procedure Tfscoalta.tcorEnter(Sender: TObject);
begin
   lockmsg;
end;

//------------------------------------------------------------------------------
procedure Tfscoalta.FormCreate(Sender: TObject);
begin
  myway := 'sql\main\';
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  BitBtn1.Hint := 'Impresion de reporte';
  BitBtn2.Hint := 'Salir de la ventana';
  BitBtn3.Hint := 'Busqueda de registros';
  Button5.Hint := 'Buscar al remitente del oficio...';
  Button4.Hint := 'Buscar la persona a turnar...';
end;

procedure Tfscoalta.PrepararApertura;
var
  RutaImagen: string;
  Inicio: UInt64;

  procedure RegistrarTiempo(const Etapa: string);
  begin
    OutputDebugString(PChar('SCOAlta - ' + Etapa + ': ' +
      IntToStr(Int64(GetTickCount64 - Inicio)) + ' ms acumulados'));
  end;

  procedure CargarCombo(Datos: TDataSet; const Campo: string; Lista: TStrings);
  var
    Valores: TStringList;
    CampoDatos: TField;
  begin
    if not Datos.Active then
      Datos.Open;
    Valores := TStringList.Create;
    try
      Datos.DisableControls;
      try
        CampoDatos := Datos.FieldByName(Campo);
        Datos.First;
        while not Datos.Eof do
        begin
          Valores.Add(CampoDatos.AsString);
          Datos.Next;
        end;
      finally
        Datos.EnableControls;
      end;
      Lista.BeginUpdate;
      try
        Lista.Assign(Valores);
      finally
        Lista.EndUpdate;
      end;
    finally
      Valores.Free;
    end;
  end;

begin
  Inicio := GetTickCount64;
  FPreparando := True;
  try
    I_E := True;
    mas := True;
    ins := False;
    edi := False;
    registro := 0;
    accion := #0;
    editar := True;
    BitBtn1.Enabled := True;
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := True;
    Label11.Enabled := True;
    Label11.Visible := True;
    val.Checked := editar;

    if not dm.TCO.Active then
      dm.TCO.Open;
    dm.TCO.DisableControls;
    try
      dm.TCO.First;
      myhead;
      RegistrarTiempo('primer oficio');

      // Renovar los catalogos desde los datasets abiertos, sin duplicar items.
      CargarCombo(dm.ncor, 'ncor', ncor.Items);
      CargarCombo(dm.tcor, 'tcor', tcor.Items);
      CargarCombo(dm.ccor, 'ccor', ccor.Items);
      RegistrarTiempo('catalogos');

      RutaImagen := IncludeTrailingPathDelimiter(fmain.ruta) +
        fmain.mmedia + 'legislatura.png';
      if FImagenCargada <> RutaImagen then
      begin
        try
          JvImage1.Picture.LoadFromFile(RutaImagen);
          FImagenCargada := RutaImagen;
        except
          // El logotipo es opcional; reintentar en la proxima apertura.
          JvImage1.Picture.Assign(nil);
          FImagenCargada := '';
        end;
      end;
      RegistrarTiempo('imagen');
      lock(editar);
      Edit1.Text := IncludeTrailingPathDelimiter(fmain.ruta) + myway + 'co.sql';
    finally
      // Restaurar el texto de los controles enlazados tras renovar sus listas.
      dm.TCO.EnableControls;
    end;
  finally
    FPreparando := False;
  end;
end;

procedure Tfscoalta.frecEnter(Sender: TObject);
begin
    lockmsg;
end;

//------------------------------------------------------------------------------
procedure Tfscoalta.DBAdvGlowNavigator1BtnLast(Sender: TObject);
begin
   if mas then
       dm.TCO.Last
       else
       ShowMessage('Esta Opcion esta deshabilitada por el momento, agregue o cancelar.....');
end;
//------------------------------------------------------------------------------

procedure Tfscoalta.DBAdvGlowNavigator1BtnNext(Sender: TObject);
begin
   if mas then
       dm.TCO.Next
       else
       ShowMessage('Esta Opcion esta deshabilitada por el momento, agregue o cancele.....');
end;
//------------------------------------------------------------------------------
procedure Tfscoalta.DBAdvGlowNavigator1BtnPost(Sender: TObject);
begin
     if dm.MyConnection1.Connected then
     begin
       label10.Caption := '';
       if editar = false then
       begin
          editar := not editar;
           lock(editar);
           ShowMessage('Los cambios en el registro han sido grabados realizados.');
           dm.TCO.FieldByName('fcap').AsDateTime := fcap.Date;
           dm.TCO.FieldByName('frec').AsDateTime := frec.Date;
           dm.TCO.FieldByName('ncor').AsString := ncor.Text;
           dm.TCO.FieldByName('tcor').AsString := tcor.Text;
           dm.TCO.FieldByName('ccor').AsString := ccor.Text;
           dm.TCO.FieldByName('nofi').AsString := nofi.Text;
           dm.TCO.FieldByName('fofi').AsDateTime := fofi.Date;
           if nhoj.Text = '' then
              nhoj.Text := '1'
              else
              try
                 dm.TCO.FieldByName('nhoj').AsInteger := StrToInt(nhoj.Text);
              except
               on E: Exception do
                  begin
                    ShowMessage('Error: ' + E.ClassName + ' ' + E.Message);
                  end;
              end;

           dm.TCO.FieldByName('modifico').AsString := FMAIN.usuario;
           dm.TCO.FieldByName('seguimiento').AsString := seguimiento.Text;
           dm.TCO.FieldByName('des').AsString := des.Text;
           dm.TCO.FieldByName('rem_nombre').AsString := rem_nombre.Text;
           dm.TCO.FieldByName('rem_cargo').AsString := rem_cargo.Text;
           dm.TCO.FieldByName('rem_deporg').AsString := rem_deporg.Text;
           dm.TCO.FieldByName('tur_nom').AsString := tur_nom.Text;
           dm.TCO.FieldByName('tur_cargo').AsString := tur_cargo.Text;
           dm.TCO.FieldByName('tur_deporg').AsString := tur_deporg.Text;
          dm.TCO.Post;
          if accion = 'e'  then
             dm.tco.LocateEx('ID',strtoint(Edit1.Text),[] )
          else
          begin
            dm.TCO.Refresh;
            Label11.Visible := true;
            Label11.Caption := IntToStr (dm.TCO.FieldByName('id').AsInteger);
            Application.ProcessMessages;
            dm.TCO.Last;
            Application.ProcessMessages;
          end;


       end  else
       begin
          ShowMessage('Ah ocurrido un error se le recomienda cerrar la aplicacion y volver a intentarlo. ');
       end;
     end;
end;
//------------------------------------------------------------------------------
procedure Tfscoalta.DBAdvGlowNavigator1BtnPrior(Sender: TObject);
begin
   if mas then
       dm.TCO.Prior
       else
       ShowMessage('Esta Opcion esta deshabilitada por el momento, agregue o cancele.....');
  end;
end.
