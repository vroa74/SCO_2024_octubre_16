unit d_m;

interface

uses
  Windows, SysUtils, Classes, DB, MemDS, DBAccess, MyAccess, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppPrnabl, ppBands, ppCache,
   MyBackup;

type
  TDM = class(TDataModule)
    MyConnection1: TMyConnection;
    QCO: TMyQuery;
    QAGE: TMyQuery;
    QCOH: TMyQuery;
    TGrupo: TMyTable;
    DQCO: TMyDataSource;
    DQAGE: TMyDataSource;
    DQCOH: TMyDataSource;
    DTco: TMyDataSource;
    DTage: TMyDataSource;
    DTGrupo: TMyDataSource;
    QCAT_GRU: TMyQuery;
    DQCAT_GRU: TMyDataSource;
    QAUX: TMyQuery;
    QGRUPO: TMyQuery;
    DQGRUPO: TMyDataSource;
    DQAUX: TMyDataSource;
    TCAT_GRU: TMyTable;
    DTCAT_GRU: TMyDataSource;
    MyBackup1: TMyBackup;
    QImpresion: TMyQuery;
    DQImpresion: TMyDataSource;
    TCO: TMyQuery;
    Tage: TMyQuery;
    TBitacora: TMyQuery;
    DTBitacora: TMyDataSource;
    QRCA: TMyQuery;
    DQRCA: TMyDataSource;
    Qco_his: TMyQuery;
    Dco_his: TMyDataSource;
    ncor: TMyQuery;
    Dncor: TMyDataSource;
    tcor: TMyQuery;
    dtcor: TMyDataSource;
    ccor: TMyQuery;
    dccor: TMyDataSource;
    MyTable1: TMyTable;
  private
    { Private declarations }
  public
    procedure ConsultarAgenda(const ANombre, APaterno, AMaterno, ACargo,
      ADependencia: string);
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ConsultarAgenda(const ANombre, APaterno, AMaterno, ACargo,
  ADependencia: string);
const
  Campos: array[0..4] of string = ('nombre', 'apaterno', 'amaterno', 'cargo', 'deporg');
var
  Valores: array[0..4] of string;
  I: Integer;
  Inicio: UInt64;
  TieneFiltro: Boolean;
begin
  if not MyConnection1.Connected then Exit;
  Valores[0] := ANombre;
  Valores[1] := APaterno;
  Valores[2] := AMaterno;
  Valores[3] := ACargo;
  Valores[4] := ADependencia;
  Inicio := GetTickCount64;
  QAGE.DisableControls;
  try
    QAGE.Close;
    QAGE.SQL.Text := 'SELECT * FROM age';
    TieneFiltro := False;
    for I := Low(Campos) to High(Campos) do
      if Valores[I] <> '' then
      begin
        if TieneFiltro then QAGE.SQL.Add('AND')
        else QAGE.SQL.Add('WHERE');
        QAGE.SQL.Add(Campos[I] + ' LIKE :f' + IntToStr(I));
        TieneFiltro := True;
      end;
    for I := Low(Campos) to High(Campos) do
      if Valores[I] <> '' then
        QAGE.ParamByName('f' + IntToStr(I)).AsString := '%' + Valores[I] + '%';
    QAGE.Open;
  finally
    QAGE.EnableControls;
    OutputDebugString(PChar('Agenda - consulta: ' +
      IntToStr(Int64(GetTickCount64 - Inicio)) + ' ms'));
  end;
end;

end.
