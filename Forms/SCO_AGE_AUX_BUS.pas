unit SCO_AGE_AUX_BUS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, ppParameter, ppBands,
  ppRichTx, ppStrtch, ppMemo, ppCtrls, jpeg, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe;

type
  TFSCO_AGE_AUX_BUS = class(TForm)
    DBGrid1: TDBGrid;
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
    DBGrid2: TDBGrid;
    ppDBPipeline1: TppDBPipeline;
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
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2MouseEnter(Sender: TObject);
    procedure BitBtn3MouseEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5MouseEnter(Sender: TObject);
    procedure BitBtn2MouseLeave(Sender: TObject);
    procedure BitBtn3MouseLeave(Sender: TObject);
    procedure BitBtn1MouseLeave(Sender: TObject);
    procedure BitBtn5MouseLeave(Sender: TObject);
    procedure BitBtn1MouseEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
      mango:THintWindow;

  public
    { Public declarations }
  end;

var
  FSCO_AGE_AUX_BUS: TFSCO_AGE_AUX_BUS;

implementation
USES D_M, MAIN;

{$R *.dfm}
{------------------------------------------------------------------------------}

procedure TFSCO_AGE_AUX_BUS.Query;
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




procedure TFSCO_AGE_AUX_BUS.BitBtn1Click(Sender: TObject);
begin
  Query;
end;

procedure TFSCO_AGE_AUX_BUS.BitBtn1MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn1);

end;

procedure TFSCO_AGE_AUX_BUS.BitBtn1MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);

end;

procedure TFSCO_AGE_AUX_BUS.BitBtn2Click(Sender: TObject);
begin
    Edit1.Text :='';
    Edit2.Text :='';
    Edit3.Text :='';
    Edit4.Text :='';
    Edit5.Text :='';
    query;
end;

procedure TFSCO_AGE_AUX_BUS.BitBtn2MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn2);
end;

procedure TFSCO_AGE_AUX_BUS.BitBtn2MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);

end;

procedure TFSCO_AGE_AUX_BUS.BitBtn3Click(Sender: TObject);
begin
ppReport1.Print;

end;

procedure TFSCO_AGE_AUX_BUS.BitBtn3MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn3);

end;

procedure TFSCO_AGE_AUX_BUS.BitBtn3MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);

end;

procedure TFSCO_AGE_AUX_BUS.BitBtn5Click(Sender: TObject);
begin
   CLOSE;
end;

procedure TFSCO_AGE_AUX_BUS.BitBtn5MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn5);

end;

procedure TFSCO_AGE_AUX_BUS.BitBtn5MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);

end;

procedure TFSCO_AGE_AUX_BUS.FormCreate(Sender: TObject);
begin   // CREATE FORM
   BitBtn1.Hint := 'Limpiar filtros ...';
   BitBtn2.Hint := ' Actualizar ';
   BitBtn3.Hint := 'Imprimor linta de Reportes...';
   BitBtn5.Hint := 'Cerrar la ventana...';


end;

end.
