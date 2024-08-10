unit SCO_alta_age_grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExExtCtrls, JvExtComponent, JvRollOut, StdCtrls,
  Buttons, DBAdvGlowNavigator, DBCtrls, ExtCtrls;

type
  TFSCO_alta_age_grupo = class(TForm)
    Panel1: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBAdvGlowNavigator1: TDBAdvGlowNavigator;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel2: TPanel;
    add: TBitBtn;
    del: TBitBtn;
    cancel: TBitBtn;
    post: TBitBtn;
    salir: TBitBtn;
    ins: TBitBtn;
    JvRollOut1: TJvRollOut;
    DBGrid2: TDBGrid;
    JvRollOut2: TJvRollOut;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    PROCEDURE AGE_GRU;
    Procedure ValBotton(i:integer);
    procedure salirClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure insClick(Sender: TObject);
    procedure postClick(Sender: TObject);
    procedure DBAdvGlowNavigator1Click(Sender: TObject;
      Button: TAdvNavigateBtn);
    procedure addClick(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    cat_gru, aux, coh : string;
    left:integer;
  end;

var
  FSCO_alta_age_grupo: TFSCO_alta_age_grupo;

implementation
uses login, d_m, scoage_alta, scoage_edi, scoage_bus, scoalta, scoedi, scobus, scoconsultas, about, rg, SEGUIMIENTO, Archivo, SArchivo, sco_cat_grupo, SCOALTAGRUPO, sco_bus_gru, main ;
{$R *.dfm}


{----------------------------------------------------------------------------------}
{==================================================================================}
{----------------------------------------------------------------------------------}

procedure TFSCO_alta_age_grupo.addClick(Sender: TObject);
begin
  if DM.MyConnection1.Connected then
  BEGIN
    if DM.QCAT_GRU.RecordCount > 0 then
    BEGIN
      dm.TGRUPO.Insert;
      dm.TGRUPO.FieldByName('id_user').AsInteger := dm.Tage.FieldByName('id_age').AsInteger;
      dm.TGRUPO.FieldByName('id_grupo').AsInteger := dm.QCAT_GRU.FieldByName('id_grupo').AsInteger;
      dm.TGRUPO.Post;
      DM.TGrupo.Refresh;
      AGE_GRU;
    END
    else
    SHOWMESsAGE('No se puede seguir haciendo esta acción...');
    lABEL1.Caption := INTTOSTR(DM.QCAT_GRU.RecordCount)+ '   -   ' +INTTOSTR(DM.QAUX.RecordCount);

  END;

end;

PROCEDURE TFSCO_alta_age_grupo.AGE_GRU;
BEGIN
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

END;
 {*******************************************************************************}
 {*******************************************************************************}
Procedure TFSCO_alta_age_grupo.ValBotton(i:integer);
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

procedure TFSCO_alta_age_grupo.cancelClick(Sender: TObject);
begin
      ValBotton(2);
end;
 procedure TFSCO_alta_age_grupo.DBAdvGlowNavigator1Click(Sender: TObject;
  Button: TAdvNavigateBtn);
begin
  AGE_GRU;
end;

procedure TFSCO_alta_age_grupo.delClick(Sender: TObject);
begin
   if dm.MyConnection1.Connected then
      begin
         DM.QCOH.Close;
         DM.QCOH.SQL.Clear;
         DM.QCOH.SQL.Add('SELECT * FROM GRUPO');
         DM.QCOH.SQL.Add('where');
         DM.QCOH.SQL.Add('grupo.id_grupo='+INTTOSTR(DM.QAUX.FieldByName('ID_GRUPO').AsInteger)  +'');
         DM.QCOH.SQL.Add('AND');
         DM.QCOH.SQL.Add('grupo.id_user='+INTTOSTR(DM.Tage.FieldByName('ID_AGE').AsInteger)  +'');
         DM.QCOH.Open;
         if DM.QCOH.RecordCount = 0 then
          SHOWMESsAGE('No se puede seguir haciendo esta acción...')
          else
          DM.QCOH.Delete;
{         DM.QCOH.SQL.Add('SELECT * FROM GRUPO');
         DM.QCOH.Open;
         DM.TGrupo.Refresh;
         DM.QAUX.Refresh;
         DM.QGRUPO.Refresh;
         dbGrid1.Refresh;
         dbGrid2.Refresh;}
         AGE_GRU;
      lABEL1.Caption := INTTOSTR(DM.QCAT_GRU.RecordCount)+ '   -   ' +INTTOSTR(DM.QAUX.RecordCount);
      end;
end;

{*******************************************************************************}
 {*******************************************************************************}
procedure TFSCO_alta_age_grupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.MyConnection1.Connected then
      begin
         dm.QCAT_GRU.Close;
         dm.QCAT_GRU.SQL.Text := CAT_GRU;
         dm.QCAT_GRU.Open;

         dm.QAUX.Close;
         dm.QAUX.SQL.Text := AUX;
         dm.QAUX .Open;

         dm.QCOH.Close;
         dm.QCOH.SQL.Text := COH;
         dm.QCOH.Open;
      end;

end;

procedure TFSCO_alta_age_grupo.FormCreate(Sender: TObject);
begin
       ValBotton(1);
       FSCO_alta_age_grupo.ValBotton(1);
       cat_gru := dm.QCAT_GRU.SQL.Text;
       aux := dm.QAUX.SQL.Text;
       coh := dm.QCOH.SQL.Text;

       AGE_GRU;
       left:=(( FSCO_alta_age_grupo.Width-  DBAdvGlowNavigator1.Width)div 2);
       DBAdvGlowNavigator1.Left := left;
       DBText1.Left := left;
       DBText2.Left := left;
       DBText3.Left := left;
       DBText4.Left := left;
       DBText5.Left := left;
end;
 {*******************************************************************************}
 {*******************************************************************************}

procedure TFSCO_alta_age_grupo.insClick(Sender: TObject);
begin
      ValBotton(2);
end;

procedure TFSCO_alta_age_grupo.postClick(Sender: TObject);
begin
      ValBotton(3);
end;

procedure TFSCO_alta_age_grupo.salirClick(Sender: TObject);
begin
   close;
end;

end.
