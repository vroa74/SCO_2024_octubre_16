unit sco_alta_gru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,
  DBAdvGlowNavigator, JvExExtCtrls, JvExtComponent, JvRollOut;

type
  TFsco_alta_gru = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBAdvGlowNavigator1: TDBAdvGlowNavigator;
    DBEdit1: TDBEdit;
    add: TBitBtn;
    del: TBitBtn;
    cancel: TBitBtn;
    post: TBitBtn;
    salir: TBitBtn;
    ins: TBitBtn;
    DBEdit2: TDBEdit;
    DBText1: TDBText;
    Memo1: TMemo;
    Memo2: TMemo;
    JvRollOut1: TJvRollOut;
    DBGrid1: TDBGrid;
    JvRollOut2: TJvRollOut;
    DBGrid2: TDBGrid;
    Procedure ValBotton(i:integer);
   Procedure ag_gru;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBAdvGlowNavigator1Click(Sender: TObject;
      Button: TAdvNavigateBtn);
    procedure salirClick(Sender: TObject);
    procedure insClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure postClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
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
  Fsco_alta_gru: TFsco_alta_gru;

implementation
uses login, d_m, scoage_alta, scoage_edi, scoage_bus, scoalta, scoedi, scobus, scoconsultas, about, rg, SEGUIMIENTO, Archivo, SArchivo, sco_cat_grupo, SCOALTAGRUPO, sco_bus_gru, main ;

{$R *.dfm}

Procedure TFsco_alta_gru.ValBotton(i:integer);
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


procedure TFsco_alta_gru.addClick(Sender: TObject);
begin
if dm.MyConnection1.Connected then
begin
   if dm.QAUX.RecordCount > 0 then
      begin
         dm.TGrupo.Insert;
         dm.TGrupo.FieldByName('id_user').AsInteger := dm.Qaux.FieldByName('id_age').AsInteger;
         dm.TGrupo.FieldByName('id_grupo').AsInteger := ( dm.QCAT_GRU.FieldByName('id_grupo').AsInteger );
         dm.TGrupo.Post;
         dm.TGrupo.Refresh;
         dm.QGRUPO.Refresh;
         dm.QAUX.Refresh;
      end
      else
      SHOWMESsAGE('No se puede seguir haciendo esta acción...');
end;
     ag_gru;
end;

Procedure TFsco_alta_gru.ag_gru;
begin  //
   if dm.MyConnection1.Connected then
      begin
         dm.QGRUPO.Close;
         dm.QGRUPO.SQL.Clear;
         DM.QGRUPO.SQL.LoadFromFile(fmain.ruta+'qgrupo_1.sql');
         DM.QGRUPO.SQL.Add('WHERE');
         dm.QGRUPO.SQL.Add('(grupo.id_grupo = '+ IntToStr( dm.QCAT_GRU.FieldByName('id_grupo').AsInteger )  +')');
         dm.QGRUPO.SQL.Add('ORDER BY');
         dm.QGRUPO.SQL.Add('age.id_age');
//         dm.QGRUPO.SQL.Add('grupo.id_grupo');
         dm.QGRUPO.Open;
      {-------------------------------------------------------------------------------------------}
         dm.QAUX.Close;
         dm.QAUX.SQL.Clear;
         dm.QAUX.SQL.LoadFromFile(fmain.ruta+'qgrupo_2.sql');
         dm.QAUX.SQL.Add('LEFT JOIN grupo ON (age.id_age = grupo.id_user) and (grupo.id_grupo = '+ IntToStr( dm.QCAT_GRU.FieldByName('id_grupo').AsInteger )  +')');
         dm.QAUX.SQL.Add('WHERE GRUPO.id_grupo is NULL');
         dm.QAUX.SQL.Add('ORDER BY age.`id_age` ASC');
//       dm.QAUX.SQL.Add('Age.`id_age` ASC');
         dm.QAUX.Open;
      end;// myconeccion
//   Memo1.Text := dm.QGRUPO.SQL.Text;
//   Memo2.Text := dm.QAUX.SQL.Text;
//   Application.ProcessMessages;
end;// procedure

procedure TFsco_alta_gru.cancelClick(Sender: TObject);
begin
   ValBotton(3);
end;

procedure TFsco_alta_gru.salirClick(Sender: TObject);
begin
   close;
end;

procedure TFsco_alta_gru.DBAdvGlowNavigator1Click(Sender: TObject;
  Button: TAdvNavigateBtn);
begin
   ag_gru;
end;

procedure TFsco_alta_gru.delClick(Sender: TObject);
begin  // fin
   if dm.MyConnection1.Connected then
      begin
        if dm.QGRUPO.RecordCount > 0 then
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
         DM.QCOH.SQL.Clear;
         DM.TGrupo.Refresh;
        end
        else
        SHOWMESsAGE('No se puede seguir haciendo esta acción...');
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

procedure TFsco_alta_gru.FormClose(Sender: TObject; var Action: TCloseAction);
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
//      close;
end;

procedure TFsco_alta_gru.FormCreate(Sender: TObject);
begin // create
   if dm.MyConnection1.Connected then
      begin
         grupo := dm.QGRUPO.SQL.Text;
         aux := dm.QAUX.SQL.Text;
         coh := dm.QCOH.SQL.Text;
         ag_gru;
       left:=(( Fsco_alta_gru.Width-  DBAdvGlowNavigator1.Width)div 2);
       DBAdvGlowNavigator1.Left := left;
       DBEdit1.Left := left;
       DBEdit2.Left := left;
       DBText1.Left := left;
        ValBotton(1);
      end;
end;

procedure TFsco_alta_gru.insClick(Sender: TObject);
begin
   ValBotton(2);
end;

procedure TFsco_alta_gru.postClick(Sender: TObject);
begin
   ValBotton(3);
end;

end.
