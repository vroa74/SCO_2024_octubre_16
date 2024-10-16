unit d_m;

interface

uses
  SysUtils, Classes, DB, MemDS, DBAccess, MyAccess, ppProd, ppClass, ppReport,
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
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
