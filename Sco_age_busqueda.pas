unit Sco_age_busqueda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, JvExExtCtrls, JvExtComponent,
  JvRollOut, ExtCtrls, Buttons, ppParameter, ppBands, ppRichTx, ppStrtch,
  ppMemo, ppCtrls, jpeg, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe;

type
  TfSco_age_busqueda = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDBPipeline1ppField8: TppField;
    ppDBPipeline1ppField9: TppField;
    ppDBPipeline1ppField10: TppField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppImage1: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBRichText1: TppDBRichText;
    ppLabel8: TppLabel;
    ppDBRichText2: TppDBRichText;
    ppLabel5: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppParameterList1: TppParameterList;
     procedure Query;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    clave: integer;
  end;

var
  fSco_age_busqueda: TfSco_age_busqueda;

implementation
USES MAIN, D_m, login;

{$R *.dfm}
//-----------------------------------------------------------------------------
procedure TfSco_age_busqueda.Query;
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
       Memo1.Text := dm.QAGE.SQL.Text;
       dm.QAGE.Open;
   end;// validacion de conexion
end;


procedure TfSco_age_busqueda.BitBtn1Click(Sender: TObject);
begin
   query;
end;

procedure TfSco_age_busqueda.BitBtn2Click(Sender: TObject);
begin
Edit1.Text :='';
Edit2.Text :='';
Edit3.Text :='';
Edit4.Text :='';
Edit5.Text :='';

end;

procedure TfSco_age_busqueda.BitBtn3Click(Sender: TObject);
begin
ppReport1.Print;
end;

procedure TfSco_age_busqueda.BitBtn5Click(Sender: TObject);
begin
   close;
end;

procedure TfSco_age_busqueda.DBGrid1DblClick(Sender: TObject);
begin
      fSco_age_busqueda.clave := dm.QAGE.FieldByName('id_age').AsInteger;
      Close;

end;

end.
