//------------------------------------------------------------------------------
//
// Este sistema fue desarrollado por Víctor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------
unit RG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, ComCtrls, JvExExtCtrls,
  JvExtComponent, JvRollOut, ppCtrls, ppDB, ppBands, ppPrnabl, ppClass, ppCache,
  ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, jpeg, ppStrtch,
  ppMemo, Buttons, DBCtrls, JvComponentBase, JvgExportComponents,
  JvDBGridExport, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompObject, IWCompFlash, Data.DB, ppDesignLayer, QExport4Dialog,
  QExport4, QExport4XLS, CRGrid, JvExDBGrids, JvDBGrid, Clipbrd, System.UITypes, QExport4ASCII, QExport4SQL, QExport4XML, QExport4HTML, ImagenesReportes;

type
  TFrg = class(TForm)
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
    BitBtn6: TBitBtn;
    StatusBar1: TStatusBar;
    DBNavigator1: TDBNavigator;
    QExport4Dialog1: TQExport4Dialog;
    Timer1: TTimer;
    CRDBGrid1: TCRDBGrid;
    Panel2: TPanel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;

    procedure Query(axx: Boolean);
    procedure Querypriint;
    procedure Queryimp;

    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExportarUTF8(Sender: TQExport4);
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
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CRDBGrid1CellClick(Column: TColumn);
    procedure CRDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2MouseLeave(Sender: TObject);
    procedure BitBtn2MouseEnter(Sender: TObject);
    procedure CRDBGrid1DblClick(Sender: TObject);

  private
    FTimerConsulta: TTimer;
    FInicializando: Boolean;
    FConsultando: Boolean;
    FConsultaInicial: Boolean;
    procedure MostrarReporte(Sender: TObject);
    procedure AgendarConsulta;
    procedure EjecutarConsultaPendiente(Sender: TObject);
    procedure OcultarReporte(Sender: TObject);
    function ValidarYObtenerRutaArchivo(const RutaRelativa: string): string;
    procedure AplicarFiltrosSQL(SQLList: TStrings);
  public
    clave: Integer;
    mango: THintWindow;
    myway: string;
    Forma: String;
    procedure PrepararApertura(const AOrigem: string);
  end;

var
  Frg: TFrg;

implementation

uses main, d_m, login, rg_1;

{$R *.dfm}

{------------------------------------------------------------------------------}
{ Función auxiliar privada para validar existencia de archivos externos       }
{------------------------------------------------------------------------------}
function TFrg.ValidarYObtenerRutaArchivo(const RutaRelativa: string): string;
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

{------------------------------------------------------------------------------}
{ Lógica centralizada para aplicar filtros comunes (Elimina duplicidad DRY)    }
{------------------------------------------------------------------------------}
procedure TFrg.AplicarFiltrosSQL(SQLList: TStrings);
var
  FIni, FFin: String;
  A, M, D: Word;
begin
  // Filtro por Fechas
  if CheckBox1.Checked then
  begin
    if (DateTimePicker1.Date = DateTimePicker2.Date) then
    begin
      DecodeDate(DateTimePicker1.Date, A, M, D);
      FIni := IntToStr(A) + '/' + IntToStr(M) + '/' + IntToStr(D);
      SQLList.Add('AND');
      SQLList.Add('fcap = ' + QuotedStr(FIni) + '');
    end
    else
    begin
      DecodeDate(DateTimePicker1.Date, A, M, D);
      FIni := IntToStr(A) + '/' + IntToStr(M) + '/' + IntToStr(D);
      DecodeDate(DateTimePicker2.Date, A, M, D);
      FFin := IntToStr(A) + '/' + IntToStr(M) + '/' + IntToStr(D);
      SQLList.Add('AND');
      SQLList.Add('fcap BETWEEN ' + QuotedStr(FIni) + ' AND ' + QuotedStr(FFin));
    end;
  end;

  // Filtro por Rangos de ID
  if CheckBox2.Checked then
  begin
    if ((Edit3.Text = '') and (Edit2.Text <> '')) then
    begin
      SQLList.Add('AND');
      SQLList.Add('id = ' + Edit2.Text + '');
    end
    else if ((Edit2.Text <> Edit3.Text) and (Edit2.Text <> '') and (Edit3.Text <> '')) then
    begin
      SQLList.Add('AND');
      SQLList.Add('id BETWEEN ' + QuotedStr(Edit2.Text) + ' AND ' + QuotedStr(Edit3.Text));
    end;
  end;

  // Filtros por RadioButtons de Trámite y Estatus
  if not RadioButton7.Checked then
  begin
    if RadioButton4.Checked then
    begin
      SQLList.Add('AND');
      SQLList.Add('tramite = "0"');
      SQLList.Add('AND');
      SQLList.Add('ESTATUS = "0"');
    end
    else if RadioButton5.Checked then
    begin
      SQLList.Add('AND');
      SQLList.Add('tramite = "1"');
      SQLList.Add('AND');
      SQLList.Add('ESTATUS = "1"');
    end
    else if RadioButton6.Checked then
    begin
      SQLList.Add('AND');
      SQLList.Add('tramite = "1"');
      SQLList.Add('AND');
      SQLList.Add('ESTATUS = "0"');
    end;
  end;

  // Filtro por Número de Oficio
  if (Edit4.Text <> '') then
  begin
    SQLList.Add('AND');
    SQLList.Add('nofi LIKE "%' + Edit4.Text + '%"');
  end;

  // Filtros dinámicos según Combo de Campos
  if (Edit1.Text <> '') then
  begin
    if (ComboBox1.Text = 'Nombre - turno') or (ComboBox1.Text = 'Nombre - remite') then
    begin
      SQLList.Add('AND');
      SQLList.Add('tur_nom LIKE "%' + Edit1.Text + '%"');
    end
    else if (ComboBox1.Text = 'Cargo - turno') then
    begin
      SQLList.Add('AND');
      SQLList.Add('tur_cargo LIKE "%' + Edit1.Text + '%"');
    end
    else if (ComboBox1.Text = 'Dependencia u Organismo - turno') then
    begin
      SQLList.Add('AND');
      SQLList.Add('tur_deporg LIKE "%' + Edit1.Text + '%"');
    end
    else if (ComboBox1.Text = 'Cargo - remite') then
    begin
      SQLList.Add('AND');
      SQLList.Add('rem_nombre LIKE "%' + Edit1.Text + '%"');
    end
    else if (ComboBox1.Text = 'Dependencia u Organismo - remite') then
    begin
      SQLList.Add('AND');
      SQLList.Add('rem_cargo LIKE "%' + Edit1.Text + '%"');
    end
    else if (ComboBox1.Text = 'Descripción') then
    begin
      SQLList.Add('AND');
      SQLList.Add('des LIKE "%' + Edit1.Text + '%"');
    end
    else if (ComboBox1.Text = 'Seguimiento') then
    begin
      SQLList.Add('AND');
      SQLList.Add('seguimiento LIKE "%' + Edit1.Text + '%"');
    end;
  end;

  // Filtros de Combobox de Niveles y Tipos
  if (ComboBox2.Text <> '') then
  begin
    SQLList.Add('AND');
    if (ComboBox2.Text = 'Todas') then
      SQLList.Add('ncor LIKE "%%"')
    else
      SQLList.Add('ncor LIKE "%' + ComboBox2.Text + '%"');
  end;

  if (ComboBox3.Text <> '') then
  begin
    SQLList.Add('AND');
    if (ComboBox3.Text = 'Todas') then
      SQLList.Add('tcor LIKE "%%"')
    else
      SQLList.Add('tcor LIKE "%' + ComboBox3.Text + '%"');
  end;

  if (ComboBox4.Text <> '') then
  begin
    SQLList.Add('AND');
    SQLList.Add('ccor LIKE "%' + ComboBox4.Text + '%"');
  end;

  SQLList.Add('ORDER BY CO.id');
end;

{------------------------------------------------------------------------------}
{ Procedimiento de copia a histórico                                           }
{------------------------------------------------------------------------------}
procedure CopyAndDeleteRecords;
begin
  dm.QCO.First;
  while not dm.QCO.Eof do
  begin
    dm.Qco_his.Insert;
    dm.QCO_His.FieldByName('id').AsInteger := dm.QCO.FieldByName('folio').AsInteger;
    dm.QCO_His.FieldByName('fcap').AsDateTime := dm.QCO.FieldByName('Fecha de captura').AsDateTime;
    dm.QCO_His.FieldByName('frec').AsDateTime := dm.QCO.FieldByName('Fecha de recepción').AsDateTime;
    dm.QCO_His.FieldByName('ncor').AsString := dm.QCO.FieldByName('Nivel de correspondencia').AsString;
    dm.QCO_His.FieldByName('tcor').AsString := dm.QCO.FieldByName('Tipo de correspondencia').AsString;
    dm.QCO_His.FieldByName('ccor').AsString := dm.QCO.FieldByName('Tipo de correspondencia').AsString;
    dm.QCO_His.FieldByName('fofi').AsDateTime := dm.QCO.FieldByName('Fecha de oficio').AsDateTime;
    dm.QCO_His.FieldByName('nofi').AsString := dm.QCO.FieldByName('Numero de Oficio').AsString;
    dm.QCO_His.FieldByName('nhoj').AsInteger := dm.QCO.FieldByName('Numero de hojas').AsInteger;
    dm.QCO_His.FieldByName('rem_nombre').AsString := dm.QCO.FieldByName('Nombre del remitente').AsString;
    dm.QCO_His.FieldByName('rem_cargo').AsString := dm.QCO.FieldByName('cargo del remitente').AsString;
    dm.QCO_His.FieldByName('rem_deporg').AsString := dm.QCO.FieldByName('Depto. U org. Del remitente').AsString;
    dm.QCO_His.FieldByName('rem_dir').AsString := dm.QCO.FieldByName('Dirección del Remitente').AsString;
    dm.QCO_His.FieldByName('des').AsString := dm.QCO.FieldByName('Descripcion de Oficio').AsString;
    dm.QCO_His.FieldByName('seguimiento').AsString := dm.QCO.FieldByName('Seguimiento').AsString;
    dm.QCO_His.FieldByName('tur_nom').AsString := dm.QCO.FieldByName('Nombre turnado').AsString;
    dm.QCO_His.FieldByName('tur_cargo').AsString := dm.QCO.FieldByName('Cargo turnado').AsString;
    dm.QCO_His.FieldByName('tur_deporg').AsString := dm.QCO.FieldByName('Depto. U organ. Del turnado').AsString;
    dm.QCO_His.FieldByName('modifico').AsString := dm.QCO.FieldByName('modifico').AsString;
    dm.QCO_His.FieldByName('tramite').AsBoolean := dm.QCO.FieldByName('Tramite').AsBoolean;
    dm.QCO_His.FieldByName('FIAT').AsDateTime := dm.QCO.FieldByName('Fecha Inicio tramite').AsDateTime;
    dm.QCO_His.FieldByName('Q_TRA').AsString := dm.QCO.FieldByName('Quien inicio el tramite').AsString;
    dm.QCO_His.FieldByName('estatus').AsBoolean := dm.QCO.FieldByName('concluido').AsBoolean;
    dm.QCO_His.FieldByName('FCAT').AsDateTime := dm.QCO.FieldByName('fecha de conclusión').AsDateTime;
    dm.QCO_His.FieldByName('Q_EST').AsString := dm.QCO.FieldByName('Quien lo concluyo').AsString;
    dm.QCO_His.FieldByName('archivo').AsBoolean := dm.QCO.FieldByName('Archivo').AsBoolean;
    dm.QCO_His.FieldByName('FAAT').AsDateTime := dm.QCO.FieldByName('Fecha de archivo').AsDateTime;
    dm.QCO_His.FieldByName('Q_ARC').AsString := dm.QCO.FieldByName('Quien Archivo').AsString;
    dm.QCO_His.Post;
    dm.QCO.Delete;
    Application.ProcessMessages;
  end;
end;

{------------------------------------------------------------------------------}
{ Eventos de Botones y Consultas                                               }
{------------------------------------------------------------------------------}
procedure TFrg.BitBtn1Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.BitBtn2Click(Sender: TObject);
begin
  Query(true);
  pplabel61.Caption := fmain.Ttitle;
  pplabel60.Caption := fmain.CopyRight;
  PrepararLogosImpresion(Self);
  Lista.Print;
end;

procedure TFrg.BitBtn2MouseEnter(Sender: TObject);
begin
  if Assigned(fmain) then
    mango := fmain.RevealHint(BitBtn2);
end;

procedure TFrg.BitBtn2MouseLeave(Sender: TObject);
begin
  if Assigned(fmain) and Assigned(mango) then
  begin
    fmain.RemoveHint(mango);
    mango := nil;
  end;
end;

procedure TFrg.BitBtn3Click(Sender: TObject);
begin
  if dm.MyConnection1.Connected then
  begin
    Query(false);
    if SaveDialog1.Execute then
    begin
      BitBtn1.Enabled := false;
      QExport4Dialog1.FileName := SaveDialog1.FileName;
      try
        QExport4Dialog1.Execute;
      except
        on E: Exception do
          ShowMessage('Ocurrió un error: ' + E.Message);
      end;
      BitBtn1.Enabled := true;
    end;
  end;
end;

procedure TFrg.BitBtn4Click(Sender: TObject);
begin
  // Impresión de volantes (reservado)
end;

procedure TFrg.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrg.BitBtn6Click(Sender: TObject);
var
  respuesta: Integer;
begin
  if not dm.Qco_his.Active then
    dm.Qco_his.Open;

  respuesta := MessageDlg('Todo lo que está a la vista pasará a formar parte del histórico. ¿Desea continuar?', mtWarning, [mbYes, mbNo], 0);
  if respuesta = mrYes then
  begin
    ShowMessage('Acción confirmada. Continuando con el proceso...');
    CopyAndDeleteRecords;
  end
  else
  begin
    ShowMessage('Acción cancelada.');
  end;
end;

procedure TFrg.CheckBox1Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.CheckBox2Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.ComboBox2Change(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.ComboBox3Change(Sender: TObject);
begin
  if FInicializando or (csLoading in ComponentState) then Exit;
  FInicializando := True;
  try

  if (ComboBox3.ItemIndex = 0) then
  begin
    ComboBox4.Items.Clear;
  end;
  if ComboBox3.ItemIndex = 1 then
  begin
    ComboBox4.Text := '';
    ComboBox4.Items.Clear;
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
    ComboBox4.Text := '';
    ComboBox4.Items.Clear;
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
    ComboBox4.Text := '';
    ComboBox4.Items.Clear;
    ComboBox4.Items.Add('Peticiones para gestión');
    ComboBox4.Items.Add('Solicitudes de información');
    ComboBox4.Items.Add('');
  end;


  finally
    FInicializando := False;
  end;
  Query(True);
end;

procedure TFrg.ComboBox4Change(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.CRDBGrid1CellClick(Column: TColumn);
var
  selectedText: string;
  selectedDate: string;
begin
  if (Column.Field.DataType = ftMemo) or (Column.Field.DataType = ftWideMemo) then
  begin
    selectedText := Column.Field.AsString;
    Clipboard.AsText := selectedText;
  end;

  if Column.Field.DataType = ftString then
  begin
    selectedText := Column.Field.AsString;
    Clipboard.AsText := selectedText;
  end;

  if (Column.Field.DataType = ftDate) or (Column.Field.DataType = ftDateTime) then
  begin
    selectedDate := DateToStr(Column.Field.AsDateTime);
    Clipboard.AsText := selectedDate;
  end;
end;

procedure TFrg.CRDBGrid1DblClick(Sender: TObject);
begin
  if (Forma = 'Alta') and dm.QCO.Active and not dm.QCO.IsEmpty then
  begin
    clave := DM.QCO.FieldByName('Folio').AsInteger;
    ModalResult := mrOk;
  end;
end;

procedure TFrg.CRDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    CRDBGrid1.Canvas.Brush.Color := clMoneyGreen;
  end
  else
  begin
    CRDBGrid1.Canvas.Brush.Color := clHighlight;
  end;
  CRDBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrg.DateTimePicker1Change(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.DateTimePicker2Change(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.DBGrid1CellClick(Column: TColumn);
begin
  frg_1.Show;
end;

procedure TFrg.DBGrid1DblClick(Sender: TObject);
begin
  if dm.MyConnection1.Connected then
  begin
    if not dm.QCO.Active or dm.QCO.IsEmpty then Exit;
    clave := dm.QCO.FieldByName('Folio').AsInteger;
    ModalResult := mrOk;
  end;
end;

procedure TFrg.Edit1Change(Sender: TObject);
begin
  AgendarConsulta;
end;

procedure TFrg.Edit2Change(Sender: TObject);
begin
  if CheckBox2.Checked then
    AgendarConsulta;
end;

procedure TFrg.Edit3Change(Sender: TObject);
begin
  if CheckBox2.Checked then
    AgendarConsulta;
end;

procedure TFrg.Edit4Change(Sender: TObject);
begin
  AgendarConsulta;
end;

procedure TFrg.ExportarUTF8(Sender: TQExport4);
begin
  // Solo los formatos de texto usan bytes UTF-8; XLS/PDF conservan su formato.
  if (Sender is TQExport4ASCII) or (Sender is TQExport4SQL) or
     (Sender is TQExport4XML) or (Sender is TQExport4HTML) then
    Sender.CharsetType := ectUTF8;
  if Sender is TQExport4XML then
    TQExport4XML(Sender).Options.Encoding := 'UTF-8';
end;

procedure TFrg.FormCreate(Sender: TObject);
begin
  FInicializando := True;
  Frg.Caption := 'SISTEMA DE GESTIÓN Y TRÁNSITO DOCUMENTAL (SGTD / Reporte General)';
  try
    Timer1.Enabled := False;
    FTimerConsulta := TTimer.Create(Self);
    FTimerConsulta.Enabled := False;
    FTimerConsulta.Interval := 300;
    FTimerConsulta.OnTimer := EjecutarConsultaPendiente;
    OnHide := OcultarReporte;
    OnShow := MostrarReporte;
    DateTimePicker1.Date := Date;
    DateTimePicker2.Date := Date;
    myway := 'sql\co\';
    BitBtn2.Hint := 'Ver e imprimir el listado de reporte que estan en el grid';
  finally
    FInicializando := False;
  end;
end;

procedure TFrg.PrepararApertura(const AOrigem: string);
begin
  FTimerConsulta.Enabled := False;
  Forma := AOrigem;
  clave := 0;
  ModalResult := mrNone;
  FConsultaInicial := True;
  dm.QCO.Close;
end;

procedure TFrg.MostrarReporte(Sender: TObject);
begin
  Timer1.Enabled := True;
  if FConsultaInicial then
  begin
    // Un timer se despacha despues de los mensajes de pintura de la ventana.
    FTimerConsulta.Interval := 1;
    FTimerConsulta.Enabled := True;
  end;
end;

procedure TFrg.AgendarConsulta;
begin
  if FInicializando or FConsultando or (csLoading in ComponentState) or
     not Visible then
    Exit;
  FTimerConsulta.Enabled := False;
  FTimerConsulta.Enabled := True;
end;

procedure TFrg.EjecutarConsultaPendiente(Sender: TObject);
begin
  FTimerConsulta.Enabled := False;
  FTimerConsulta.Interval := 300;
  if Visible then
    Query(True);
end;

procedure TFrg.OcultarReporte(Sender: TObject);
begin
  Timer1.Enabled := False;
  FTimerConsulta.Enabled := False;
end;

{------------------------------------------------------------------------------}
{ Métodos refactorizados de Consultas utilizando validación y método unificado }
{------------------------------------------------------------------------------}
procedure TFrg.Querypriint;
var
  ArchivoSql: string;
begin
  if dm.MyConnection1.Connected then
  begin
    try
      ArchivoSql := ValidarYObtenerRutaArchivo(myway + 'coh1.sql');
      dm.QCO.Close;
      dm.QCO.SQL.Clear;
      dm.QCO.SQL.LoadFromFile(ArchivoSql, TEncoding.UTF8);
      AplicarFiltrosSQL(dm.QCO.SQL);
      dm.QCO.Open;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  end;
end;

procedure TFrg.Query(axx: Boolean);
var
  ArchivoSql, RutaRelativa: string;
  Inicio: UInt64;
  ConsultaInicial: Boolean;
begin
  if FInicializando or FConsultando or (csLoading in ComponentState) or
     not dm.MyConnection1.Connected then
    Exit;
  FTimerConsulta.Enabled := False;
  FConsultando := True;
  ConsultaInicial := FConsultaInicial and axx;
  Inicio := GetTickCount64;
  try
    try
      if ConsultaInicial then
        RutaRelativa := 'sql\main\co.sql'
      else if axx then
        RutaRelativa := myway + 'co.sql'
      else
        RutaRelativa := myway + 'cox.sql';
      ArchivoSql := ValidarYObtenerRutaArchivo(RutaRelativa);
      dm.QCO.DisableControls;
      try
        dm.QCO.Close;
        dm.QCO.SQL.LoadFromFile(ArchivoSql, TEncoding.UTF8);
        if ConsultaInicial then
          dm.QCO.SQL.Add('ORDER BY CO.id')
        else
          AplicarFiltrosSQL(dm.QCO.SQL);
        dm.QCO.Open;
        FConsultaInicial := False;
        // La impresion de Lista usa QCO, no QImpresion.
      finally
        dm.QCO.EnableControls;
      end;
      Memo1.Text := dm.QCO.SQL.Text;
      Memo1.Lines.Add('');
      Memo1.Lines.Add(ArchivoSql);
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  finally
    FConsultando := False;
    OutputDebugString(PChar('Reportes - consulta de filtros: ' +
      IntToStr(Int64(GetTickCount64 - Inicio)) + ' ms'));
  end;
end;

procedure TFrg.Queryimp;
var
  ArchivoSql: string;
begin
  if dm.MyConnection1.Connected then
  begin
    try
      ArchivoSql := ValidarYObtenerRutaArchivo(myway + 'coh1.sql');
      dm.QImpresion.Close;
      dm.QImpresion.SQL.Clear;
      dm.QImpresion.SQL.LoadFromFile(ArchivoSql, TEncoding.UTF8);
      AplicarFiltrosSQL(dm.QImpresion.SQL);
      dm.QImpresion.Open;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  end;
end;

procedure TFrg.RadioButton1Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.RadioButton2Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.RadioButton3Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.RadioButton4Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.RadioButton5Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.RadioButton6Click(Sender: TObject);
begin
  Query(true);
end;

procedure TFrg.Timer1Timer(Sender: TObject);
begin
  if Assigned(fmain) then
  begin
    StatusBar1.Panels[2].Text := fmain.PutDate;
    StatusBar1.Panels[3].Text := fmain.PutTime;
  end;
end;

end.
