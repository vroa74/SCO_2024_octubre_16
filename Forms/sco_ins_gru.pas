unit sco_ins_gru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TFsco_ins_gru = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CLAVE: INTEGER;
    grup:string;
  end;

var
  Fsco_ins_gru: TFsco_ins_gru;

implementation
uses login, d_m, scoage_alta, scoage_edi, scoage_bus, scoalta, scoedi, scobus, scoconsultas, about, rg, SEGUIMIENTO, Archivo, SArchivo, sco_cat_grupo, SCOALTAGRUPO, sco_bus_gru ;

{$R *.dfm}

procedure TFsco_ins_gru.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFsco_ins_gru.DBGrid1DblClick(Sender: TObject);
begin // con doble click
 if DM.MyConnection1.Connected then
    BEGIN
       Fsco_ins_gru.CLAVE := DM.QCAT_GRU.FieldByName('ID_GRUPO').AsInteger;
       Fsco_ins_gru.grup := DM.QCAT_GRU.FieldByName('grupo').AsString;

       grup := Fsco_ins_gru.grup;
       CLAVE := Fsco_ins_gru.CLAVE;

       close;
    END;

end;

end.
