unit SArchivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ppDB, ppParameter, ppBands, ppCtrls, jpeg,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe,
  StdCtrls, DBCtrls, ComCtrls, JvExExtCtrls, JvExtComponent, JvRollOut;

type
  TFSArchivo = class(TForm)
    DBGrid1: TDBGrid;
    ppDBPipeline1: TppDBPipeline;
    Lista: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine3: TppLine;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppImage2: TppImage;
    ppDetailBand2: TppDetailBand;
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
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
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
    ppLabel1: TppLabel;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppDBText16: TppDBText;
    ppLabel21: TppLabel;
    ppDBText17: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppParameterList1: TppParameterList;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    Panel1: TPanel;
    Button1: TButton;
    JvRollOut1: TJvRollOut;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    JvRollOut2: TJvRollOut;
    Edit1: TEdit;
    Memo1: TMemo;
    ppLine5: TppLine;
    ComboBox1: TComboBox;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLine6: TppLine;
    Procedure Query;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSArchivo: TFSArchivo;

implementation
uses main, d_m, Login;

{$R *.dfm}

procedure TFSArchivo.CheckBox1Click(Sender: TObject);
begin
Query
end;

procedure TFSArchivo.DateTimePicker1Change(Sender: TObject);
begin
    Query;
end;

procedure TFSArchivo.DateTimePicker2Change(Sender: TObject);
begin
    Query;
end;

procedure TFSArchivo.Edit1Change(Sender: TObject);
begin
    Query;
end;


//------------------------------------------------------------------------------
//----------------------         QUERY        ----------------------------------
//------------------------------------------------------------------------------

Procedure TFSArchivo.Query;
var
    FIni, FFin  :String;
    A,M,D : Word;
    va, vb,vc,vd : integer;
begin
if dm.MyConnection1.Connected then
   begin
       dm.QCOH.Close;
       dm.QCOH.SQL.Clear;
       dm.QCOH.SQL.LoadFromFile(fmain.ruta+'coh.sql');
//------------------------------------------------------------------------------
       if CheckBox1.Checked then
       begin
       if (DateTimePicker1.Date = DateTimePicker2.Date) then
       begin
          DecodeDate(DateTimePicker1.Date,A,M,D);
          FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
          dm.QCOH.SQL.Add('AND');
          dm.QCOH.SQL.Add('fcap = '+ QuotedStr(fini) +'');
         end;
///-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
         if (DateTimePicker1.Date <> DateTimePicker2.Date) then
         begin
           DecodeDate(DateTimePicker1.Date,A,M,D);
           FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
           DecodeDate(DateTimePicker2.Date,A,M,D);
           FFin := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add('fcap BETWEEN '+QuotedStr(Fini) + ' AND ' + QuotedStr(FFin));
         end;
       end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 0) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('id LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 1) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('ncor LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 2) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('tcor LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 3) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('ccor LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 4) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('nofi LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 5) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('nhoj LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 6) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('rem_nombre LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 7) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('rem_cargo LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 8) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('rem_deporg LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 9) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('tur_nom LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 10) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('tur_cargo LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
         if ((ComboBox1.ItemIndex = 11) and (Edit1.Text <> '')) then
         begin
           dm.QCOH.SQL.Add('AND');
           dm.QCOH.SQL.Add ('tur_deporg LIKE "%'+Edit1.Text+'%"');
         end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
       dm.QCOH.Open;
       dm.QCOH.Last;
       Memo1.Text := dm.QCOH.SQL.Text;
   end; // fin de la validacion
end;


procedure TFSArchivo.RadioButton4Click(Sender: TObject);
begin
   Query;
end;

procedure TFSArchivo.RadioButton5Click(Sender: TObject);
begin
   Query;
end;

procedure TFSArchivo.RadioButton6Click(Sender: TObject);
begin
    Query;
end;
      //------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------

procedure TFSArchivo.Button1Click(Sender: TObject);
begin
   Lista.Print;
end;

end.
