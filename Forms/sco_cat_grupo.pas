unit sco_cat_grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DBAdvGlowNavigator, Data.DB;

type
  TFcat_gru = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBAdvGlowNavigator1: TDBAdvGlowNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcat_gru: TFcat_gru;

implementation
uses main, d_m;

{$R *.dfm}

procedure TFcat_gru.FormCreate(Sender: TObject);
begin
if dm.MyConnection1.Connected then
   begin
     dm.QCAT_GRU.Close;
     dm.QCAT_GRU.SQL.Clear;
     dm.QCAT_GRU.SQL.Add('SELECT * FROM  cat_gru');
     dm.QCAT_GRU.SQL.Add('ORDER BY  cat_gru.id_grupo');
     dm.QCAT_GRU.Open;
   end;
end;

end.

