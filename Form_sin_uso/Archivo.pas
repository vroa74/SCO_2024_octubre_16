unit Archivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Data.DB;

type
  TFArchivo = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure forma;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FArchivo: TFArchivo;

implementation
uses login, main, d_m;

{$R *.dfm}

procedure TFArchivo.forma;
var
f1,f2,f3: integer;
begin
f1:= farchivo.Width;
f2 := (f1 div 2);
f3 := f2+1;
Dbgrid1.Width := f2;
Dbgrid2.Left := f3;


end;

procedure TFArchivo.DBGrid1DblClick(Sender: TObject);
begin
if dm.MyConnection1.Connected then
   begin
     if ((dm.QCO.FieldByName('Tramite').AsBoolean )and (dm.QCO.FieldByName('concluido').AsBoolean))then
     begin
       dm.QCO.Edit;
       dm.QCO.FieldByName('Archivo').AsBoolean := true;
       dm.QCO.FieldByName('Fecha de archivo').AsDateTime :=  StrToDate(fmain.PutDate);
       dm.QCO.FieldByName('Quien Archivo').AsString := dm.MyConnection1.Username;
       dm.QCO.Post;
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
       dm.QCO.Open;
       dm.QCOH.Close;
       dm.QCOH.SQL.Clear;
       dm.QCOH.SQL.LoadFromFile(fmain.ruta+'coh.sql');
       dm.QCOH.Open;
     end else begin
      ShowMessage('Disculpe las molestias no se puede archivar ya que el presente asunto aún no ha sido concluido, Se recomienda concluir el presente para archivar.');
     end;
//     ShowMessage('Hola');
   end;
end;

procedure TFArchivo.DBGrid2DblClick(Sender: TObject);
begin
if dm.MyConnection1.Connected then
   begin
     dm.QCOH.Edit;
     dm.QCOH.FieldByName('Archivo').AsBoolean := FALSE;
     dm.QCOH.FieldByName('Fecha de archivo').AsDateTime :=  StrToDate(fmain.PutDate);
     dm.QCOH.FieldByName('Quien Archivo').AsString := dm.MyConnection1.Username;
     dm.QCOH.Post;

     dm.QCO.Close;
     dm.QCO.SQL.Clear;
     dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
     dm.QCO.Open;

     dm.QCOH.Close;
     dm.QCOH.SQL.Clear;
     dm.QCOH.SQL.LoadFromFile(fmain.ruta+'coh.sql');
     dm.QCOH.Open;

   end;


end;

procedure TFArchivo.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
forma;
end;

procedure TFArchivo.FormCreate(Sender: TObject);
begin  // create
forma;
if dm.MyConnection1.Connected then
   begin
    {   dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
       dm.QCO.Open;  }
   end;

if dm.MyConnection1.Connected then
   begin
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
       dm.QCO.Open;

       dm.QCOH.Close;
       dm.QCOH.SQL.Clear;
       dm.QCOH.SQL.LoadFromFile(fmain.ruta+'coh.sql');
       dm.QCOH.Open;
   end; //--------------------------------------
end;

procedure TFArchivo.FormResize(Sender: TObject);
begin
forma;
end;

end.

