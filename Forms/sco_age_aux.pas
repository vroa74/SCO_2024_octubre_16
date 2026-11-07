unit sco_age_aux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Data.DB, Vcl.DBCtrls, ConsultasUI;

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
    FConsultaDiferida: TConsultaDiferida;
    procedure ConsultarPendiente(Sender: TObject);
    procedure MostrarBusqueda(Sender: TObject);
    procedure OcultarBusqueda(Sender: TObject);
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
begin
  if Assigned(FConsultaDiferida) then FConsultaDiferida.Cancelar;
  dm.ConsultarAgenda(Edit1.Text, Edit2.Text, Edit3.Text, Edit4.Text, Edit5.Text);
end;

procedure Tfsco_age_aux.BitBtn1Click(Sender: TObject);
begin
Query;
end;

procedure Tfsco_age_aux.DBGrid1DblClick(Sender: TObject);
begin
  if not dm.QAGE.Active or dm.QAGE.IsEmpty then Exit;
  age_titulo := dm.QAGE.FieldByName('titulo').AsString;
  age_nombre := dm.QAGE.FieldByName('nombre').AsString;
  age_apaterno := dm.QAGE.FieldByName('apaterno').AsString;
  age_amaterno := dm.QAGE.FieldByName('amaterno').AsString;
  age_cargo := dm.QAGE.FieldByName('cargo').AsString;
  age_deporg := dm.QAGE.FieldByName('deporg').AsString;
  age_dir := dm.QAGE.FieldByName('dir').AsString;
  ModalResult := mrOk;
end;

procedure Tfsco_age_aux.Edit1Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure Tfsco_age_aux.Edit2Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure Tfsco_age_aux.Edit3Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure Tfsco_age_aux.Edit4Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure Tfsco_age_aux.Edit5Change(Sender: TObject);
begin
FConsultaDiferida.Solicitar;
end;

procedure Tfsco_age_aux.FormCreate(Sender: TObject);
begin
  FConsultaDiferida := TConsultaDiferida.Create(Self, ConsultarPendiente);
  OnShow := MostrarBusqueda;
  OnHide := OcultarBusqueda;
//------------------------------------------------------------------------------
end;
procedure Tfsco_age_aux.ConsultarPendiente(Sender: TObject);
begin
  Query;
end;

procedure Tfsco_age_aux.MostrarBusqueda(Sender: TObject);
begin
  ModalResult := mrNone;
  dm.QAGE.Close;
  FConsultaDiferida.Solicitar(1);
end;

procedure Tfsco_age_aux.OcultarBusqueda(Sender: TObject);
begin
  FConsultaDiferida.Cancelar;
end;

end.
