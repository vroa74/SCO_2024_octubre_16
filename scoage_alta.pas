unit scoage_alta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, DBAdvNavigator,
  JvExExtCtrls, JvImage, DBAdvGlowNavigator, Buttons, ppStrtch, ppMemo, ppCtrls,
  ppBands, jpeg, ppPrnabl, ppClass, ppCache, ppParameter, ppDB, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe;

type
  Tfscoage_alta = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Memo1: TMemo;
    Label9: TLabel;
    Memo3: TMemo;
    Label8: TLabel;
    Memo2: TMemo;
    ListBox1: TListBox;
    Edit6: TEdit;
    Panel2: TPanel;
    JvImage1: TJvImage;
    DBAdvGlowNavigator1: TDBAdvGlowNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppImage1: TppImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppLabel9: TppLabel;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppDBText7: TppDBText;
    ppLabel11: TppLabel;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppDBMemo1: TppDBMemo;
    Label10: TLabel;
    procedure clear;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnPost(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnInsert(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnCancel(Sender: TObject);
    procedure DBAdvGlowNavigator1BtnEdit(Sender: TObject);
    procedure DBAdvGlowNavigator1Click(Sender: TObject;
      Button: TAdvNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
    ins:bool;
  end;

var
  fscoage_alta: Tfscoage_alta;

implementation
uses main, d_m, scoage_bus;

{$R *.dfm}

procedure Tfscoage_alta.BitBtn1Click(Sender: TObject);
var aux: integer;

begin
aux:= DM.tage.FieldByName('id_age').AsInteger;
if dm.MyConnection1.Connected then
   begin
     dm.QAGE.Close;
     dm.QAGE.SQL.Clear;
     dm.QAGE.SQL.Add('SELECT * FROM AGE');
     dm.QAGE.SQL.Add('where');
     dm.QAGE.SQL.Add('id_age = '+IntToStr(aux)+'');
     DM.QAGE.Open;
     ppReport1.Print;
     dm.QAGE.Close;
     dm.QAGE.SQL.Clear;
     dm.QAGE.SQL.Add('SELECT * FROM AGE');
     DM.QAGE.Open;
   end;
end;

procedure Tfscoage_alta.BitBtn2Click(Sender: TObject);
begin
   close;
end;

procedure Tfscoage_alta.BitBtn3Click(Sender: TObject);
var f: TFscoage_bus;
    id:integer;
    reg:integer;
begin
   id:=0;
   reg:=0;
   f:= tFscoage_bus.Create(application);
   try
     f.ShowModal
   finally
      f.Free;
      id := Fscoage_bus.clave;
      dm.Tage.First;
      repeat
         if id = dm.Tage.FieldByName('id_age').AsInteger then
            begin
                reg:= dm.Tage.RecNo;
                dm.Tage.Last;
            end;
        dm.Tage.Next;
      until dm.Tage.Eof ;
      dm.Tage.RecNo := reg;
      dm.Tage.Refresh;
   end;
end;

procedure Tfscoage_alta.clear;
begin
end;

//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------


procedure Tfscoage_alta.ComboBox1Change(Sender: TObject);
begin  //onchange

end;

procedure Tfscoage_alta.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
//Combobox1.Items.Add(ComboBox1.Text);
//ComboBox1.Items.SaveToFile(fmain.ruta+'titulo.ini' );
//ComboBox1.Items.LoadFromFile(fmain.ruta+'titulo.ini' );

end;
end;

procedure Tfscoage_alta.DBAdvGlowNavigator1BtnCancel(Sender: TObject);
begin
 dm.Tage.Cancel;
 BitBtn1.Enabled := true;
 BitBtn2.Enabled := true;
 BitBtn3.Enabled := true;

end;

procedure Tfscoage_alta.DBAdvGlowNavigator1BtnEdit(Sender: TObject);
begin
 BitBtn1.Enabled := false;
 BitBtn2.Enabled := false;
 BitBtn3.Enabled := false;
 dm.Tage.Edit;
end;

procedure Tfscoage_alta.DBAdvGlowNavigator1BtnInsert(Sender: TObject);
begin
 BitBtn1.Enabled := false;
 BitBtn2.Enabled := false;
 BitBtn3.Enabled := false;
 dm.Tage.Insert;

end;

procedure Tfscoage_alta.DBAdvGlowNavigator1BtnPost(Sender: TObject);
begin
 dm.Tage.Post;
 if ins then
 begin
  dm.Tage.Refresh;
  dm.Tage.Last;
 end else
 begin
 dm.Tage.RefreshRecord;
 end;
 BitBtn1.Enabled := true;
 BitBtn2.Enabled := true;
 BitBtn3.Enabled := true;

end;

// *****************************************************************************
procedure Tfscoage_alta.DBAdvGlowNavigator1Click(Sender: TObject;
  Button: TAdvNavigateBtn);
begin //



end;

procedure Tfscoage_alta.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(Key);
end;

procedure Tfscoage_alta.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(Key);
end;

procedure Tfscoage_alta.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(Key);
end;

procedure Tfscoage_alta.FormCreate(Sender: TObject);
begin
//ComboBox1.Items.LoadFromFile(fmain.ruta+'titulo.ini' );
 JvImage1.Picture.LoadFromFile(fmain.ruta+'LOGO-CONGRESO_1.jpg');
 clear;
 ins := false;
end;

procedure Tfscoage_alta.ListBox1Click(Sender: TObject);
var h: Integer;
    count:integer;
begin
 Edit6.Text := IntToStr( ListBox1.ItemIndex )+ '  /  '+ IntToStr(ListBox1.Count  );
 Listbox1.Items.Delete( ListBox1.ItemIndex  );

   count :=0;
   count:=ListBox1.Items.Count;
       dm.Qgrupo.Close;
       dm.Qgrupo.SQL.Clear;
       dm.Qgrupo.SQL.Add ('Select * From grupo');
       dm.Qgrupo.SQL.Add('where');
       dm.Qgrupo.SQL.Add('grupo  NOT IN ('+ QuotedStr(ListBox1.Items.Strings[0]) +')'   );
       if count  > 0 then
       begin
           dm.Qgrupo.SQL.Add('AND'   );
           dm.Qgrupo.SQL.Add('grupo  NOT IN ('+QuotedStr( ListBox1.Items.Strings[1]) +')'   );
       end;
       if count  > 1 then
       begin
           dm.Qgrupo.SQL.Add('AND'   );
           dm.Qgrupo.SQL.Add('grupo  NOT IN ('+ QuotedStr( ListBox1.Items.Strings[2] )+')'   );
       end;
       if count  > 2 then
       begin
           dm.Qgrupo.SQL.Add('AND'   );
           dm.Qgrupo.SQL.Add('grupo  NOT IN ('+ QuotedStr(  ListBox1.Items.Strings[3] )+')'   );
       end;
       if count  > 3 then
       begin
           dm.Qgrupo.SQL.Add('AND'   );
           dm.Qgrupo.SQL.Add('grupo  NOT IN ('+ QuotedStr( ListBox1.Items.Strings[4] )+')'   );
       end;
//       Memo4.Text := dm.Qgrupo.SQL.Text;
       dm.Qgrupo.Open;



//   listbox1.DeleteSelected;
//   delete(listbox1.Items[h]);
   end;

end.
