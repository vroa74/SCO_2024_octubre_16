unit sco_bus_gru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses login, d_m, scoage_alta, scoage_edi, scoage_bus, scoalta, scoedi, scobus, scoconsultas, about, rg, SEGUIMIENTO, Archivo, SArchivo, sco_cat_grupo, SCOALTAGRUPO, sco_ins_gru ;

{$R *.dfm}

end.
