unit scoalta;
//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
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
  ppComm, ppRelatv, ppDBPipe, JvBaseDlg, JvSelectDirectory;
type
  Tfscoalta = class(TForm)
    GroupBox6: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button5: TButton;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Button4: TButton;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label16: TLabel;
    GroupBox5: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    JvImage1: TJvImage;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn9: TBitBtn;
    DBAdvGlowNavigator1: TDBAdvGlowNavigator;
    AdvDBDateTimePicker1: TAdvDBDateTimePicker;
    AdvDBDateTimePicker2: TAdvDBDateTimePicker;
    AdvDBDateTimePicker3: TAdvDBDateTimePicker;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    xxx: TButton;
    Edit1: TEdit;
    JvSelectDirectory1: TJvSelectDirectory;
    Label11: TLabel;
    DBText1: TDBText;
    Procedure valboton(xxx:string);

    procedure myhead;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBAdvGlowNavigator1Click(Sender: TObject;
      Button: TAdvNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn3MouseEnter(Sender: TObject);
    procedure BitBtn6MouseEnter(Sender: TObject);
    procedure Button4MouseEnter(Sender: TObject);
    procedure Button5MouseEnter(Sender: TObject);
    procedure DBComboBox2Change(Sender: TObject);
    procedure BitBtn1MouseEnter(Sender: TObject);
    procedure BitBtn2MouseEnter(Sender: TObject);
    procedure BitBtn1MouseLeave(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnInsert(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnFirst(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnLast(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnNext(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnPrior(Sender: TObject);
    procedure xxxClick(Sender: TObject);
  private
    { Private declarations }
      mango:THintWindow;
  public
    dir: string;
    t, e, ins, edi, I_E  :bool;
    td, ed :Tdate;
    tu, eu :string;
    registro:integer;
    mas: bool;
    { Public declarations }
  end;

var
  fscoalta: Tfscoalta;

implementation

uses login, main, d_m, sco_age_aux, sco_aux_impresion, RG;

{$R *.dfm}

{-------------------------------------------------------------------------------}
Procedure Tfscoalta.valboton(xxx:string);
begin;
Application.ProcessMessages;
if dm.TCO.eof then //primer registro
begin
   BitBtn4.Enabled:= true;    //first
   BitBtn5.Enabled:= true;    //prior
   BitBtn6.Enabled:= false;    //next
   BitBtn7.Enabled:= false;    //last
   BitBtn8.Enabled:= true;    //insert
   BitBtn9.Enabled:= true;    //Edit
   BitBtn10.Enabled:= true;    //Delete
   BitBtn11.Enabled:= false;    //Post
   BitBtn12.Enabled:= false;    //Cancel
   BitBtn13.Enabled:= true;   //refresh
   myhead
end;
if dm.TCO.Bof then// fin de la tabla ultimo regristro
begin
   BitBtn4.Enabled:= false;    //first
   BitBtn5.Enabled:= false;    //prior
   BitBtn6.Enabled:= true;    //next
   BitBtn7.Enabled:= true;    //last
   BitBtn8.Enabled:= true;    //insert
   BitBtn9.Enabled:= true;    //Edit
   BitBtn10.Enabled:= true;    //Delete
   BitBtn11.Enabled:= false;    //Post
   BitBtn12.Enabled:= false;    //Cancel
   BitBtn13.Enabled:= true;   //refresh
   myhead
end;
if (( Not dm.TCO.Bof )and (Not dm.TCO.Eof)) then // entre registros
begin
   BitBtn4.Enabled:= true;    //first
   BitBtn5.Enabled:= true;    //prior
   BitBtn6.Enabled:= true;    //next
   BitBtn7.Enabled:= true;    //last
   BitBtn8.Enabled:= true;    //insert
   BitBtn9.Enabled:= true;    //Edit
   BitBtn10.Enabled:= true;    //Delete
   BitBtn11.Enabled:= false;    //Post
   BitBtn12.Enabled:= false;    //Cancel
   BitBtn13.Enabled:= true;   //refresh
   myhead;
end;
if ( xxx = 'ins'  ) then // insert
begin
   BitBtn1.Enabled:= false;    //first
   BitBtn2.Enabled:= false;    //first
   BitBtn3.Enabled:= false;    //first
   BitBtn4.Enabled:= false;    //first
   BitBtn5.Enabled:= false;    //prior
   BitBtn6.Enabled:= false;    //next
   BitBtn7.Enabled:= false;    //last
   BitBtn8.Enabled:= false;    //insert
   BitBtn9.Enabled:= false;    //Edit
   BitBtn10.Enabled:= false;    //Delete
   BitBtn11.Enabled:= true;    //Post
   BitBtn12.Enabled:= true;    //Cancel
   BitBtn13.Enabled:= false;   //refresh
end;
if ( xxx = 'edi'  ) then // insert
begin
   BitBtn1.Enabled:= false;    //first
   BitBtn2.Enabled:= false;    //first
   BitBtn3.Enabled:= false;    //first
   BitBtn4.Enabled:= false;    //first
   BitBtn5.Enabled:= false;    //prior
   BitBtn6.Enabled:= false;    //next
   BitBtn7.Enabled:= false;    //last
   BitBtn8.Enabled:= false;    //insert
   BitBtn9.Enabled:= false;    //Edit
   BitBtn10.Enabled:= false;    //Delete
   BitBtn11.Enabled:= true;    //Post
   BitBtn12.Enabled:= true;    //Cancel
   BitBtn13.Enabled:= false;   //refresh
end;
if ( xxx = 'pos'  ) then // insert
begin
   BitBtn1.Enabled:= true;    //first
   BitBtn2.Enabled:= true;    //first
   BitBtn3.Enabled:= true;    //first
   BitBtn4.Enabled:= true;    //first
   BitBtn5.Enabled:= true;    //prior
   BitBtn6.Enabled:= true;    //next
   BitBtn7.Enabled:= true;    //last
   BitBtn8.Enabled:= true;    //insert
   BitBtn9.Enabled:= true;    //Edit
   BitBtn10.Enabled:= true;    //Delete
   BitBtn11.Enabled:= false;    //Post
   BitBtn12.Enabled:= false;    //Cancel
   BitBtn13.Enabled:= true;   //refresh
end;
if ( xxx = 'can'  ) then // insert
  begin
     BitBtn1.Enabled:= true;    //first
     BitBtn2.Enabled:= true;    //first
     BitBtn3.Enabled:= true;    //first
     BitBtn4.Enabled:= true;    //first
     BitBtn5.Enabled:= true;    //prior
     BitBtn6.Enabled:= true;    //next
     BitBtn7.Enabled:= true;    //last
     BitBtn8.Enabled:= true;    //insert
     BitBtn9.Enabled:= true;    //Edit
     BitBtn10.Enabled:= true;    //Delete
     BitBtn11.Enabled:= false;    //Post
     BitBtn12.Enabled:= false;    //Cancel
     BitBtn13.Enabled:= true;   //refresh
  end;
  if dm.MyConnection1.Connected then
     begin
       Label11.Caption := IntToStr (dm.TCO.FieldByName('id').AsInteger);
     end;
end;


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

    end;
{
LOCK TABLES `age` READ;

FLUSH TABLES;

BACKUP TABLE `age` TO 'C:/';

UNLOCK TABLES;
}

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
          Label10.Caption := 'Folio: ';
          Label9.Caption := 'En Trámite';
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
   if (not dm.TCO.FieldByName('tramite').AsBoolean) and ( (not dm.TCO.FieldByName('estatus').AsBoolean))  then
      begin
          Label9.Caption:='Iniciado';
          GroupBox6.Color:= ClGreen;
      end;
   if ( dm.TCO.FieldByName('tramite').AsBoolean) and ( ( dm.TCO.FieldByName('estatus').AsBoolean) and ( dm.TCO.FieldByName('archivo').AsBoolean)  )  then
      begin
          Label9.Caption:='Archivado';
          GroupBox6.Color:= ClGray;
      end;
end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
{                     BARRA DE HERRAMIENTAS                                    }
{------------------------------------------------------------------------------}
procedure Tfscoalta.BitBtn4Click(Sender: TObject);//++++++++++++++++++++++++++++
begin
  dm.TCO.First;
  valboton('');
end;
procedure Tfscoalta.BitBtn5Click(Sender: TObject);//++++++++++++++++++++++++++++
begin
  dm.TCO.Prior;
  valboton('');
end;
procedure Tfscoalta.BitBtn7Click(Sender: TObject);//++++++++++++++++++++++++++++
begin
   dm.TCO.Last;
   valboton('');
end;

procedure Tfscoalta.BitBtn8Click(Sender: TObject);//++++++++++++++++++++++++++++
begin
   label10.Caption:='';
   label9.Caption:='';
   ins:=true;
   valboton('ins');
   Label11.Visible:=false;
   registro := dm.TCO.RecNo;

end;
procedure Tfscoalta.BitBtn9Click(Sender: TObject);//++++++++++++++++++++++++++++
begin // EDIT
   edi:= true;
   valboton('edi');
   registro := dm.TCO.RecNo;
end;
procedure Tfscoalta.BitBtn10Click(Sender: TObject);//+++++++++++++++++++++++++++
VAR button : integer;
begin
  button := application.messagebox ('¿Realmente desea borrar el registro?', '¿Seguro?', MB_yesno + mb_iconwarning); // MOstramos un mensaje advirtiendo...
   if button = IDYes then begin
    DM.TCO.Delete;
   end;
end;
procedure Tfscoalta.BitBtn11Click(Sender: TObject);//+++++++++++++++++++++++++++
begin// POST
    valboton('pos');
   Label11.Visible:=true;

   if ins then
   begin

     dm.TCO.Refresh;
     dm.TCO.Last;

     myhead;
   end;
   if edi then
   begin

     dm.TCO.RecNo := registro;

     myhead;
   end;

end;
procedure Tfscoalta.BitBtn12Click(Sender: TObject);//+++++++++++++++++++++++++++
begin// CANCEL
     valboton('can');
     Label11.Visible:=true;
     dm.TCO.RecNo := registro;
end;
procedure Tfscoalta.BitBtn13Click(Sender: TObject);//+++++++++++++++++++++++++++
begin// REFRESH
   dm.TCO.Refresh;
end;

procedure Tfscoalta.BitBtn1Click(Sender: TObject); //++++++++++++++++++++++++++++
 var
   f: tF_aux_imp;
begin // REPORT
if dm.MyConnection1.Connected then
   begin
       dm.QImpresion.Close;
       dm.QImpresion.SQL.Clear;
       dm.QImpresion.SQL.LoadFromFile(fmain.ruta+'coh1.sql');
       dm.QImpresion.SQL.Add('AND');
       dm.QImpresion.SQL.Add('id = '+ IntToStr(dm.TCO.FieldByName('id').AsInteger) +'');
       dm.QImpresion.Open;
       f:= tF_aux_imp.Create(Application);
       try
           f.ShowModal;
       finally
           F.free;
       end;
       dm.QImpresion.Close;
       dm.QImpresion.SQL.Clear;
       dm.QImpresion.SQL.LoadFromFile(fmain.ruta+'coh1.sql');
       dm.QImpresion.Open;
       dm.TCO.RefreshRecord;
       myhead;
   end;// fin de la validacion
end;
procedure Tfscoalta.BitBtn1MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn1);
end;

procedure Tfscoalta.BitBtn1MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure Tfscoalta.BitBtn3Click(Sender: TObject);//++++++++++++++++++++++++++++
var f: tfrg;
    id:integer;
    reg:integer;
begin // CONSULTA
   id:=0;
   reg:=0;
if dm.MyConnection1.Connected then
   begin
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
       dm.QCO.Open;
   end;
   f:= tfrg.Create(application);
   try
     f.ShowModal
   finally
      f.Free;
      id := frg.clave;
      dm.TCO.First;
{      repeat
         if id = dm.TCO.FieldByName('id').AsInteger then
            begin
                reg:= dm.TCO.RecNo;
                dm.TCO.Last;
            end;
        dm.TCO.Next;
      until dm.TCO.Eof ;}
      dm.TCO.RecNo := id;
      myhead;
   end;
end;
procedure Tfscoalta.BitBtn2Click(Sender: TObject);//++++++++++++++++++++++++++++
begin // SALIR
    close;
end;
procedure Tfscoalta.BitBtn2MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn2);
end;

{------------------------------------------------------------------------------}

procedure Tfscoalta.Button1Click(Sender: TObject);
var
   f: Tfsco_age_aux;
begin
   f:= Tfsco_age_aux.Create(Application);
   try
     f.ShowModal;
   finally
     f.Free;
     dir := fsco_age_aux.age_dir;
   end;
end;

procedure Tfscoalta.Button4Click(Sender: TObject);
var
   f: Tfsco_age_aux;
begin
   f:= Tfsco_age_aux.Create(Application);
   try
     f.ShowModal;
   finally
     f.Free;
     dbEdit6.Text:= fsco_age_aux.age_titulo +' '+fsco_age_aux.age_nombre+' '+fsco_age_aux.age_apaterno+ ' '+fsco_age_aux.age_amaterno;
     dbEdit7.Text := fsco_age_aux.age_cargo;
     dbEdit8.Text := fsco_age_aux.age_deporg;
   end;

end;


procedure Tfscoalta.Button5Click(Sender: TObject);
var
   f: Tfsco_age_aux;
begin
   f:= Tfsco_age_aux.Create(Application);
   try
     f.ShowModal;
   finally
     f.Free;
     dbEdit3.Text:= fsco_age_aux.age_titulo +' '+fsco_age_aux.age_nombre+' '+fsco_age_aux.age_apaterno+ ' '+fsco_age_aux.age_amaterno;
     dbEdit4.Text := fsco_age_aux.age_cargo;
     dbEdit5.Text := fsco_age_aux.age_deporg;
     dir := fsco_age_aux.age_dir;
   end;
end;


procedure Tfscoalta.BitBtn6MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn6);
end;


procedure Tfscoalta.Button4MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Button4);
end;

procedure Tfscoalta.Button5MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Button5);
end;

procedure Tfscoalta.BitBtn3MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn3);
end;

procedure Tfscoalta.DBAdvGlowNavigator1BtnFirst(Sender: TObject);
begin
   if mas then
       dm.TCO.First
       else
       ShowMessage('Esta Opción esta deshabilitada por el momento, agregue o cancele….....');
end;

procedure Tfscoalta.DBAdvGlowNavigator1BtnInsert(Sender: TObject);
begin
//     myhead;
     BitBtn1.Enabled:= false;    //first
     BitBtn2.Enabled:= false;    //first
     BitBtn3.Enabled:= false;    //first                                        fscoalta.AdvDBDateTimePicker1.Date := StrToDate(fmain.PutDate);
     mas := false;
     dm.TCO.Insert;
     Label9.Caption := '';
     Label11.Enabled:=false;
     Label10.Caption := 'INSERTANDO REGISTRO…';
     GroupBox6.Color:= ClBlack;
     AdvDBDateTimePicker2.Date := StrToDate(fmain.PutDate);
     AdvDBDateTimePicker3.Date := StrToDate(fmain.PutDate);
     AdvDBDateTimePicker1.Date := StrToDate(fmain.PutDate);
     if dm.MyConnection1.Connected then
     begin
        dm.tco.FieldByName('tramite').AsBoolean := false;
        dm.tco.FieldByName('fiat').AsDateTime  :=   StrToDate(fmain.PutDate);
        dm.tco.FieldByName('Q_tra').AsString  :=dm.MyConnection1.Username;
        dm.TCO.FieldByName('estatus').AsBoolean := dbCheckBox1.Checked;
        dm.TCO.FieldByName('fcat').AsDateTime :=  StrToDate(fmain.PutDate);
        dm.tco.FieldByName('Q_est').AsString := dm.MyConnection1.Username;
        dm.TCO.FieldByName('archivo').AsBoolean := false;
        dm.TCO.FieldByName('faat').AsDateTime :=  StrToDate(fmain.PutDate);
        dm.tco.FieldByName('Q_arc').AsString := dm.MyConnection1.Username;
     end;
end;

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
               dm.QCO.SQL.LoadFromFile(fmain.ruta+'coh1.sql');
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
               dm.QCO.SQL.LoadFromFile(fmain.ruta+'coh1.sql');
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

procedure Tfscoalta.DBComboBox2Change(Sender: TObject);
begin
  if DBComboBox2.ItemIndex = 0 then
     begin
      DBComboBox3.Text:='';
      DBComboBox3.Items.Clear;
      DBComboBox3.Items.Add('Invitaciones');
      DBComboBox3.Items.Add('Felicitaciones');
      DBComboBox3.Items.Add('Agradecimientos');
      DBComboBox3.Items.Add('Informes');
      DBComboBox3.Items.Add('Libros, revistas, folletos, etc.');
      DBComboBox3.Items.Add('Nomina');
      DBComboBox3.Items.Add('Estados de Cuenta');
     end;

  if DBComboBox2.ItemIndex = 1 then
     begin
      DBComboBox3.Text:='';
      DBComboBox3.Items.Clear;
      DBComboBox3.Items.Add('Exhortos');
      DBComboBox3.Items.Add('Juicios de amparos');
      DBComboBox3.Items.Add('Iniciativas Ley o Reglamentos');
      DBComboBox3.Items.Add('Reformas de Ley o Reglamentos');
      DBComboBox3.Items.Add('Otros');
      DBComboBox3.Items.Add('Circulares');
      DBComboBox3.Items.Add('Proyectos de Decreto');
      DBComboBox3.Items.Add('Puntos de acuerdo');
     end;
  if DBComboBox2.ItemIndex = 2 then
     begin
      DBComboBox3.Text:='';
      DBComboBox3.Items.Clear;
      DBComboBox3.Items.Add('Peticiones para gestión');
      DBComboBox3.Items.Add('Solicitudes de información');
     end;
end;

procedure Tfscoalta.FormCreate(Sender: TObject);
begin
   i_e := true;
   mas:=true;
   ins:= false;
   edi:= false;
   registro:=0;
   if dm.MyConnection1.Connected then
   begin
    dm.TCO.First;
    valboton('');
    myhead;
   end;
   JvImage1.Picture.LoadFromFile(fmain.ruta+'LOGO-CONGRESO_1.jpg');
   BitBtn1.Hint:='Impresión de reporte';
   BitBtn2.Hint:='Salir de la ventana';
   BitBtn3.Hint:='Búsqueda de registros';
   BitBtn4.Hint:='Ir al primer registro';
   BitBtn5.Hint:='Ir al registro anterior';
   BitBtn6.Hint:='Ir al próximo registro';
   BitBtn7.Hint:='Ir al último registro';
   BitBtn8.Hint:='Insertar nuevo registro';
   BitBtn9.Hint:='Editar el registro actual';
   BitBtn10.Hint:='Eliminar el registro actual.';
   BitBtn11.Hint:='Aceptar los cambios en el registro';
   BitBtn12.Hint:='Cancelar los cambios del registro';
   BitBtn13.Hint:='Refrescar registros';
   Button5.Hint := 'Buscar al remitente del oficio...';
   Button4.Hint := 'Buscar la persona a turnar...';
end;
procedure Tfscoalta.DBAdvGlowNavigator1BtnLast(Sender: TObject);
begin
   if mas then
       dm.TCO.Last
       else
       ShowMessage('Esta Opción esta deshabilitada por el momento, agregue o cancele….....');
end;

procedure Tfscoalta.DBAdvGlowNavigator1BtnNext(Sender: TObject);
begin
   if mas then
       dm.TCO.Next
       else
       ShowMessage('Esta Opción esta deshabilitada por el momento, agregue o cancele….....');
end;

procedure Tfscoalta.DBAdvGlowNavigator1BtnPrior(Sender: TObject);
begin
   if mas then
       dm.TCO.Prior
       else
       ShowMessage('Esta Opción esta deshabilitada por el momento, agregue o cancele….....');
end;
end.
