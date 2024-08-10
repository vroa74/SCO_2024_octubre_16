program SCO;

uses
  Forms,
  main in 'main.pas' {Fmain},
  d_m in 'd_m.pas' {DM: TDataModule},
  login in 'login.pas' {FLogin},
  scoalta in 'scoalta.pas' {fscoalta},
  scobus in 'scobus.pas' {Fscobus},
  scoedi in 'scoedi.pas' {Fscoedi},
  scoage_bus in 'scoage_bus.pas' {Fscoage_bus},
  scoage_alta in 'scoage_alta.pas' {fscoage_alta},
  scoage_edi in 'scoage_edi.pas' {Fscoage_edi},
  about in 'about.pas' {Fabout},
  sco_age_aux in 'sco_age_aux.pas' {fsco_age_aux},
  scoconsultas in 'scoconsultas.pas' {FSCOconsultas},
  RG in 'RG.pas' {Frg},
  Sco_age_busqueda in 'Sco_age_busqueda.pas' {fSco_age_busqueda},
  Archivo in 'Archivo.pas' {FArchivo},
  SArchivo in 'SArchivo.pas' {FSArchivo},
  sco_aux_impresion in 'sco_aux_impresion.pas' {F_aux_imp},
  sco_cat_grupo in 'sco_cat_grupo.pas' {Fcat_gru},
  SCOALTAGRUPO in 'SCOALTAGRUPO.pas' {FSCOALTAGRUPO},
  sco_alta_gru in 'sco_alta_gru.pas' {Fsco_alta_gru},
  sco_bus_gru in 'sco_bus_gru.pas' {Form1},
  sco_imp_gru in 'sco_imp_gru.pas' {Fsco_imp_gru},
  SEGUIMIENTO in 'SEGUIMIENTO.pas' {FSEGUIMIENTO},
  SCO_AGE_AUX_BUS in 'SCO_AGE_AUX_BUS.pas' {FSCO_AGE_AUX_BUS},
  sco_ins_gru in 'sco_ins_gru.pas' {Fsco_ins_gru},
  SCO_alta_age_grupo in 'SCO_alta_age_grupo.pas' {FSCO_alta_age_grupo},
  rg_1 in 'rg_1.pas' {Frg_1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Control de Oficios';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFmain, Fmain);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFscoage_bus, Fscoage_bus);
  Application.CreateForm(Tfscoage_alta, fscoage_alta);
  Application.CreateForm(TFscoage_edi, Fscoage_edi);
  Application.CreateForm(TFabout, Fabout);
  Application.CreateForm(Tfsco_age_aux, fsco_age_aux);
  Application.CreateForm(TFSCOconsultas, FSCOconsultas);
  Application.CreateForm(TFrg, Frg);
  Application.CreateForm(TfSco_age_busqueda, fSco_age_busqueda);
  Application.CreateForm(TFArchivo, FArchivo);
  Application.CreateForm(TFSArchivo, FSArchivo);
  Application.CreateForm(Tfscoalta, fscoalta);
  Application.CreateForm(TFscobus, Fscobus);
  Application.CreateForm(TFscoedi, Fscoedi);
  Application.CreateForm(TF_aux_imp, F_aux_imp);
  Application.CreateForm(TFcat_gru, Fcat_gru);
  Application.CreateForm(TFSCOALTAGRUPO, FSCOALTAGRUPO);
  Application.CreateForm(TFsco_alta_gru, Fsco_alta_gru);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFsco_imp_gru, Fsco_imp_gru);
  Application.CreateForm(TFSEGUIMIENTO, FSEGUIMIENTO);
  Application.CreateForm(TFSCO_AGE_AUX_BUS, FSCO_AGE_AUX_BUS);
  Application.CreateForm(TFsco_ins_gru, Fsco_ins_gru);
  Application.CreateForm(TFSCO_alta_age_grupo, FSCO_alta_age_grupo);
  Application.CreateForm(TFrg_1, Frg_1);
  Application.Run;
end.
