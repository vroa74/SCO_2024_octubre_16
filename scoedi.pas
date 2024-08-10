unit scoedi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFscoedi = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Edit5: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
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
    DateTimePicker3: TDateTimePicker;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Button4: TButton;
    Edit8: TEdit;
    CheckBox1: TCheckBox;
    Memo2: TMemo;
    Label16: TLabel;
    Label17: TLabel;
    procedure llenar;
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    t, e  :bool;
    td, ed :Tdate;
    tu, eu :string;
    dir: string;

  end;

var
  Fscoedi: TFscoedi;

implementation
uses main, d_m, sco_age_aux;

{$R *.dfm}


procedure TFscoedi.llenar;
begin
 if dm.MyConnection1.Connected then
   begin
      DateTimePicker1.Date := strtodate(fmain.PutDate);
      DateTimePicker2.Date := strtodate(fmain.PutDate);
      DateTimePicker3.Date := strtodate(fmain.PutDate);
      Edit3.ReadOnly := true;
      Edit4.ReadOnly := true;
      Edit5.ReadOnly := true;
      Edit6.ReadOnly := true;
      Edit7.ReadOnly := true;
      Edit8.ReadOnly := true;
      ComboBox1.Text := '';
      ComboBox2.Text := '';
      ComboBox3.Text := '';
      Edit1.Text := '';
      Edit2.Text := '';
      Edit3.Text := '';
      Edit4.Text := '';
      Edit5.Text := '';
      Edit6.Text := '';
      Edit7.Text := '';
      Edit8.Text := '';
      Label17.Caption := '';
      CheckBox1.Checked := false;
//      Edit8.Text := '';
      Label17.Caption := 'No.  '+ IntToStr( dm.TCO.FieldByName('id').AsInteger   );
      DateTimePicker1.Date := dm.tco.FieldByName('fcap').AsDateTime;
      DateTimePicker2.Date := dm.tco.FieldByName('frec').AsDateTime ;
      ComboBox1.Text := dm.tco.FieldByName('ncor').AsString ;
      ComboBox2.Text := dm.tco.FieldByName('tcor').AsString ;
      ComboBox3.Text := dm.tco.FieldByName('ccor').AsString ;
      DateTimePicker3.Date := dm.tco.FieldByName('fofi').AsDateTime ;
      Edit1.Text := dm.tco.FieldByName('nofi').AsString ;
      Edit2.Text := dm.tco.FieldByName('nhoj').AsString ;
      Edit3.Text := dm.tco.FieldByName('rem_nombre').AsString;
      Edit4.Text := dm.tco.FieldByName('rem_cargo').AsString ;
      Edit5.Text := dm.tco.FieldByName('rem_deporg').AsString;
      dir := dm.tco.FieldByName('rem_dir').AsString;
      Memo1.Text := dm.tco.FieldByName('des').AsString ;
      Memo2.Text := dm.tco.FieldByName('seguimiento').AsString ;
      Edit6.Text := dm.tco.FieldByName('tur_nom').AsString ;
      Edit7.Text := dm.tco.FieldByName('tur_cargo').AsString ;
      Edit8.Text := dm.tco.FieldByName('tur_deporg').AsString;
//  ---------------------------------------------------------------      tu, eu
      t := dm.tco.FieldByName('tramite').AsBoolean;
      td := dm.tco.FieldByName('fiat').AsDateTime ;
      tu := dm.tco.FieldByName('Q_tra').AsString ;
      e := dm.tco.FieldByName('estatus').AsBoolean;
      ed := dm.tco.FieldByName('fcat').AsDateTime ;
      eu := dm.tco.FieldByName('Q_est').AsString ;
      CheckBox1.Checked := t;
  end;
end;
//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------


procedure TFscoedi.Button1Click(Sender: TObject);
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
     dir  :=  fsco_age_aux.age_dir;
   end;

end;

procedure TFscoedi.Button2Click(Sender: TObject);
begin
   if dm.MyConnection1.Connected then
      begin
          Edit1.Text := trim (Edit1.Text);
          Edit2.Text := trim (Edit2.Text);
          Edit3.Text := trim (Edit3.Text);
          Edit4.Text := trim (Edit4.Text);
          Edit5.Text := trim (Edit5.Text);
          Edit6.Text := trim (Edit6.Text);
          Edit7.Text := trim (Edit7.Text);
          Edit8.Text := trim (Edit8.Text);
          dm.tco.Edit ;
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
          dm.tco.FieldByName('tur_nom').AsString :=  Edit6.Text;
          dm.tco.FieldByName('tur_cargo').AsString :=  Edit7.Text;
          dm.tco.FieldByName('tur_deporg').AsString :=  Edit8.Text;
          dm.tco.FieldByName('tramite').AsBoolean := t;
          dm.tco.FieldByName('fiat').AsDateTime  := td;
          if CheckBox1.Checked then
           begin
              if dm.TCO.FieldByName('tramite').AsBoolean then
              begin
                 dm.TCO.FieldByName('estatus').AsBoolean := CheckBox1.Checked;
                 dm.TCO.FieldByName('fcat').AsDateTime :=  StrToDate(fmain.PutDate);
                 dm.tco.FieldByName('Q_est').AsString := dm.MyConnection1.Username;
              end else begin
               ShowMessage('Disculpe las molestias no se pudo modificar el estatus de la presente, debido a que el tramite no se ha iniciado, por tal motivo se necesita imprimir el volante respetivo.');
               dm.tco.FieldByName('fiat').AsDateTime  := StrToDate(fmain.PutDate);
               dm.TCO.FieldByName('estatus').AsBoolean := CheckBox1.Checked;
              end;
           end;
          dm.tco.Post;
          dm.Tage.Refresh;
          dm.QCO.Refresh;
          close;
      end;

end;

procedure TFscoedi.Button3Click(Sender: TObject);
begin
   close;
end;

procedure TFscoedi.Button4Click(Sender: TObject);

var
   f: Tfsco_age_aux;
begin
   f:= Tfsco_age_aux.Create(Application);
   try
     f.ShowModal;
   finally
     f.Free;
     Edit6.Text:= fsco_age_aux.age_titulo +' '+fsco_age_aux.age_nombre+' '+fsco_age_aux.age_apaterno+ ' '+fsco_age_aux.age_amaterno;
     Edit7.Text := fsco_age_aux.age_cargo;
     Edit8.Text := fsco_age_aux.age_deporg;
   end;

end;

procedure TFscoedi.ComboBox2Change(Sender: TObject);
begin
  if ComboBox2.ItemIndex = 0 then
     begin
      ComboBox3.Text:='';
      comboBox3.Items.Clear;
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
      comboBox3.Items.Clear;
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
      comboBox3.Items.Clear;
      ComboBox3.Items.Add('Peticiones para gestión');
      ComboBox3.Items.Add('Solicitudes de información');
     end;

end;

procedure TFscoedi.FormCreate(Sender: TObject);
begin
   if dm.MyConnection1.Connected then
     begin
     end;//fin del la validacion de conexión
     llenar;
     Edit3.ReadOnly := true;
     Edit4.ReadOnly := true;
     Edit5.ReadOnly := true;
     Edit6.ReadOnly := true;
     Edit7.ReadOnly := true;
     Edit8.ReadOnly := true;
end;

end.
