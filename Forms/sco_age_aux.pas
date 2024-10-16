unit sco_age_aux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Data.DB, Vcl.DBCtrls;

type
  Tfsco_age_aux = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    procedure Query;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
   age_titulo: string;
   age_nombre : string;
   age_apaterno: string;
   age_amaterno: string;
   age_cargo: string;
   age_deporg:string;
   age_dir:string;

    { Public declarations }
  end;

var
  fsco_age_aux: Tfsco_age_aux;

implementation
uses main, d_m ;

{$R *.dfm}

//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------


procedure Tfsco_age_aux.Query;
var cont :integer;
begin// query
   cont :=0;
   if dm.MyConnection1.Connected then
   begin
       dm.QAGE.Close;
       dm.QAGE.SQL.Clear;
       dm.QAGE.SQL.Add('SELECT * From Age');
       if ( (Edit1.Text<> '') or   (Edit2.Text> '') or   (Edit3.Text<> '') or   (Edit4.Text<> '') or   (Edit5.Text<> '')) then
       begin
       dm.QAGE.SQL.Add('WHERE');

         if Edit1.Text <> '' then
           begin
             dm.QAGE.SQL.Add('nombre LIKE "%'+Edit1.Text+'%"');
             cont := cont +1;
           end;

         if Edit2.Text <> '' then
           begin
             if cont>=1 then
                dm.QAGE.SQL.Add('AND');

             dm.QAGE.SQL.Add('apaterno LIKE "%'+Edit2.Text+'%"');
             cont := cont +1;
           end;

         if Edit3.Text <> '' then
           begin
             if cont>=1 then  dm.QAGE.SQL.Add('AND');
             dm.QAGE.SQL.Add('amaterno LIKE "%'+Edit3.Text+'%"');
             cont := cont +1;
           end;

         if Edit4.Text <> '' then
           begin
             if cont>=1 then  dm.QAGE.SQL.Add('AND');
             dm.QAGE.SQL.Add('cargo LIKE "%'+Edit4.Text+'%"');
             cont := cont +1;
           end;

         if Edit5.Text <> '' then
           begin
             if cont>=1 then  dm.QAGE.SQL.Add('AND');
             dm.QAGE.SQL.Add('deporg LIKE "%'+Edit5.Text+'%"');
           end;
       end;// fin validacion
//       Memo1.Text := dm.QAGE.SQL.Text;
       dm.QAGE.Open;
   end;// validacion de conexion
end;


procedure Tfsco_age_aux.BitBtn1Click(Sender: TObject);
begin
Query;
end;

procedure Tfsco_age_aux.DBGrid1DblClick(Sender: TObject);
begin
if dm.MyConnection1.Connected then
   begin
       fsco_age_aux.age_titulo := dm.QAGE.FieldByName('titulo').AsString;
       fsco_age_aux.age_nombre := dm.QAGE.FieldByName('nombre').AsString;
       fsco_age_aux.age_apaterno := dm.QAGE.FieldByName('apaterno').AsString;
       fsco_age_aux.age_amaterno := dm.QAGE.FieldByName('amaterno').AsString;
       fsco_age_aux.age_cargo := dm.QAGE.FieldByName('cargo').AsString;
       fsco_age_aux.age_deporg := dm.QAGE.FieldByName('deporg').AsString;
       fsco_age_aux.age_dir := dm.QAGE.FieldByName('dir').AsString;
    //------------------------------------------------------------------------------
       age_titulo := fsco_age_aux.age_titulo;
       age_nombre := fsco_age_aux.age_nombre;
       age_nombre := fsco_age_aux.age_apaterno;
       age_apaterno := fsco_age_aux.age_amaterno;
       age_cargo :=  fsco_age_aux.age_cargo;
       age_deporg := fsco_age_aux.age_deporg ;
       age_dir := fsco_age_aux.age_dir ;
       close;
    //------------------------------------------------------------------------------
   end;

end;

procedure Tfsco_age_aux.Edit1Change(Sender: TObject);
begin
Query;
end;

procedure Tfsco_age_aux.Edit2Change(Sender: TObject);
begin
Query;
end;

procedure Tfsco_age_aux.Edit3Change(Sender: TObject);
begin
Query;
end;

procedure Tfsco_age_aux.Edit4Change(Sender: TObject);
begin
Query;
end;

procedure Tfsco_age_aux.Edit5Change(Sender: TObject);
begin
Query;
end;

procedure Tfsco_age_aux.FormCreate(Sender: TObject);
begin
//------------------------------------------------------------------------------
end;
end.
