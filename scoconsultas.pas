unit scoconsultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, JvExExtCtrls, JvBevel, StdCtrls, ComCtrls,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppDBBDE, ppDB, ppDBPipe, ppStrtch, ppMemo, ppParameter, jpeg;

type
  TFSCOconsultas = class(TForm)
    DBGrid1: TDBGrid;
    Rnormal: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppImage1: TppImage;
    ppDetailBand1: TppDetailBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape1: TppShape;
    ppLabel15: TppLabel;
    ppShape2: TppShape;
    ppLabel16: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline1: TppDBPipeline;
    Rpetsol: TppReport;
    Respecial: TppReport;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText6: TppDBText;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppImage2: TppImage;
    ppDetailBand2: TppDetailBand;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppFooterBand2: TppFooterBand;
    ppDBText3: TppDBText;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText10: TppDBText;
    ppLine5: TppLine;
    ppDBMemo3: TppDBMemo;
    ppLabel33: TppLabel;
    ppMemo1: TppMemo;
    ppParameterList2: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppImage3: TppImage;
    ppLine8: TppLine;
    ppDetailBand3: TppDetailBand;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppDBText25: TppDBText;
    ppLabel47: TppLabel;
    ppDBMemo5: TppDBMemo;
    ppLabel48: TppLabel;
    ppDBText20: TppDBText;
    ppMemo2: TppMemo;
    ppLabel49: TppLabel;
    ppShape3: TppShape;
    ppLabel31: TppLabel;
    ppShape4: TppShape;
    ppLabel53: TppLabel;
    ppShape5: TppShape;
    ppLabel51: TppLabel;
    ppShape6: TppShape;
    ppLabel54: TppLabel;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppLabel52: TppLabel;
    ppLine2: TppLine;
    ppLine11: TppLine;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppLine9: TppLine;
    ppDBText7: TppDBText;
    ppDBText26: TppDBText;
    ppDBText17: TppDBText;
    ppDBText27: TppDBText;
    ppDBText8: TppDBText;
    ppDBText28: TppDBText;
    ppLabel55: TppLabel;
    ppDBText29: TppDBText;
    ppLabel50: TppLabel;
    ppDBText16: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel56: TppLabel;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLabel57: TppLabel;
    ppDBMemo6: TppDBMemo;
    ppLabel58: TppLabel;
    ppLabel35: TppLabel;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Procedure Query;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DateTimePicker1hange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSCOconsultas: TFSCOconsultas;

implementation
uses d_m, main, scoage_bus;

{$R *.dfm}

Procedure TFSCOconsultas.Query;
begin
if dm.MyConnection1.Connected then
   begin
     dm.QCO.Close;
     dm.QCO.SQL.Clear;
     dm.QCO.SQL.Add('SELECT * From co ');
//     dm.QCO.SQL.Add('WHERE');
   end;  // validacion myconecction.
end;

procedure TFSCOconsultas.CheckBox1Click(Sender: TObject);
begin
Query;
end;

procedure TFSCOconsultas.DateTimePicker1hange(Sender: TObject);
var
    FIni, FFin  :String;
    A,M,D : Word;
begin
Edit1.Text := '';
Edit2.Text := '';
if checkbox1.Checked then
begin
   if dm.MyConnection1.Connected then
   begin
     dm.QCO.Close;
     dm.QCO.SQL.Clear;
     dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
     dm.QCO.SQL.Add('and');
     DecodeDate(DateTimePicker1.Date,A,M,D);
     FIni := IntToStr(A) + '/' + IntToStr(M)+ '/' + IntToStr(D);
     dm.QCO.SQL.Add('fcap = '+ QuotedStr(fini) +'');
     dm.QCO.SQL.Add('ORDER BY');
     dm.QCO.SQL.Add('co.id');
     dm.QCO.Open;
     dm.QCO.Last;
   end;  // validacion myconecction.
 end else
 begin
     dm.QCO.Close;
     dm.QCO.SQL.Clear;
     dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
     dm.QCO.SQL.Add('ORDER BY');
     dm.QCO.SQL.Add('co.id');
     dm.QCO.Open;
     dm.QCO.Last;
 end;

end;

//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------


procedure TFSCOconsultas.DBGrid1DblClick(Sender: TObject);
var idd:integer;
    i :integer;
begin // doble click.......
i:=0;
if dm.MyConnection1.Connected then
begin
    idd := dm.QCO.FieldByName('folio').AsInteger;
    dm.TCO.Filtered := false;
    dm.TCO.Filter := 'id = '+inttostr(idd)+'' ;
    dm.TCO.Filtered := true;
    ppImage1.Picture.LoadFromFile(fmain.ruta+'LXI.jpg');
    if RadioButton1.Checked then
       begin
       Rnormal.Print;
       dm.TCO.Edit;
       dm.TCO.FieldByName('tramite').AsBoolean := true;
       dm.TCO.FieldByName('FIAT').AsDateTime := StrToDate(fmain.PutDate);
       dm.tco.FieldByName('Q_tra').AsString := dm.MyConnection1.Username;
       dm.TCO.Post;
       i:=i+1;
       end;
    if RadioButton2.Checked then
       begin
       Respecial.Print;
       dm.TCO.Edit;
       dm.TCO.FieldByName('tramite').AsBoolean := true;
       dm.TCO.FieldByName('FIAT').AsDateTime := StrToDate(fmain.PutDate);
       dm.tco.FieldByName('Q_tra').AsString := dm.MyConnection1.Username;
       dm.TCO.Post;
       i:=i+1;
       end;
    if RadioButton3.Checked then
       begin
       Rpetsol.Print;
       dm.TCO.Edit;
       dm.TCO.FieldByName('tramite').AsBoolean := true;
       dm.TCO.FieldByName('FIAT').AsDateTime := StrToDate(fmain.PutDate);
       dm.tco.FieldByName('Q_tra').AsString := dm.MyConnection1.Username;
       dm.TCO.Post;
       i:=i+1;
       end;
    if i = 0 then
    ShowMessage('Selecciones Algun Tipo de Reporte ...');
    dm.TCO.Filtered := false;
    dm.TCO.Refresh;
    dm.QCO.Close;
    dm.QCO.SQL.Clear;
    dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
    dm.QCO.SQL.Add('ORDER BY');
    dm.QCO.SQL.Add('co.id');
    dm.QCO.Open;
    dm.QCO.Last;
//    dm.QCO.Last;
end;

end;

procedure TFSCOconsultas.Edit1Change(Sender: TObject);
begin
Edit2.Text := '';
DateTimePicker1.Date  := StrToDate(fmain.PutDate);
if dm.MyConnection1.Connected then
   begin
     dm.QCO.Close;
     dm.QCO.SQL.Clear;
     dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
     dm.QCO.SQL.Add('and');
     dm.QCO.SQL.Add('id LIKE "%'+Edit1.Text+'%"');
     dm.QCO.SQL.add('ORDER BY  CO.id');
     dm.QCO.Open;
     dm.QCO.Last;
   end;  // validacion myconecction.

end;

procedure TFSCOconsultas.Edit2Change(Sender: TObject);
begin
Edit1.Text := '';
DateTimePicker1.Date  := StrToDate(fmain.PutDate);
if dm.MyConnection1.Connected then
   begin
     dm.QCO.Close;
     dm.QCO.SQL.Clear;
     dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
     dm.QCO.SQL.Add('and');
     dm.QCO.SQL.Add('rem_nombre LIKE "%'+Edit2.Text+'%"');
     dm.QCO.SQL.add('ORDER BY  CO.id');
     dm.QCO.Open;
     dm.QCO.Last;
   end;  // validacion myconecction.

end;

procedure TFSCOconsultas.FormCreate(Sender: TObject);
begin   //
   DateTimePicker1.Date := StrToDate(fmain.PutDate);
end;

end.
