unit scoage_edi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvRollOut, DBCtrls;

type
  TFscoage_edi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label9: TLabel;
    Memo3: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    add: TBitBtn;
    del: TBitBtn;
    JvRollOut1: TJvRollOut;
    JvRollOut2: TJvRollOut;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure llenar;    
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure delClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fscoage_edi: TFscoage_edi;

implementation
uses d_m, main;

{$R *.dfm}




procedure TFscoage_edi.Button2Click(Sender: TObject);
begin
    Close;
end;


procedure TFscoage_edi.delClick(Sender: TObject);
begin  // quitar
     dm.QGRUPO.Insert;
     dm.QGRUPO.FieldByName('id_user').AsInteger := dm.Tage.FieldByName('id_age').AsInteger;
     dm.QGRUPO.FieldByName('id_grupo').AsInteger := dm.QCAT_GRU.FieldByName('id_grupo').AsInteger;
     dm.QGRUPO.Post;
//-------------------------------------------------------------------------------------------------
     DM.QCAT_GRU.Close;
     DM.QCAT_GRU.SQL.Clear;
     dm.QCAT_GRU.SQL.Add('SELECT *');
     dm.QCAT_GRU.SQL.Add('From');
     dm.QCAT_GRU.SQL.Add('cat_gru');
     dm.QCAT_GRU.SQL.Add('LEFT JOIN grupo ON (cat_gru.id_grupo = grupo.id_grupo)');
     dm.QCAT_GRU.SQL.Add('AND (GRUPO.id_user ='+ IntToStr(dm.TAGE.FieldByName('id_age').AsInteger )+')');
     dm.QCAT_GRU.SQL.Add('WHERE GRUPO.id_grupo IS NULL');
     dm.QCAT_GRU.SQL.Add(' ORDER BY CAT_GRU.`id_grupo` ASC');
     dm.QCAT_GRU.Open;
     dm.QCAT_GRU.Refresh;
     dm.QGRUPO.Refresh;
     dm.QAUX.Refresh;
end;

procedure TFscoage_edi.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(Key);
end;

procedure TFscoage_edi.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(Key);
end;

//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------


procedure TFscoage_edi.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(Key);
end;

procedure TFscoage_edi.FormCreate(Sender: TObject);
begin
  llenar;
  ComboBox1.Items.LoadFromFile(fmain.ruta+'titulo.ini' );
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
end;

procedure TFscoage_edi.llenar;
begin
if dm.MyConnection1.Connected then
   begin
     ComboBox1.Text := dm.Tage.FieldByName('titulo').AsString ;
     Edit1.Text := dm.Tage.FieldByName('nombre').AsString ;
     Edit2.Text := dm.Tage.FieldByName('apaterno').AsString ;
     Edit3.Text := dm.Tage.FieldByName('amaterno').AsString ;
     Edit4.Text := dm.Tage.FieldByName('cargo').AsString ;
     Edit5.Text := dm.Tage.FieldByName('deporg').AsString ;
     Memo1.Text := dm.Tage.FieldByName('telefono').AsString ;
     Memo2.Text := dm.Tage.FieldByName('email').AsString ;
     Memo3.Text := dm.Tage.FieldByName('dir').AsString ;
   end;
end;

procedure TFscoage_edi.addClick(Sender: TObject);
begin   // IINGRESAR
   if  dm.MyConnection1.Connected then
   begin
     DM.QGRUPO.Close;
     DM.QGRUPO.SQL.Clear;
     DM.QGRUPO.SQL.Add('SELECT * FROM GRUPO');
     DM.QGRUPO.SQL.Add('WHERE');
     DM.QGRUPO.SQL.Add('grupo.id_grupo='+INTTOSTR(DM.QAUX.FieldByName('ID_GRUPO').AsInteger)  +'');
     DM.QGRUPO.SQL.Add('AND');
     DM.QGRUPO.SQL.Add('grupo.id_user='+INTTOSTR(DM.QAUX.FieldByName('id_user').AsInteger)  +'');
     DM.QGRUPO.Open;
     DM.QGRUPO.Delete;
     DM.QGRUPO.Close;
     DM.QGRUPO.SQL.Clear;
     DM.QGRUPO.SQL.Add('SELECT * FROM GRUPO');
     DM.QGRUPO.Open;
     DM.QAUX.Refresh;
     DM.QCAT_GRU.Refresh;
   end;                                                                        //id_user




end;

procedure TFscoage_edi.Button1Click(Sender: TObject);
begin
   if  dm.MyConnection1.Connected then
   begin
      ComboBox1.Text := trim(ComboBox1.Text);
      Edit1.Text  := trim(Edit1.Text);
      Edit2.Text  := trim(Edit2.Text);
      Edit3.Text  := trim(Edit3.Text);
      Edit4.Text  := trim(Edit4.Text);
      Edit5.Text  := trim(Edit5.Text);
      dm.Tage.Edit;
      dm.Tage.FieldByName('titulo').AsString := ComboBox1.Text;
      dm.Tage.FieldByName('nombre').AsString := Edit1.Text;
      dm.Tage.FieldByName('apaterno').AsString := Edit2.Text;
      dm.Tage.FieldByName('amaterno').AsString := Edit3.Text;
      dm.Tage.FieldByName('cargo').AsString := Edit4.Text;
      dm.Tage.FieldByName('deporg').AsString := Edit5.Text;
      dm.Tage.FieldByName('telefono').AsString := Memo1.Text;
      dm.Tage.FieldByName('email').AsString := Memo2.Text;
      dm.Tage.FieldByName('dir').AsString := Memo3.Text;
      dm.Tage.FieldByName('Modifico').AsString := dm.MyConnection1.Username;
      dm.Tage.Post;
      ComboBox1.Items.Add(ComboBox1.Text);
      ComBoBox1.Sorted :=true;
      ComboBox1.Items.SaveToFile(fmain.ruta + 'titulo.dll');
      dm.Tage.Refresh;
      close;
   end;
end;

end.
