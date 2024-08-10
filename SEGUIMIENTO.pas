unit SEGUIMIENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, JvExExtCtrls, JvExtComponent,
  JvRollOut, ExtCtrls, Buttons;

type
  TFSEGUIMIENTO = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    JvRollOut3: TJvRollOut;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    JvRollOut1: TJvRollOut;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    JvRollOut2: TJvRollOut;
    Edit1: TEdit;
    Memo1: TMemo;
    JvRollOut4: TJvRollOut;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    BitBtn1: TBitBtn;
    RadioButton3: TRadioButton;
    Procedure Query;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSEGUIMIENTO: TFSEGUIMIENTO;

implementation
USES MAIN, D_m, login;

{$R *.dfm}
//-----------------------------------------------------------------------------

Procedure TFSEGUIMIENTO.Query;
var
    FIni, FFin  :String;
    A,M,D : Word;
    va, vb,vc,vd : integer;
begin
if dm.MyConnection1.Connected then
   begin
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
//------------------------------------------------------------------------------
       if CheckBox1.Checked then
       begin
           if (DateTimePicker1.Date = DateTimePicker2.Date) then
           begin
              DecodeDate(DateTimePicker1.Date,A,M,D);
              FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
              dm.QCO.SQL.Add('AND');
              dm.QCO.SQL.Add('fcap = '+ QuotedStr(fini) +'');
             end;
///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if (DateTimePicker1.Date <> DateTimePicker2.Date) then
             begin
               DecodeDate(DateTimePicker1.Date,A,M,D);
               FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
               DecodeDate(DateTimePicker2.Date,A,M,D);
               FFin := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('fcap BETWEEN '+QuotedStr(Fini) + ' AND ' + QuotedStr(FFin));
             end;
       end;
         if Edit1.Text <> '' then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('id  LIKE "%'+Edit1.Text+'%"');
         end;

          if  NOT RadioButton3.Checked then
             BEGIN

             if RadioButton4.Checked then
             begin
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('tramite = "0"');
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('ESTATUS = "0"');
             end;
             if RadioButton5.Checked then
             begin
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('tramite = "1"');
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('ESTATUS = "1"');
             end;
             if RadioButton6.Checked then
             begin
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('tramite = "1"');
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('estatus = "0"');
             end;
          END;
       dm.QCO.SQL.add('ORDER BY  CO.id');
       dm.QCO.Open;
       dm.QCO.Last;
       Memo1.Text := dm.QCO.SQL.Text;
   end; // fin de la validacion

end;
{------------------------------------------------------------------------------}

procedure TFSEGUIMIENTO.RadioButton4Click(Sender: TObject);
begin
   Query;
end;

procedure TFSEGUIMIENTO.RadioButton5Click(Sender: TObject);
begin
   Query;
end;

procedure TFSEGUIMIENTO.RadioButton6Click(Sender: TObject);
begin
   Query;
end;

procedure TFSEGUIMIENTO.BitBtn1Click(Sender: TObject);
begin
   Query;
end;

procedure TFSEGUIMIENTO.Button1Click(Sender: TObject);
begin  // bottom
   Query;
end;

procedure TFSEGUIMIENTO.CheckBox1Click(Sender: TObject);
begin
   Query;
end;

procedure TFSEGUIMIENTO.DateTimePicker1Change(Sender: TObject);
begin
   Query;
end;

procedure TFSEGUIMIENTO.DateTimePicker2Change(Sender: TObject);
begin
   Query;
end;

procedure TFSEGUIMIENTO.DBGrid1DblClick(Sender: TObject);
begin
   if dm.MyConnection1.Connected then
   begin
      if RadioButton1.Checked then
         begin
            if dm.QCO.FieldByName('Tramite').AsBoolean then
            begin
               dm.QCO.Edit;
               dm.QCO.FieldByName('concluido').AsBoolean := false;
               dm.QCO.FieldByName('fecha de conclusión').AsDateTime :=  StrToDate(fmain.PutDate);
               dm.QCO.FieldByName('Quien lo concluyo').AsString := dm.MyConnection1.Username;
               dm.QCO.Post;
               dm.QCO.Refresh;
            end else begin
            end;

         end;
      if RadioButton2.Checked then
         begin
            if dm.QCO.FieldByName('Tramite').AsBoolean then
            begin
               dm.QCO.Edit;
               dm.QCO.FieldByName('concluido').AsBoolean := true;
               dm.QCO.FieldByName('fecha de conclusión').AsDateTime :=  StrToDate(fmain.PutDate);
               dm.QCO.FieldByName('Quien lo concluyo').AsString := dm.MyConnection1.Username;
               dm.QCO.Post;
               dm.QCO.Refresh;
            end else begin
//               ShowMessage('Disculpe las molestias no se pudo modificar el estatus de la presente, debido a que el tramite no se ha iniciado, por tal motivo se necesita imprimir el volante respetivo.');
            end;

         end;
   end;

end;

//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------


procedure TFSEGUIMIENTO.Edit1Change(Sender: TObject);
begin
   Query;
end;

procedure TFSEGUIMIENTO.FormCreate(Sender: TObject);
begin  // create
if dm.MyConnection1.Connected then
   begin
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
       dm.QCO.SQL.Add('ORDER BY');
       dm.QCO.SQL.Add('co.id');
       dm.QCO.Open;
       DateTimePicker1.Date := StrToDate (fmain.PutDate);
       DateTimePicker2.Date := StrToDate (fmain.PutDate);
   end;

end;

end.
