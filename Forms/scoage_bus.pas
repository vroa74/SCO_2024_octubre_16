unit scoage_bus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ppCtrls, ppBands, ppPrnabl, ppClass,
  ppCache, ppParameter, ppDB, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe,
  jpeg, ppRichTx, ppStrtch, ppMemo, Buttons, ExtCtrls, Data.DB, ppDesignLayer, ConsultasUI, ImagenesReportes;

type
  TFscoage_bus = class(TForm)
    DBGrid1: TDBGrid;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
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
    ppImage1: TppImage;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
     procedure Query;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2MouseEnter(Sender: TObject);
    procedure BitBtn3MouseEnter(Sender: TObject);
    procedure BitBtn1MouseEnter(Sender: TObject);
    procedure BitBtn5MouseEnter(Sender: TObject);
    procedure BitBtn2MouseLeave(Sender: TObject);
  private
    FConsultaDiferida: TConsultaDiferida;
    mango: THintWindow;
    procedure ConsultarPendiente(Sender: TObject);
    procedure MostrarBusqueda(Sender: TObject);
    procedure OcultarBusqueda(Sender: TObject);
  public
    { Public declarations }
    clave:integer;
  end;

var
  Fscoage_bus: TFscoage_bus;

implementation
uses main, d_m;


{$R *.dfm}
{----------------------------------------------------------------------------}






procedure TFscoage_bus.Query;
begin
  if Assigned(FConsultaDiferida) then FConsultaDiferida.Cancelar;
  dm.ConsultarAgenda(Edit1.Text, Edit2.Text, Edit3.Text, Edit4.Text, Edit5.Text);
end;

procedure TFscoage_bus.BitBtn1Click(Sender: TObject);
begin
   query;
end;

procedure TFscoage_bus.BitBtn1MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn1);

end;

procedure TFscoage_bus.BitBtn2Click(Sender: TObject);
begin
Edit1.Text :='';
Edit2.Text :='';
Edit3.Text :='';
Edit4.Text :='';
Edit5.Text :='';

end;

procedure TFscoage_bus.BitBtn2MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn2);
end;

procedure TFscoage_bus.BitBtn2MouseLeave(Sender: TObject);
begin
      fmain.RemoveHint(mango);

end;

procedure TFscoage_bus.BitBtn3Click(Sender: TObject);
begin
PrepararLogosImpresion(Self);
ppReport1.Print;
end;

procedure TFscoage_bus.BitBtn3MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn3);

end;

procedure TFscoage_bus.BitBtn5Click(Sender: TObject);
begin
   Close;
end;

procedure TFscoage_bus.BitBtn5MouseEnter(Sender: TObject);
begin
     mango:= fmain.RevealHint(BitBtn5);

end;

procedure TFscoage_bus.Button2Click(Sender: TObject);
begin

//ppReport1.Print;
end;

procedure TFscoage_bus.Button3Click(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
//
// Este sistema fue dasarrollado por Victor Román Ortiz Abreu.
//
//------------------------------------------------------------------------------


procedure TFscoage_bus.DBGrid1DblClick(Sender: TObject);
begin
  if not dm.QAGE.Active or dm.QAGE.IsEmpty then Exit;
  clave := dm.QAGE.FieldByName('id_age').AsInteger;
  ModalResult := mrOk;
end;

procedure TFscoage_bus.Edit1Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure TFscoage_bus.Edit2Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure TFscoage_bus.Edit3Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure TFscoage_bus.Edit4Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure TFscoage_bus.Edit5Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure TFscoage_bus.FormCreate(Sender: TObject);
begin
  FConsultaDiferida := TConsultaDiferida.Create(Self, ConsultarPendiente);
  Fscoage_bus.Caption  := 'SISTEMA DE GESTIÓN Y TRÁNSITO DOCUMENTAL (SGTD / Agenda )';
  OnShow := MostrarBusqueda;
  OnHide := OcultarBusqueda; // create form...
   BitBtn1.Hint := 'Limpiar filtros ...';
   BitBtn2.Hint := ' Actualizar ';
   BitBtn3.Hint := 'Imprimir linta de Reportes...';
   BitBtn5.Hint := 'Cerrar la ventana...';
//   DBGrid1.Columns[1].Color := clSkyBlue;

end;

procedure TFscoage_bus.ConsultarPendiente(Sender: TObject);
begin
  Query;
end;

procedure TFscoage_bus.MostrarBusqueda(Sender: TObject);
begin
  ModalResult := mrNone;
  dm.QAGE.Close;
  FConsultaDiferida.Solicitar(1);
end;

procedure TFscoage_bus.OcultarBusqueda(Sender: TObject);
begin
  FConsultaDiferida.Cancelar;
end;

end.
