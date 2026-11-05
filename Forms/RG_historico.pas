//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------
unit RG_historico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, ComCtrls, JvExExtCtrls,
  JvExtComponent, JvRollOut, ppCtrls, ppDB, ppBands, ppPrnabl, ppClass, ppCache,
  ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, jpeg, ppStrtch,
  ppMemo, Buttons, DBCtrls, JvComponentBase, JvgExportComponents,
   JvDBGridExport, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompObject, IWCompFlash, Data.DB, ppDesignLayer, QExport4Dialog,
  CRGrid, Clipbrd;

type
  TFRG_historico = class(TForm)
    Panel1: TPanel;
    JvRollOut1: TJvRollOut;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
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
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    Memo1: TMemo;
    Memo2: TMemo;
    JvRollOut7: TJvRollOut;
    Edit4: TEdit;
    StatusBar1: TStatusBar;
    QExport4Dialog1: TQExport4Dialog;
    CRDBGrid1: TCRDBGrid;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    DBNavigator2: TDBNavigator;
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
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit4Change(Sender: TObject);
    Procedure Queryimp;
    procedure CRDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CRDBGrid1CellClick(Column: TColumn);
    procedure BitBtn6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    clave:integer;
  end;

var
  FRG_historico: TFRG_historico;

implementation

              uses main, d_m, login,  rg_1;

{$R *.dfm}


procedure CopyAndDeleteRecords;
begin
  dm.QCO_His.First; // Comienza desde el primer registro
  while not dm.QCO_His.Eof do
  begin
    // Preparar la inserción en la tabla co_hist
     dm.QCO.Insert;
    // Asignar valores a los parámetros de la consulta de inserción
       dm.QCO.FieldByName('folio').AsInteger := dm.QCO_His.FieldByName('id').AsInteger;
       dm.QCO.FieldByName('Fecha de captura').AsDateTime := dm.QCO_His.FieldByName('fcap').AsDateTime;
       dm.QCO.FieldByName('Fecha de recepción').AsDateTime := dm.QCO_His.FieldByName('frec').AsDateTime;
       dm.QCO.FieldByName('Nivel de correspondencia').AsString := dm.QCO_His.FieldByName('ncor').AsString;
       dm.QCO.FieldByName('Tipo de correspondencia').AsString := dm.QCO_His.FieldByName('tcor').AsString;
       dm.QCO.FieldByName('Tipo de correspondencia').AsString := dm.QCO_His.FieldByName('ccor').AsString;
       dm.QCO.FieldByName('Fecha de oficio').AsDateTime := dm.QCO_His.FieldByName('fofi').AsDateTime;
       dm.QCO.FieldByName('Numero de Oficio').AsString := dm.QCO_His.FieldByName('nofi').AsString;
       dm.QCO.FieldByName('Numero de hojas').AsInteger := dm.QCO_His.FieldByName('nhoj').AsInteger;
       dm.QCO.FieldByName('Nombre del remitente').AsString := dm.QCO_His.FieldByName('rem_nombre').AsString;
       dm.QCO.FieldByName('cargo del remitente').AsString := dm.QCO_His.FieldByName('rem_cargo').AsString;
       dm.QCO.FieldByName('Depto. U org. Del remitente').AsString := dm.QCO_His.FieldByName('rem_deporg').AsString;
       dm.QCO.FieldByName('Dirección del Remitente').AsString := dm.QCO_His.FieldByName('rem_dir').AsString;
       dm.QCO.FieldByName('Descripcion de Oficio').AsString := dm.QCO_His.FieldByName('des').AsString;
       dm.QCO.FieldByName('Seguimiento').AsString := dm.QCO_His.FieldByName('seguimiento').AsString;
       dm.QCO.FieldByName('Nombre turnado').AsString := dm.QCO_His.FieldByName('tur_nom').AsString;
       dm.QCO.FieldByName('Cargo turnado').AsString := dm.QCO_His.FieldByName('tur_cargo').AsString;
       dm.QCO.FieldByName('Depto. U organ. Del turnado').AsString := dm.QCO_His.FieldByName('tur_deporg').AsString;
       dm.QCO.FieldByName('modifico').AsString := dm.QCO_His.FieldByName('modifico').AsString;
       dm.QCO.FieldByName('Tramite').AsBoolean := dm.QCO_His.FieldByName('tramite').AsBoolean;
       dm.QCO.FieldByName('Fecha Inicio tramite').AsDateTime := dm.QCO_His.FieldByName('FIAT').AsDateTime;
       dm.QCO.FieldByName('Quien inicio el tramite').AsString := dm.QCO_His.FieldByName('Q_TRA').AsString;
       dm.QCO.FieldByName('concluido').AsBoolean := dm.QCO_His.FieldByName('estatus').AsBoolean;
       dm.QCO.FieldByName('fecha de conclusión').AsDateTime := dm.QCO_His.FieldByName('FCAT').AsDateTime;
       dm.QCO.FieldByName('Quien lo concluyo').AsString := dm.QCO_His.FieldByName('Q_EST').AsString;
       dm.QCO.FieldByName('Archivo').AsBoolean := dm.QCO_His.FieldByName('archivo').AsBoolean;
       dm.QCO.FieldByName('Fecha de archivo').AsDateTime := dm.QCO_His.FieldByName('FAAT').AsDateTime;

       dm.QCO.FieldByName('Quien Archivo').AsString := dm.QCO_His.FieldByName('Q_ARC').AsString;
    dm.QCO.Post;
    // Borrar el registro de QCO
    dm.QCO_His.Delete;
    // Avanzar al siguiente registro
    Application.ProcessMessages;
  end;
end;

//******************************************************************************/

procedure TFRG_historico.BitBtn1Click(Sender: TObject);
begin
      query(true);
end;

procedure TFRG_historico.BitBtn2Click(Sender: TObject);
begin
   query(true);
       pplabel61.Caption := Fmain.Ttitle;
       pplabel60.Caption := fmain.CopyRight;
   ppImage2.Picture.LoadFromFile(fmain.ruta+fmain.mmedia+'ple.png');
   Lista.Print;
end;

procedure TFRG_historico.BitBtn3Click(Sender: TObject);
begin
  query(false);
  If SaveDialog1.Execute then begin
     BitBtn1.Enabled := false;
     QExport4Dialog1.FileName := SaveDialog1.FileName;
     try
      QExport4Dialog1.Execute;
      except
        on E: Exception do
        begin
          ShowMessage('Ocurrió un error: ' + E.Message);
        end;
      end;
     BitBtn1.Enabled := true;
  end;
end;

procedure TFRG_historico.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFRG_historico.BitBtn6Click(Sender: TObject);
var
   respuesta: Integer;
begin
 if dm.MyConnection1.Connected then
    begin
      dm.QCO.Close;
      dm.QCO.SQL.Clear;
      dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
      dm.qco.Open
    end;
  if not dm.Qco_his.Active then
      dm.Qco_his.Open;
      respuesta := MessageDlg('Todo lo que está a la vista pasará a formar parte del histórico. ¿Desea continuar?',  mtWarning, [mbYes, mbNo], 0);  if respuesta = mrYes then
  begin
    ShowMessage('Acción confirmada. Continuando con el proceso...');
    CopyAndDeleteRecords;
  end
  else
  begin
    ShowMessage('Acción cancelada.');
  end;

end;

procedure TFRG_historico.CheckBox1Click(Sender: TObject);
begin
  query(true);
end;

procedure TFRG_historico.CheckBox2Click(Sender: TObject);
begin
  query(true);
end;

procedure TFRG_historico.ComboBox2Change(Sender: TObject);
begin
  query(true);
end;

procedure TFRG_historico.ComboBox3Change(Sender: TObject);
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

procedure TFRG_historico.ComboBox4Change(Sender: TObject);
begin
  query(true);
end;

procedure TFRG_historico.CRDBGrid1CellClick(Column: TColumn);
var
  selectedText: string;
  selectedDate: string;
begin
  // Verifica si la columna seleccionada es del tipo texto (ftMemo o ftWideMemo)
      if (Column.Field.DataType = ftMemo) or (Column.Field.DataType = ftWideMemo) then
      begin
        selectedText := Column.Field.AsString;  // Obtiene el valor del campo TEXT
        Clipboard.AsText := selectedText;  // Copia el valor al portapapeles
        //ShowMessage('Texto copiado al portapapeles: ' + selectedText);
      end;

      if Column.Field.DataType = ftString then
        begin
          selectedText := Column.Field.AsString;  // Obtiene el valor del campo de texto
          Clipboard.AsText := selectedText;  // Copia al portapapeles
          //ShowMessage('Texto copiado al portapapeles: ' + selectedText);
        end;

     if (Column.Field.DataType = ftDate) or (Column.Field.DataType = ftDateTime) then
      begin
        selectedDate := DateToStr(Column.Field.AsDateTime);
        Clipboard.AsText := selectedDate;  // Copia la fecha como texto al portapapeles
        //ShowMessage('Fecha copiada al portapapeles: ' + selectedDate);
      end;

end;

procedure TFRG_historico.CRDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then  // Evita que el color de fondo cambie cuando la fila esté seleccionada
  begin
    CRDBGrid1.Canvas.Brush.Color := clSkyBlue;  // Cambia 'clYellow' por el color deseado
  end
  else
  begin
    CRDBGrid1.Canvas.Brush.Color := clHighlight;  // El color cuando la celda está seleccionada
  end;

end;

//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------

procedure TFRG_historico.DateTimePicker1Change(Sender: TObject);
begin
  query(true);
end;

procedure TFRG_historico.DateTimePicker2Change(Sender: TObject);
begin
  query(true);
end;

procedure TFRG_historico.DBGrid1CellClick(Column: TColumn);
begin
  frg_1.Show;
end;

procedure TFRG_historico.DBGrid1DblClick(Sender: TObject);
begin
  if dm.MyConnection1.Connected then
      begin
        FRG_historico.clave := dm.Qco_his.FieldByName('Folio').AsInteger;
        Close;
      end;
end;

procedure TFRG_historico.Edit1Change(Sender: TObject);
begin
  query(true);
end;

procedure TFRG_historico.Edit2Change(Sender: TObject);
begin
  if CheckBox2.Checked then
       query(true);
end;

procedure TFRG_historico.Edit3Change(Sender: TObject);
begin
  if CheckBox2.Checked then
       query(true);
end;

procedure TFRG_historico.Edit4Change(Sender: TObject);
begin
     query(true);
end;

procedure TFRG_historico.FormCreate(Sender: TObject);
begin
 DateTimePicker1.Date :=  StrToDate(fmain.PutDate);
 DateTimePicker2.Date :=  StrToDate(fmain.PutDate);
 if dm.MyConnection1.Connected then
    begin
      dm.QCO.Close;
      dm.QCO.SQL.Clear;
      dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
      dm.qco.Open
    end;
end;

Procedure TFRG_historico.Querypriint;
var
    FIni, FFin  :String;
    A,M,D : Word;
    va, vb,vc,vd : integer;
begin
if dm.MyConnection1.Connected then
   begin
       dm.Qco_his.Close;
       dm.Qco_his.SQL.Clear;
       dm.Qco_his.SQL.LoadFromFile(fmain.ruta+'sql\cohist\'+'cohist_1.sql');
//------------------------------------------------------------------------------
       if CheckBox1.Checked then
       begin
           if (DateTimePicker1.Date = DateTimePicker2.Date) then
           begin
              DecodeDate(DateTimePicker1.Date,A,M,D);
              FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
              dm.Qco_his.SQL.Add('AND');
              dm.Qco_his.SQL.Add('fcap = '+ QuotedStr(fini) +'');
             end;
///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if (DateTimePicker1.Date <> DateTimePicker2.Date) then
             begin
               DecodeDate(DateTimePicker1.Date,A,M,D);
               FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
               DecodeDate(DateTimePicker2.Date,A,M,D);
               FFin := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
               dm.Qco_his.SQL.Add('AND');
               dm.Qco_his.SQL.Add('fcap BETWEEN '+QuotedStr(Fini) + ' AND ' + QuotedStr(FFin));
             end;
       end;

       if CheckBox2.Checked then
       begin
           if ( (Edit3.Text = ''  ) and ((Edit2.Text <> '')) ) then
           begin
              dm.Qco_his.SQL.Add('AND');
              dm.Qco_his.SQL.Add('id = '+ (Edit2.Text) +'');
             end;
             ///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if ((Edit2.Text <> Edit3.Text) and (Edit2.Text <> '') and (Edit3.Text<>'') ) then
             begin
               dm.Qco_his.SQL.Add('AND');
               dm.Qco_his.SQL.Add('id BETWEEN '+ QuotedStr(EDit2.Text) + ' AND ' + QuotedStr(Edit3.Text));
             end;
       end;


         if NOT RadioButton7.Checked then
            BEGIN

               if RadioButton4.Checked then
               begin
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('tramite = "0"');
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('ESTATUS = "0"');
               end;
               if RadioButton5.Checked then
               begin
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('tramite = "1"');
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('ESTATUS = "1"');
               end;
               if RadioButton6.Checked then
               begin
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('tramite = "1"');
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('ESTATUS = "0"');
               end;
            END;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - turno'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('tur_nom LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - turno'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('tur_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - turno'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('tur_deporg LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - remite'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('tur_nom LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - remite'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('rem_nombre LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - remite'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('rem_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Descripción'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('des LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Seguimiento'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('seguimiento LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - turno'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('tur_deporg LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox2.Text <> ''))then
         begin
           dm.Qco_his.SQL.Add('AND');
         if ((Combobox2.Text = 'Todas'))then
           dm.Qco_his.SQL.Add('ncor LIKE "%%"')
           else
           dm.Qco_his.SQL.Add('ncor LIKE "%'+ ComboBox2.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox3.Text <> ''))then
         begin
           dm.Qco_his.SQL.Add('AND');
         if ((Combobox3.Text = 'Todas'))then
           dm.Qco_his.SQL.Add('tcor LIKE "%%"')
           else
           dm.Qco_his.SQL.Add('tcor LIKE "%'+ ComboBox3.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox4.Text <> ''))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('ccor LIKE "%'+ ComboBox4.Text +'%"');
         end;
        dm.Qco_his.SQL.add('ORDER BY  CO_hist.id');
       dm.Qco_his.Open;
       dm.Qco_his.Last;
   end; // fin de la validacion
end;

{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

Procedure TFRG_historico.Query(axx : bool);

var
    FIni, FFin  :String;
    A,M,D : Word;
    va, vb,vc,vd : integer;
begin
if dm.MyConnection1.Connected then
   begin
       dm.Qco_his.Close;
       dm.Qco_his.SQL.Clear;
      if axx then
           dm.Qco_his.SQL.LoadFromFile(fmain.ruta+'sql\cohist\'+'cohist.sql')
         else
            dm.Qco_his.SQL.LoadFromFile(fmain.ruta+'sql\cohist\'+'cohistx.sql');

//------------------------------------------------------------------------------
       if CheckBox1.Checked then
       begin
           if (DateTimePicker1.Date = DateTimePicker2.Date) then
           begin
              DecodeDate(DateTimePicker1.Date,A,M,D);
              FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
              dm.Qco_his.SQL.Add('AND');
              dm.Qco_his.SQL.Add('fcap = '+ QuotedStr(fini) +'');
             end;
///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if (DateTimePicker1.Date <> DateTimePicker2.Date) then
             begin
               DecodeDate(DateTimePicker1.Date,A,M,D);
               FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
               DecodeDate(DateTimePicker2.Date,A,M,D);
               FFin := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
               dm.Qco_his.SQL.Add('AND');
               dm.Qco_his.SQL.Add('fcap BETWEEN '+QuotedStr(Fini) + ' AND ' + QuotedStr(FFin));
             end;
       end;

       if CheckBox2.Checked then
       begin
           if ( (Edit3.Text = ''  ) and ((Edit2.Text <> '')) ) then
           begin
              dm.Qco_his.SQL.Add('AND');
              dm.Qco_his.SQL.Add('id = '+ (Edit2.Text) +'');
             end;
             ///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
             if ((Edit2.Text <> Edit3.Text) and (Edit2.Text <> '') and (Edit3.Text<>'') ) then
             begin
               dm.Qco_his.SQL.Add('AND');
               dm.Qco_his.SQL.Add('id BETWEEN '+ QuotedStr(EDit2.Text) + ' AND ' + QuotedStr(Edit3.Text));
             end;
       end;
         if NOT RadioButton7.Checked then
            BEGIN

               if RadioButton4.Checked then
               begin
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('tramite = "0"');
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('ESTATUS = "0"');
               end;
               if RadioButton5.Checked then
               begin
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('tramite = "1"');
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('ESTATUS = "1"');
               end;
               if RadioButton6.Checked then
               begin
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('tramite = "1"');
                 dm.Qco_his.SQL.Add('AND');
                 dm.Qco_his.SQL.Add('ESTATUS = "0"');
               end;
            END;
{------------------------------------------------------------------------------}
         if ((Edit4.Text  <> '') )then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('nofi LIKE "%'+Edit4.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - turno'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('tur_nom LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - turno'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('tur_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - turno'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('tur_deporg LIKE "%'+Edit1.Text+'%"');////////////////////////////
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Nombre - remite'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('rem_nombre LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Cargo - remite'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('rem_cargo LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Dependencia u Organismo - remite'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('rem_deporg LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Descripción'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('des LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Edit1.Text  <> '') and (Combobox1.Text = 'Seguimiento'))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('seguimiento LIKE "%'+Edit1.Text+'%"');
         end;
{------------------------------------------------------------------------------}
         if ((Combobox2.Text <> ''))then
         begin
           dm.Qco_his.SQL.Add('AND');
         if ((Combobox2.Text = 'Todas'))then
           dm.Qco_his.SQL.Add('ncor LIKE "%%"')
           else
           dm.Qco_his.SQL.Add('ncor LIKE "%'+ ComboBox2.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox3.Text <> ''))then
         begin
           dm.Qco_his.SQL.Add('AND');
         if ((Combobox3.Text = 'Todas'))then
           dm.Qco_his.SQL.Add('tcor LIKE "%%"')
           else
           dm.Qco_his.SQL.Add('tcor LIKE "%'+ ComboBox3.Text +'%"');
         end;
//------------------------------------------------------------------------------
         if ((Combobox4.Text <> ''))then
         begin
           dm.Qco_his.SQL.Add('AND');
           dm.Qco_his.SQL.Add('ccor LIKE "%'+ ComboBox4.Text +'%"');
         end;
        dm.Qco_his.SQL.add('ORDER BY  CO_hist.id');
//        Memo1.Text := dm.Qco_his.sQL.Text;
       dm.Qco_his.Open;
       dm.Qco_his.Last;
       Queryimp;
       Memo1.Text := dm.Qco_his.SQL.Text;
   end; // fin de la validacion
end;


procedure TFRG_historico.RadioButton1Click(Sender: TObject);
begin
query(true);
end;

procedure TFRG_historico.RadioButton2Click(Sender: TObject);
begin
query(true);
end;

procedure TFRG_historico.RadioButton3Click(Sender: TObject);
begin
query(true);
end;

procedure TFRG_historico.RadioButton4Click(Sender: TObject);
begin
query(true);
end;

procedure TFRG_historico.RadioButton5Click(Sender: TObject);
begin
query(true);
end;

procedure TFRG_historico.RadioButton6Click(Sender: TObject);
begin
query(true);
end;

//-----------------------------------

Procedure TFRG_historico.Queryimp;

var
    FIni, FFin  :String;
    A,M,D : Word;
    va, vb,vc,vd : integer;
begin
if dm.MyConnection1.Connected then
   begin
       dm.QImpresion.Close;
       dm.QImpresion.SQL.Clear;
       dm.QImpresion.SQL.LoadFromFile(fmain.ruta+'sql\cohist\'+'cohist1.sql');
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
       dm.QImpresion.SQL.add('ORDER BY  CO_hist.id');
       dm.QImpresion.Open;
       dm.QImpresion.Last;
   end;
end;


end.
