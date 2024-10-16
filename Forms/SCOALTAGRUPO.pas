unit SCOALTAGRUPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, JvExExtCtrls, JvImage, StdCtrls, Buttons,
  ComCtrls, DBCtrls, DB, DBAccess, MyAccess;

type
  TFSCOALTAGRUPO = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    DateTimePicker3: TDateTimePicker;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label16: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    GroupBox5: TGroupBox;
    CheckBox1: TCheckBox;
    BitBtn5: TBitBtn;
    JvImage1: TJvImage;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button5: TButton;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    GroupBox4: TGroupBox;
    Button4: TButton;
    DBGrid1: TDBGrid;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Procedure clean;
    FUNCTION VALFIELD:BOOL;
    procedure componentes(all:bool);
    PROCEDURE vALBOTTON(I:INTEGER);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1MouseEnter(Sender: TObject);
    procedure BitBtn1MouseLeave(Sender: TObject);
    procedure BitBtn2MouseEnter(Sender: TObject);
    procedure BitBtn3MouseEnter(Sender: TObject);
    procedure BitBtn4MouseEnter(Sender: TObject);
    procedure BitBtn5MouseEnter(Sender: TObject);
    procedure Button5MouseEnter(Sender: TObject);
    procedure Button4MouseEnter(Sender: TObject);
  private
    { Private declarations }
    mango :THintwindow;
  public
    { Public declarations }
    dir: string;
    t, e, ins, edi, I_E  :bool;
    td, ed :Tdate;
    tu, eu :string;
    registro, NTR : integer;
  end;

var
  FSCOALTAGRUPO: TFSCOALTAGRUPO;

implementation

uses login, main, d_m, sco_age_aux, sco_aux_impresion, RG, sco_ins_gru, sco_imp_gru;

{$R *.dfm}

{-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------}
Procedure TFSCOALTAGRUPO.clean;
begin  // clean
      DateTimePicker1.Date := strtodate(fmain.PutDate);
      DateTimePicker2.Date := strtodate(fmain.PutDate);
      DateTimePicker3.Date := strtodate(fmain.PutDate);
      ComboBox1.Text := 'Nivel de la correspondencia';
      ComboBox2.Text := 'Tipo de la Correspondencia';
      ComboBox3.Text := 'Clasificacion de la Correspondencia';
      Edit1.Text:= '';
      Edit2.Text:= '';
      Edit3.Text:= '';
      Edit4.Text:= '';
      Edit5.Text:= '';
      Memo1.Text :='';
      Memo1.Text :='';
      GroupBox4.Caption :='   Turnado a:   ';
      dm.QAUX.Close;
      CheckBox1.Checked := false;

end;

{-----------------------------------------------------------------------------}
procedure TFSCOALTAGRUPO.componentes(all:bool);
begin
     ComboBox1.Enabled:= all;
     ComboBox2.Enabled:= all;
     ComboBox3.Enabled:= all;
     DateTimePicker1.Enabled:= all;
     DateTimePicker2.Enabled:= all;
     DateTimePicker3.Enabled:= all;
     FSCOALTAGRUPO.DBGrid1.Enabled := all;
     Edit1.Enabled := all;
     Edit2.Enabled := all;
     Edit3.Enabled := all;
     Edit4.Enabled := all;
     Edit5.Enabled := all;
     Memo1.Enabled := all;
     Memo2.Enabled := all;
     CheckBOx1.Enabled :=all;
end;

{-----------------------------------------------------------------------------}
PROCEDURE TFSCOALTAGRUPO.vALBOTTON(I:INTEGER);
BEGIN //
    if I = 0 then
       BEGIN
          BitBtn1.Enabled := TRUE;
          BitBtn2.Enabled := FALSE;
          BitBtn3.Enabled := FALSE;
          BitBtn4.Enabled := FALSE;
          BitBtn5.Enabled := TRUE;
          button4.Enabled := FALSE;
          button5.Enabled := FALSE;
       END;
    if I = 1 then
       BEGIN
          BitBtn1.Enabled := FALSE;
          BitBtn2.Enabled := TRUE;
          BitBtn3.Enabled := TRUE;
          BitBtn4.Enabled := FALSE;
          BitBtn5.Enabled := FALSE;
          button4.Enabled := true;
          button5.Enabled := true;
       END;
    if I = 2 then
       BEGIN
          BitBtn1.Enabled := FALSE;
          BitBtn2.Enabled := FALSE;
          BitBtn3.Enabled := FALSE;
          BitBtn4.Enabled := TRUE;
          BitBtn5.Enabled := TRUE;
          button4.Enabled := FALSE;
          button5.Enabled := FALSE;
       END;
    if I = 3 then
       BEGIN
          BitBtn1.Enabled := TRUE;
          BitBtn2.Enabled := FALSE;
          BitBtn3.Enabled := FALSE;
          BitBtn4.Enabled := FALSE;
          BitBtn5.Enabled := TRUE;
       END;
    if I = 4 then
       BEGIN
          BitBtn1.Enabled := TRUE;
          BitBtn2.Enabled := FALSE;
          BitBtn3.Enabled := FALSE;
          button4.Enabled := FALSE;
          BitBtn5.Enabled := TRUE;
       END;

END;

FUNCTION TFSCOALTAGRUPO.VALFIELD:BOOL;
VAR TEMP:BOOL;
    temp1: array [1..6] of bool;
    i: Integer;
BEGIN //
   TEMP := false;
   for i := 1 to 5 do
      temp1[i] := true;
   if ((ComboBox1.Text <> 'Nivel de la correspondencia')or(ComboBox1.Text = '')) then
        temp1[1] := false;
   if ((ComboBox2.Text <> 'Tipo de la Correspondencia')or(ComboBox2.Text = '')) then
        temp1[2] := false;
   if ((ComboBox3.Text <> 'Clasificacion de la Correspondencia')or(ComboBox3.Text = '')) then
        temp1[3] := false;
   if (Memo1.Text = '') then
        temp1[4] := false;
   if (Edit3.Text = '') then
        temp1[5] := false;
   if NTR  <> 0 then
        temp1[6] := false;

if ( (temp1[1] = false) and (temp1[2] = false) and (temp1[3]= false ) and (temp1[4] = false) and (temp1[5] = false) and (temp1[6] = false)  ) then
    temp:= true;
  Result := TEMP;
END;

procedure TFSCOALTAGRUPO.BitBtn1Click(Sender: TObject);
begin
 valbotton(1);
 BitBtn5.Enabled := true;
 BitBtn4.Enabled := true;

 componentes(true);
end;

procedure TFSCOALTAGRUPO.BitBtn1MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn1);

end;

procedure TFSCOALTAGRUPO.BitBtn1MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);
end;

procedure TFSCOALTAGRUPO.BitBtn2Click(Sender: TObject);
begin //
   valbotton(2);
//  if VALFIELD then
  begin
  if dm.MyConnection1.Connected then
     begin
       dm.QAUX.First;
         repeat
          Edit1.Text := trim (Edit1.Text);
          Edit2.Text := trim (Edit2.Text);
          Edit3.Text := trim (Edit3.Text);
          Edit4.Text := trim (Edit4.Text);
          Edit5.Text := trim (Edit5.Text);
          dm.TCO.ReadOnly := false;
          dm.TCO.Insert;
          dm.tco.FieldByName('fcap').AsDateTime :=  DateTimePicker1.Date;
          dm.tco.FieldByName('frec').AsDateTime :=  DateTimePicker2.Date;
          dm.tco.FieldByName('ncor').AsString :=  ComboBox1.Text;
          dm.tco.FieldByName('tcor').AsString :=  ComboBox2.Text;
          dm.tco.FieldByName('ccor').AsString :=  ComboBox3.Text;
          dm.tco.FieldByName('fofi').AsDateTime :=  DateTimePicker3.Date;
          dm.tco.FieldByName('nofi').AsString :=  Edit1.Text;
          dm.tco.FieldByName('nhoj').AsString :=  Edit2.Text;
          dm.tco.FieldByName('rem_nombre').AsString :=  Edit3.Text;
          dm.tco.FieldByName('rem_cargo').AsString :=  Edit4.Text;
          dm.tco.FieldByName('rem_deporg').AsString :=  Edit5.Text;
          dm.tco.FieldByName('rem_dir').AsString :=  dir;
          dm.tco.FieldByName('des').AsString :=  Memo1.Text;
          dm.tco.FieldByName('seguimiento').AsString :=  Memo2.Text;
          dm.tco.FieldByName('tur_nom').AsString :=  DM.QAUX.FieldByName('NOMBRE').AsString;
          dm.tco.FieldByName('tur_cargo').AsString := DM.QAUX.FieldByName('cargo').AsString;
          dm.tco.FieldByName('tur_deporg').AsString := DM.QAUX.FieldByName('deporg').AsString;
          dm.tco.FieldByName('tramite').AsBoolean := false;
          dm.tco.FieldByName('fiat').AsDateTime  :=   StrToDate(fmain.PutDate);
          dm.tco.FieldByName('Q_tra').AsString  := dm.MyConnection1.Username;
          dm.TCO.FieldByName('estatus').AsBoolean := CheckBox1.Checked;
          dm.TCO.FieldByName('fcat').AsDateTime :=  StrToDate(fmain.PutDate);
          dm.tco.FieldByName('Q_est').AsString := dm.MyConnection1.Username;
          dm.TCO.FieldByName('archivo').AsBoolean := false;
          dm.TCO.FieldByName('faat').AsDateTime :=  StrToDate(fmain.PutDate);
          dm.tco.FieldByName('Q_arc').AsString := dm.MyConnection1.Username;
          dm.tco.Post;
          dm.QAUX.Next;
         until dm.QAUX.Eof ;
         dm.TCO.Refresh;
         dm.QCO.Refresh;
        ShowMEssage('La captura cocluyo exitosamente....');
//     
     end;  //  if dm.MyConnection1.Connected then
  end //    if NTR  <> 0 then
//  else
//  begin
//  ShowMessage('No se puede ejecutar esta opción debido no se han completado la información mínima para poder agregar a la lista de control.');
//     valbotton(0);
//end;
 end;


procedure TFSCOALTAGRUPO.BitBtn2MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn2);
end;

procedure TFSCOALTAGRUPO.BitBtn3Click(Sender: TObject);
begin
   clean;
   valbotton(3);
   componentes(false);

end;

procedure TFSCOALTAGRUPO.BitBtn3MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn3);
end;

procedure TFSCOALTAGRUPO.BitBtn4Click(Sender: TObject);
var NRA:integer;
    f :tfsco_imp_gru;
begin
  valbotton(4);
  if dm.MyConnection1.Connected then
     begin
      dm.TCO.Last;
      nra:= dm.TCO.FieldByName('id').AsInteger;
      if dm.MyConnection1.Connected then
         begin
             dm.QCO.Close;
             dm.QCO.SQL.Clear;
             dm.QCO.SQL.LoadFromFile(fmain.ruta+'coh1.sql');
             dm.QCO.SQL.Add('AND');
             dm.QCO.SQL.Add('id BETWEEN '+ IntTostr(nra-ntr+1) + ' AND ' + IntTostr(nra));
             dm.QCO.SQL.add('ORDER BY  CO.id');
             dm.QCO.Open;
         end; // fin de la validacion
       {-------------------------------------------------------------------------}
        f := tfsco_imp_gru.Create(Application);
       try
         f.ShowModal;
       finally
          f.Free;
       end;
       {---------------------------------------------------------------------}
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'coh1.sql');
       dm.QCO.SQL.add('ORDER BY  CO.id');
       dm.QCO.Open;
       valbotton(1);
     end; // fin del id dm.MyConnection1
  end;

procedure TFSCOALTAGRUPO.BitBtn4MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn4);
end;

procedure TFSCOALTAGRUPO.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFSCOALTAGRUPO.BitBtn5MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn5);
end;

procedure TFSCOALTAGRUPO.Button4Click(Sender: TObject);
VAR clave: integer;
//     i: integer;
    grup: string;
    f:tfsco_ins_gru;
begin
   if DM.MyConnection1.Connected then
       BEGIN
        DM.QCAT_GRU.Close;
        dm.QCAT_GRU.SQL.Clear;
        dm.QCAT_GRU.SQL.LoadFromFile (fmain.ruta+'cat_gru.sql');
        dm.QCAT_GRU.SQL.Add('ORDER BY  cat_gru.id_grupo');
        dm.QCAT_GRU.Open;
        END;
        f:= tfsco_ins_gru.Create(Application);
       try
         f.ShowModal;
       finally
         f.Free;
         clave := Fsco_ins_gru.CLAVE;
         grup := Fsco_ins_gru.grup;
       end;
   registro := FSCOALTAGRUPO.registro;
if DM.MyConnection1.Connected then
   BEGIN
      DM.QAUX.Close;
      DM.QAUX.SQL.Clear;
      DM.QAUX.SQL.Add('SELECT DISTINCT');
      DM.QAUX.SQL.Add('CONCAT( age.titulo, " ", age.nombre, " ", age.apaterno, " ", age.amaterno) AS NOMBRE,');
      DM.QAUX.SQL.Add('age.cargo,');
      DM.QAUX.SQL.Add('age.deporg');
      DM.QAUX.SQL.Add('FROM');
      DM.QAUX.SQL.Add('age');
      DM.QAUX.SQL.Add('INNER JOIN grupo ON (age.id_age = grupo.id_user) AND (GRUPO.id_grupo= '+ IntToStr(CLAVE) +')');
      DM.QAUX.SQL.Add('order by nombre');
      DM.QAUX.Open;
      NTR := dm.QAUX.RecordCount;
      GroupBox4.Caption := '   Turnado a:   '+ grup+'   No. Integrantes :   ' +IntToStr(NTR);
      application.ProcessMessages;
      NTR := dm.QAUX.RecordCount;
   END;

end;

procedure TFSCOALTAGRUPO.Button4MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Button4);
end;

procedure TFSCOALTAGRUPO.Button5Click(Sender: TObject);
var
   f: Tfsco_age_aux;
begin
   f:= Tfsco_age_aux.Create(Application);
   try
     f.ShowModal;
   finally
     f.Free;
     Edit3.Text:= fsco_age_aux.age_titulo +' '+fsco_age_aux.age_nombre+' '+fsco_age_aux.age_apaterno+ ' '+fsco_age_aux.age_amaterno;
     Edit4.Text := fsco_age_aux.age_cargo;
     Edit5.Text := fsco_age_aux.age_deporg;
     dir := fsco_age_aux.age_dir;

   end;

end;

procedure TFSCOALTAGRUPO.Button5MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(Button5);
end;

procedure TFSCOALTAGRUPO.ComboBox2Change(Sender: TObject);
begin
begin
  if ComboBox2.ItemIndex = 0 then
     begin

      ComboBox3.Text:='';
      ComboBox3.Items.Clear;
      ComboBox3.Items.Add('Invitaciones');
      ComboBox3.Items.Add('Felicitaciones');
      ComboBox3.Items.Add('Agradecimientos');
      ComboBox3.Items.Add('Informes');
      ComboBox3.Items.Add('Libros, revistas, folletos, etc.');
      ComboBox3.Items.Add('Nomina');
      ComboBox3.Items.Add('Estados de Cuenta');
     end;

  if ComboBox2.ItemIndex = 1 then
     begin
      ComboBox3.Text:='';
      ComboBox3.Items.Clear;
      ComboBox3.Items.Add('Exhortos');
      ComboBox3.Items.Add('Juicios de amparos');
      ComboBox3.Items.Add('Iniciativas Ley o Reglamentos');
      ComboBox3.Items.Add('Reformas de Ley o Reglamentos');
      ComboBox3.Items.Add('Otros');
      ComboBox3.Items.Add('Circulares');
      ComboBox3.Items.Add('Proyectos de Decreto');
      ComboBox3.Items.Add('Puntos de acuerdo');
     end;
  if ComboBox2.ItemIndex = 2 then
     begin
      ComboBox3.Text:='';
      ComboBox3.Items.Clear;
      ComboBox3.Items.Add('Peticiones para gestión');
      ComboBox3.Items.Add('Solicitudes de información');
     end;

end;
end;

procedure TFSCOALTAGRUPO.FormCreate(Sender: TObject);
begin
      ntr:=0;
      valbotton(0);
      DateTimePicker1.Date := strtodate(fmain.PutDate);
      DateTimePicker2.Date := strtodate(fmain.PutDate);
      DateTimePicker3.Date := strtodate(fmain.PutDate);
      componentes(false);
      JvImage1.Picture.LoadFromFile(fmain.ruta+'LOGO-CONGRESO_1.jpg');
      if dm.MyConnection1.Connected then
      begin
        DM.QAUX.Close;
        DM.QAUX.SQL.Clear;
      end;
   BitBtn1.Hint:='Insertar nuevo registro';
   BitBtn2.Hint:='Aceptar los cambios en el registro';
   BitBtn3.Hint:='Cancelar los cambios del registro';
   BitBtn4.Hint:='Impresión de reporte';
   BitBtn5.Hint:='Salir de la ventana';
   Button5.Hint := 'Buscar al remitente del oficio...';
   Button4.Hint := 'Buscar el grupo al cual va a ser turnado...';


      end;

end.
