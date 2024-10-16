unit sco_alta_gru_per;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,
  DBAdvGlowNavigator, JvExExtCtrls, JvExtComponent, JvRollOut;

type
  TFsco_alta_gru_per = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBAdvGlowNavigator1: TDBAdvGlowNavigator;
    add: TBitBtn;
    del: TBitBtn;
    cancel: TBitBtn;
    post: TBitBtn;
    salir: TBitBtn;
    ins: TBitBtn;
    DBText1: TDBText;
    Memo1: TMemo;
    Memo2: TMemo;
    JvRollOut1: TJvRollOut;
    DBGrid2: TDBGrid;
    JvRollOut2: TJvRollOut;
    DBGrid1: TDBGrid;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Procedure ValBotton(i:integer);
   Procedure ag_gru;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBAdvGlowNavigator1Click(Sender: TObject;
      Button: TAdvNavigateBtn);
    procedure insClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure postClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure salirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CLAVE: INTEGER;
    grup:string;
    grupo, aux, coh : string;
    left:integer;
  end;

var
  Fsco_alta_gru_per: TFsco_alta_gru_per;

implementation
uses login, d_m, scoage_alta, scoage_edi, scoage_bus, scoalta, scoedi, scobus, scoconsultas, about, rg, SEGUIMIENTO, Archivo, SArchivo, sco_cat_grupo, SCOALTAGRUPO, sco_bus_gru, main ;

{$R *.dfm}

Procedure TFsco_alta_gru_per.ValBotton(i:integer);
Begin

   if i = 1 then // inicialización
     begin
       DBAdvGlowNavigator1.Enabled := true;
       ins.Enabled := true;
       add.Enabled := false;
       del.Enabled := false;
       post.Enabled := false;
       cancel.Enabled := false;
       salir.Enabled := true;
     end;
   if i = 2 then // ins
     begin
       DBAdvGlowNavigator1.Enabled := false;
       ins.Enabled := false;
       add.Enabled := true;
       del.Enabled := true;
       post.Enabled := true;
       cancel.Enabled := true;
       salir.Enabled := false;
     end;
   if i = 3 then
     begin
       DBAdvGlowNavigator1.Enabled := true;
       ins.Enabled := true;
       add.Enabled := false;
       del.Enabled := false;
       post.Enabled := false;
       cancel.Enabled := false;
       salir.Enabled := true;
     end;
   if i = 4 then
     begin
       DBAdvGlowNavigator1.Enabled := true;
       ins.Enabled := true;
       add.Enabled := true;
       del.Enabled := true;
       post.Enabled := true;
       cancel.Enabled := true;
       salir.Enabled := true;
     end;

End;


procedure TFsco_alta_gru_per.addClick(Sender: TObject);
begin
     dm.TGrupo.Insert;
     dm.TGrupo.FieldByName('id_user').AsInteger := dm.Qaux.FieldByName('id_age').AsInteger;
     dm.TGrupo.FieldByName('id_grupo').AsInteger := strtoint(DBText1.Caption);
     dm.TGrupo.Post;
     dm.TGrupo.Refresh;
     dm.QGRUPO.Refresh;
     dm.QAUX.Refresh;
     ag_gru;
end;

Procedure TFsco_alta_gru_per.ag_gru;
begin  //
  if dm.MyConnection1.Connected then
  begin
    dm.QAUX.Close;
    dm.QAUX.SQL.Clear;
    dm.QAUX.SQL.LoadFromFile(fmain.ruta+'qaux.sql');
    dm.QAUX.SQL.Add('WHERE');
    dm.QAUX.SQL.Add('grupo.id_user ='+intToStr(dm.TAGE.FieldByName('id_age').AsInteger)+'');
    dm.QAUX.SQL.Add('ORDER BY  cat_gru.id_grupo');
    dm.QAUX.Open;

     DM.QCAT_GRU.Close;
     DM.QCAT_GRU.SQL.Clear;
     dm.QCAT_GRU.SQL.Add('SELECT *');
     dm.QCAT_GRU.SQL.Add('From');
     dm.QCAT_GRU.SQL.Add('cat_gru');
     dm.QCAT_GRU.SQL.Add('LEFT JOIN grupo ON (cat_gru.id_grupo=grupo.id_grupo)');
     dm.QCAT_GRU.SQL.Add('AND (GRUPO.id_user ='+ IntToStr(dm.TAGE.FieldByName('id_age').AsInteger )+')');
     dm.QCAT_GRU.SQL.Add('WHERE GRUPO.id_grupo IS NULL');
     dm.QCAT_GRU.SQL.Add(' ORDER BY CAT_GRU.`id_grupo` ASC');
     dm.QCAT_GRU.Open;
    Application.ProcessMessages;
  end;
end;// procedure

procedure TFsco_alta_gru_per.cancelClick(Sender: TObject);
begin
   ValBotton(3);
end;

procedure TFsco_alta_gru_per.salirClick(Sender: TObject);
begin
   Fsco_alta_gru_per.close;
end;

procedure TFsco_alta_gru_per.DBAdvGlowNavigator1Click(Sender: TObject;
  Button: TAdvNavigateBtn);
begin
   ag_gru;
end;

procedure TFsco_alta_gru_per.delClick(Sender: TObject);
begin  // fin
   if dm.MyConnection1.Connected then
      begin
         DM.QCOH.Close;
         DM.QCOH.SQL.Clear;
         DM.QCOH.SQL.Add('SELECT * FROM GRUPO');
         DM.QCOH.SQL.Add('where');
         DM.QCOH.SQL.Add('grupo.id_grupo='+INTTOSTR(DM.QGRUPO.FieldByName('ID_GRUPO').AsInteger)  +'');
         DM.QCOH.SQL.Add('AND');
         DM.QCOH.SQL.Add('grupo.id_user='+INTTOSTR(DM.QGRUPO.FieldByName('id_age').AsInteger)  +'');
         DM.QCOH.Open;
         DM.QCOH.Delete;
         DM.QCOH.Close;
         DM.QCOH.SQL.Clear;
         DM.TGrupo.Refresh;
{         DM.QCOH.SQL.Add('SELECT * FROM GRUPO');
         DM.QCOH.Open;
         DM.TGrupo.Refresh;
         DM.QAUX.Refresh;
         DM.QGRUPO.Refresh;
         dbGrid1.Refresh;
         dbGrid2.Refresh;}
         ag_gru;
      end;

end;

procedure TFsco_alta_gru_per.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if dm.MyConnection1.Connected then
      begin
         dm.QGRUPO.Close;
         dm.QGRUPO.SQL.Text := grupo;
         dm.QGRUPO.Open;

         dm.QAUX.Close;
         dm.QAUX.SQL.Text := AUX;
         dm.QAUX .Open;

         dm.QCOH.Close;
         dm.QCOH.SQL.Text := COH;
         dm.QCOH.Open;
      end;
end;

procedure TFsco_alta_gru_per.FormCreate(Sender: TObject);
begin // create
   if dm.MyConnection1.Connected then
      begin
         grupo := dm.QGRUPO.SQL.Text;
         aux := dm.QAUX.SQL.Text;
         coh := dm.QCOH.SQL.Text;
         ag_gru;
        {----------------------------------------------------------------------}
        left:=(( Fsco_alta_gru_per.Width-  DBAdvGlowNavigator1.Width)div 2);
        DBAdvGlowNavigator1.Left := left;
        DBText1.Left := left;
        DBText2.Left := left;
        DBText3.Left := left;
        DBText4.Left := left;
        DBText5.Left := left;
        ValBotton(1);
      end;
end;

procedure TFsco_alta_gru_per.insClick(Sender: TObject);
begin
   ValBotton(2);
end;

procedure TFsco_alta_gru_per.postClick(Sender: TObject);
begin
   ValBotton(3);
end;

end.
