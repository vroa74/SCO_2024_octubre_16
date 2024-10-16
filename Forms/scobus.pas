unit scobus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TFscobus = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fscobus: TFscobus;

implementation
uses login, main, d_m, scoedi;

{$R *.dfm}
//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------

procedure TFscobus.DBGrid1DblClick(Sender: TObject);
var
  id : integer;
  f : TFscoedi;
begin
   if dm.MyConnection1.Connected then
     begin
        id := dm.QCO.FieldByName('folio').AsInteger;
        dm.TCO.Filtered := false;
        dm.TCO.Filter := 'ID = '+inttostr(id)+'' ;
        dm.TCO.Filtered := true;
        f :=  TFscoedi.Create(Application);
        try
          f.ShowModal;
        finally
          f.Free;
          dm.TCO.Filtered := false;
          dm.TCO.Refresh;
          dm.QCO.Refresh;
          dm.TCO.Last;
          dm.QCO.Last;
        end;
     end;
end;

procedure TFscobus.FormCreate(Sender: TObject);
begin
   Fscobus.DBGrid1.ReadOnly := true;
if dm.MyConnection1.Connected then
   begin
       dm.QCO.Close;
       dm.QCO.SQL.Clear;
       dm.QCO.SQL.LoadFromFile(fmain.ruta+'co.sql');
       dm.QCO.SQL.add('ORDER BY  CO.id');
       dm.QCO.Open;

       dm.QCOH.Close;
       dm.QCOH.SQL.Clear;
       dm.QCOH.SQL.LoadFromFile(fmain.ruta+'co.sql');
       dm.QCOH.SQL.add('ORDER BY  CO.id');
       dm.QCOH.Open;

   end;

end;

end.
