//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------
unit archivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, ComCtrls, JvExExtCtrls,
  JvExtComponent, JvRollOut, ppCtrls, ppDB, ppBands, ppPrnabl, ppClass, ppCache,
  ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, jpeg, ppStrtch,
  ppMemo, Buttons, DBCtrls, JvComponentBase, JvgExportComponents,
   JvDBGridExport, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompObject, IWCompFlash, Data.DB, ppDesignLayer, QExport4Dialog,
  Vcl.ExtDlgs;

type
  TFArchivo = class(TForm)
    Panel1: TPanel;
    JvRollOut1: TJvRollOut;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    JvRollOut2: TJvRollOut;
    JvRollOut3: TJvRollOut;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    ppDBPipeline1: TppDBPipeline;
    Lista: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine3: TppLine;
    ppImage2: TppImage;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppLabel14: TppLabel;
    ppDBText14: TppDBText;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppDBText16: TppDBText;
    ppLabel21: TppLabel;
    ppDBText17: TppDBText;
    CheckBox1: TCheckBox;
    JvRollOut4: TJvRollOut;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    ppLabel7: TppLabel;
    ppDBMemo1: TppDBMemo;
    RadioButton7: TRadioButton;
    JvRollOut5: TJvRollOut;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SaveDialog1: TSaveDialog;
    JvRollOut6: TJvRollOut;
    CheckBox2: TCheckBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    Label6: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    DBGrid2: TDBGrid;
    JvRollOut7: TJvRollOut;
    Edit4: TEdit;
    QExport4Dialog1: TQExport4Dialog;
    Procedure Querypriint;
    Procedure Query(axx : bool);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit4Change(Sender: TObject);
    Procedure Queryimp;

  private
    { Private declarations }
  public
    { Public declarations }
    clave:integer;
  end;

var
  FArchivo: TFArchivo;

implementation
uses main, d_m, login, sco_imp_gru, rg_1;

{$R *.dfm}

procedure TFArchivo.BitBtn1Click(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.BitBtn2Click(Sender: TObject);
begin
query(true);
 Lista.Print;
end;

procedure TFArchivo.BitBtn3Click(Sender: TObject);
var
    i:integer;
     FieldName: string;
begin
  query(false);
  //If SaveDialog1.Execute then begin
     BitBtn1.Enabled := false;
     //QExport4Dialog1.FileName(SaveDialog1.FileName);
     QExport4Dialog1.Execute;
     //QExport4Dialog1.

     //QExport4Dialog1.FileName(SaveDialog1.FileName);
     //Dataset2Excel1.SaveDatasetAs(SaveDialog1.FileName);
     //Dataset2Excel1.Workbook := nil;
     BitBtn1.Enabled := true;
     for i := 1 to dm.QCO.RecordCount do
      begin
        dm.QCO.Edit;
        dm.QCO.FieldByName('archivo').AsBoolean := true;
        dm.QCO.Post;
        dm.QCO.Next;
      end;

  //end;
end;

procedure TFArchivo.BitBtn4Click(Sender: TObject);
var
      f:tfsco_imp_gru;
      i: integer;
begin // impresion de volantes
//     Querypriint;
     f := tfsco_imp_gru.Create(Application);
    try
      f.ShowModal;
    finally
       f.Free;
    end;
    for i := 1 to dm.QCO.RecordCount do
      begin
        dm.QCO.Edit;
        dm.QCO.FieldByName('estatus').AsBoolean := true;
        dm.QCO.Post;
        dm.QCO.Next;
      end;

    query(true);
end;

procedure TFArchivo.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFArchivo.CheckBox1Click(Sender: TObject);
begin
query(true);
end;
procedure TFArchivo.CheckBox2Click(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.ComboBox1Change(Sender: TObject);
begin
Label6.Caption :=  IntToStr(ComboBox1.ItemIndex)+'';
end;

procedure TFArchivo.ComboBox2Change(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.ComboBox3Change(Sender: TObject);
begin

  if (ComboBox3.ItemIndex = 0) then
     begin
       ComboBox4.Items.Clear;
     end;
  if ComboBox3.ItemIndex = 1 then
     begin
      ComboBox4.Text:='';
      comboBox4.Items.Clear;
      ComboBox4.Items.Add('Invitaciones');
      ComboBox4.Items.Add('Felicitaciones');
      ComboBox4.Items.Add('Agradecimientos');
      ComboBox4.Items.Add('Informes');
      ComboBox4.Items.Add('Libros, revistas, folletos, etc.');
      ComboBox4.Items.Add('Nomina');
      ComboBox4.Items.Add('Estados de Cuenta');
     end;

  if ComboBox3.ItemIndex = 2 then
     begin
      ComboBox4.Text:='';
      comboBox4.Items.Clear;
      ComboBox4.Items.Add('Exhortos');
      ComboBox4.Items.Add('Juicios de amparos');
      ComboBox4.Items.Add('Iniciativas Ley o Reglamentos');
      ComboBox4.Items.Add('Reformas de Ley o Reglamentos');
      ComboBox4.Items.Add('Otros');
      ComboBox4.Items.Add('Circulares');
      ComboBox4.Items.Add('Proyectos de Decreto');
      ComboBox4.Items.Add('Puntos de acuerdo');
     end;
  if ComboBox3.ItemIndex = 3 then
     begin
      ComboBox4.Text:='';
      ComboBox4.Items.Clear;
      ComboBox4.Items.Add('Peticiones para gestión');
      ComboBox4.Items.Add('Solicitudes de información');
      ComboBox4.Items.Add('');
     end;
query(true);
end;

procedure TFArchivo.ComboBox4Change(Sender: TObject);
begin
query(true);
end;

//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------

procedure TFArchivo.DateTimePicker1Change(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.DateTimePicker2Change(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.DBGrid1CellClick(Column: TColumn);
begin
frg_1.Show;
end;

procedure TFArchivo.DBGrid1DblClick(Sender: TObject);
begin
if dm.MyConnection1.Connected then
    begin
      frg.clave := dm.QCO.FieldByName('Folio').AsInteger;
      Close;
    end;
end;

procedure TFArchivo.Edit1Change(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.Edit2Change(Sender: TObject);
begin
if CheckBox2.Checked then
     query(true);
end;

procedure TFArchivo.Edit3Change(Sender: TObject);
begin
if CheckBox2.Checked then
     query(true);
end;

procedure TFArchivo.Edit4Change(Sender: TObject);
begin
     query(true);
end;

procedure TFArchivo.FormCreate(Sender: TObject);
begin
 DateTimePicker1.Date :=  StrToDate(fmain.PutDate);
 DateTimePicker2.Date :=  StrToDate(fmain.PutDate);
end;

Procedure TFArchivo.Querypriint;
var
    FIni, FFin  :String;
    A,M,D : Word;
    va, vb,vc,vd : integer;
begin
if dm.MyConnection1.Connected then
   begin
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'coh1.sql');
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

       if CheckBox2.Checked then
       begin
           if ( (Edit3.Text = ''  ) and ((Edit2.Text <> '')) ) then
           begin
              dm.QCO.SQL.Add('AND');
              dm.QCO.SQL.Add('id = '+ (Edit2.Text) +'');
             end;
             ///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if ((Edit2.Text <> Edit3.Text) and (Edit2.Text <> '') and (Edit3.Text<>'') ) then
             begin
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('id BETWEEN '+ QuotedStr(EDit2.Text) + ' AND ' + QuotedStr(Edit3.Text));
             end;
       end;


         if NOT RadioButton7.Checked then
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
                 dm.QCO.SQL.Add('ESTATUS = "0"');
               end;
            END;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - turno'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('tur_nom LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - turno'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('tur_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - turno'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('tur_deporg LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - remite'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('tur_nom LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - remite'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('rem_nombre LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - remite'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('rem_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Descripción'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('des LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Seguimiento'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('seguimiento LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - turno'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('tur_deporg LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox2.Text <> ''))then
         begin
           dm.QCO.SQL.Add('AND');
         if ((Combobox2.Text = 'Todas'))then
           dm.QCO.SQL.Add('ncor LIKE "%%"')
           else
           dm.QCO.SQL.Add('ncor LIKE "%'+ ComboBox2.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox3.Text <> ''))then
         begin
           dm.QCO.SQL.Add('AND');
         if ((Combobox3.Text = 'Todas'))then
           dm.QCO.SQL.Add('tcor LIKE "%%"')
           else
           dm.QCO.SQL.Add('tcor LIKE "%'+ ComboBox3.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox4.Text <> ''))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('ccor LIKE "%'+ ComboBox4.Text +'%"');
         end;
        dm.QCO.SQL.add('ORDER BY  CO.id');
       dm.QCO.Open;
       dm.QCO.Last;
   end; // fin de la validacion
end;

{
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}

Procedure TFArchivo.Query(axx : bool);

var
    FIni, FFin  :String;
    A,M,D : Word;
    va, vb,vc,vd : integer;
begin
if dm.MyConnection1.Connected then
   begin
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
      if axx then
           dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql')
         else
            dm.QCO.SQL.LoadFromFile(fmain.ruta+'cox.sql');

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

       if CheckBox2.Checked then
       begin
           if ( (Edit3.Text = ''  ) and ((Edit2.Text <> '')) ) then
           begin
              dm.QCO.SQL.Add('AND');
              dm.QCO.SQL.Add('id = '+ (Edit2.Text) +'');
             end;
             ///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if ((Edit2.Text <> Edit3.Text) and (Edit2.Text <> '') and (Edit3.Text<>'') ) then
             begin
               dm.QCO.SQL.Add('AND');
               dm.QCO.SQL.Add('id BETWEEN '+ QuotedStr(EDit2.Text) + ' AND ' + QuotedStr(Edit3.Text));
             end;
       end;
         if NOT RadioButton7.Checked then
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
                 dm.QCO.SQL.Add('ESTATUS = "0"');
               end;
            END;
{------------------------------------------------------------------------------}
         if ((Edit4.Text  <> '') )then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('nofi LIKE "%'+Edit4.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - turno'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('tur_nom LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - turno'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('tur_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - turno'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('tur_deporg LIKE "%'+Edit1.Text+'%"');////////////////////////////
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - remite'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('rem_nombre LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - remite'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('rem_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - remite'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('rem_deporg LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Descripción'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('des LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Seguimiento'))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('seguimiento LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Combobox2.Text <> ''))then
         begin
           dm.QCO.SQL.Add('AND');
         if ((Combobox2.Text = 'Todas'))then
           dm.QCO.SQL.Add('ncor LIKE "%%"')
           else
           dm.QCO.SQL.Add('ncor LIKE "%'+ ComboBox2.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox3.Text <> ''))then
         begin
           dm.QCO.SQL.Add('AND');
         if ((Combobox3.Text = 'Todas'))then
           dm.QCO.SQL.Add('tcor LIKE "%%"')
           else
           dm.QCO.SQL.Add('tcor LIKE "%'+ ComboBox3.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox4.Text <> ''))then
         begin
           dm.QCO.SQL.Add('AND');
           dm.QCO.SQL.Add('ccor LIKE "%'+ ComboBox4.Text +'%"');
         end;
        dm.QCO.SQL.add('ORDER BY  CO.id');
//        Memo1.Text := dm.QCO.sQL.Text;
       dm.QCO.Open;
       dm.QCO.Last;
       Queryimp;       
       Memo1.Text := dm.QCO.SQL.Text;
   end; // fin de la validacion
end;


procedure TFArchivo.RadioButton1Click(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.RadioButton2Click(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.RadioButton3Click(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.RadioButton4Click(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.RadioButton5Click(Sender: TObject);
begin
query(true);
end;

procedure TFArchivo.RadioButton6Click(Sender: TObject);
begin
query(true);
end;

//-----------------------------------

Procedure TFArchivo.Queryimp;

var
    FIni, FFin  :String;
    A,M,D : Word;
    va, vb,vc,vd : integer;
begin
if dm.MyConnection1.Connected then
   begin
       dm.QImpresion.Close;
       dm.QImpresion.SQL.Clear;
       dm.QImpresion.SQL.LoadFromFile(fmain.ruta+'coh1.sql');
//------------------------------------------------------------------------------
       if CheckBox1.Checked then
       begin
           if (DateTimePicker1.Date = DateTimePicker2.Date) then
           begin
              DecodeDate(DateTimePicker1.Date,A,M,D);
              FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
              dm.QImpresion.SQL.Add('AND');
              dm.QImpresion.SQL.Add('fcap = '+ QuotedStr(fini) +'');
             end;
///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if (DateTimePicker1.Date <> DateTimePicker2.Date) then
             begin
               DecodeDate(DateTimePicker1.Date,A,M,D);
               FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
               DecodeDate(DateTimePicker2.Date,A,M,D);
               FFin := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
               dm.QImpresion.SQL.Add('AND');
               dm.QImpresion.SQL.Add('fcap BETWEEN '+QuotedStr(Fini) + ' AND ' + QuotedStr(FFin));
             end;
       end;

       if CheckBox2.Checked then
       begin
           if ( (Edit3.Text = ''  ) and ((Edit2.Text <> '')) ) then
           begin
              dm.QImpresion.SQL.Add('AND');
              dm.QImpresion.SQL.Add('id = '+ (Edit2.Text) +'');
             end;
             ///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if ((Edit2.Text <> Edit3.Text) and (Edit2.Text <> '') and (Edit3.Text<>'') ) then
             begin
               dm.QImpresion.SQL.Add('AND');
               dm.QImpresion.SQL.Add('id BETWEEN '+ QuotedStr(EDit2.Text) + ' AND ' + QuotedStr(Edit3.Text));
             end;
       end;
         if NOT RadioButton7.Checked then
            BEGIN

               if RadioButton4.Checked then
               begin
                 dm.QImpresion.SQL.Add('AND');
                 dm.QImpresion.SQL.Add('tramite = "0"');
                 dm.QImpresion.SQL.Add('AND');
                 dm.QImpresion.SQL.Add('ESTATUS = "0"');
               end;
               if RadioButton5.Checked then
               begin
                 dm.QImpresion.SQL.Add('AND');
                 dm.QImpresion.SQL.Add('tramite = "1"');
                 dm.QImpresion.SQL.Add('AND');
                 dm.QImpresion.SQL.Add('ESTATUS = "1"');
               end;
               if RadioButton6.Checked then
               begin
                 dm.QImpresion.SQL.Add('AND');
                 dm.QImpresion.SQL.Add('tramite = "1"');
                 dm.QImpresion.SQL.Add('AND');
                 dm.QImpresion.SQL.Add('ESTATUS = "0"');
               end;
            END;
{------------------------------------------------------------------------------}
         if ((Edit4.Text  <> '') )then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('nofi LIKE "%'+Edit4.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - turno'))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('tur_nom LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - turno'))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('tur_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - turno'))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('tur_deporg LIKE "%'+Edit1.Text+'%"');////////////////////////////
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - remite'))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('rem_nombre LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - remite'))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('rem_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - remite'))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('rem_deporg LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Descripción'))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('des LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Seguimiento'))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('seguimiento LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Combobox2.Text <> ''))then
         begin
           dm.QImpresion.SQL.Add('AND');
         if ((Combobox2.Text = 'Todas'))then
           dm.QImpresion.SQL.Add('ncor LIKE "%%"')
           else
           dm.QImpresion.SQL.Add('ncor LIKE "%'+ ComboBox2.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox3.Text <> ''))then
         begin
           dm.QImpresion.SQL.Add('AND');
         if ((Combobox3.Text = 'Todas'))then
           dm.QImpresion.SQL.Add('tcor LIKE "%%"')
           else
           dm.QImpresion.SQL.Add('tcor LIKE "%'+ ComboBox3.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox4.Text <> ''))then
         begin
           dm.QImpresion.SQL.Add('AND');
           dm.QImpresion.SQL.Add('ccor LIKE "%'+ ComboBox4.Text +'%"');
         end;
        dm.QImpresion.SQL.add('ORDER BY  CO.id');
//        Memo1.Text := dm.QImpresion.sQL.Text;
       dm.QImpresion.Open;
       dm.QImpresion.Last;
//       Memo1.Text := dm.QImpresion.SQL.Text;
   end; // fin de la validacion
end;


end.
