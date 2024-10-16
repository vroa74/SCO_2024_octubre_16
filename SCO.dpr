program SCO;

uses
  Forms,
  main in 'main.pas' {Fmain},
  d_m in 'd_m.pas' {DM: TDataModule},
  login in 'login.pas' {FLogin},
  SCOAlta in 'Forms\SCOAlta.pas' {fscoalta},
  scoage_alta in 'Forms\scoage_alta.pas' {fscoage_alta},
  about in 'Forms\about.pas' {Fabout},
  RG in 'Forms\RG.pas' {Frg},
  Archivo in 'Forms\Archivo.pas' {FArchivo},
  SArchivo in 'Forms\SArchivo.pas' {FSArchivo},
  SCOALTAGRUPO in 'Forms\SCOALTAGRUPO.pas' {FSCOALTAGRUPO},
  sco_alta_gru in 'Forms\sco_alta_gru.pas' {Fsco_alta_gru},
  SCO_alta_age_grupo in 'Forms\SCO_alta_age_grupo.pas' {FSCO_alta_age_grupo},
  sco_aux_impresion in 'Forms\sco_aux_impresion.pas' {F_aux_imp},
  sco_bus_gru in 'Forms\sco_bus_gru.pas' {Form1},
  sco_imp_gru in 'Forms\sco_imp_gru.pas' {Fsco_imp_gru},
  sco_ins_gru in 'Forms\sco_ins_gru.pas' {Fsco_ins_gru},
  sco_alta_gru_per in 'Forms\sco_alta_gru_per.pas' {Fsco_alta_gru_per},
  SEGUIMIENTO in 'Forms\SEGUIMIENTO.pas' {FSEGUIMIENTO},
  rg_1 in 'Forms\rg_1.pas' {Frg_1},
  scoconsultas in 'Forms\scoconsultas.pas' {FSCOconsultas},
  scoage_edi in 'Forms\scoage_edi.pas' {Fscoage_edi},
  scoage_bus in 'Forms\scoage_bus.pas' {Fscoage_bus},
  scobus in 'Forms\scobus.pas' {Fscobus},
  scoedi in 'Forms\scoedi.pas' {Fscoedi},
  SCO_AGE_AUX_BUS in 'Forms\SCO_AGE_AUX_BUS.pas' {FSCO_AGE_AUX_BUS},
  sco_age_aux in 'Forms\sco_age_aux.pas' {fsco_age_aux},
  sco_cat_grupo in 'Forms\sco_cat_grupo.pas' {Fcat_gru},
  config in 'Forms\config.pas' {FConfig},
  Reportearchivar in 'Forms\Reportearchivar.pas' {FReportearchivar},
  RG_historico in 'Forms\RG_historico.pas' {FRG_historico},
  SCO_auxiliar_alta_edicion in 'Forms\SCO_auxiliar_alta_edicion.pas' {FSCO_auxiliar_alta_edicion};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Control de Oficios';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFmain, Fmain);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(Tfscoage_alta, fscoage_alta);
  Application.CreateForm(TFabout, Fabout);
  Application.CreateForm(TFrg, Frg);
  Application.CreateForm(TFArchivo, FArchivo);
  Application.CreateForm(TFSArchivo, FSArchivo);
  Application.CreateForm(Tfscoalta, fscoalta);
  Application.CreateForm(TFSCOALTAGRUPO, FSCOALTAGRUPO);
  Application.CreateForm(TFsco_alta_gru, Fsco_alta_gru);
  Application.CreateForm(TFSCO_alta_age_grupo, FSCO_alta_age_grupo);
  Application.CreateForm(TF_aux_imp, F_aux_imp);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFsco_imp_gru, Fsco_imp_gru);
  Application.CreateForm(TFsco_ins_gru, Fsco_ins_gru);
  Application.CreateForm(TFsco_alta_gru_per, Fsco_alta_gru_per);
  Application.CreateForm(TFSEGUIMIENTO, FSEGUIMIENTO);
  Application.CreateForm(TFrg_1, Frg_1);
  Application.CreateForm(TFSCOconsultas, FSCOconsultas);
  Application.CreateForm(TFSCOconsultas, FSCOconsultas);
  Application.CreateForm(TFscoage_bus, Fscoage_bus);
  Application.CreateForm(TFscoage_edi, Fscoage_edi);
  Application.CreateForm(TFscoage_bus, Fscoage_bus);
  Application.CreateForm(TFscobus, Fscobus);
  Application.CreateForm(TFscoedi, Fscoedi);
  Application.CreateForm(TFSCO_AGE_AUX_BUS, FSCO_AGE_AUX_BUS);
  Application.CreateForm(Tfsco_age_aux, fsco_age_aux);
  Application.CreateForm(TFcat_gru, Fcat_gru);
  Application.CreateForm(TFConfig, FConfig);
  Application.CreateForm(TFReportearchivar, FReportearchivar);
  Application.CreateForm(TFRG_historico, FRG_historico);
  Application.CreateForm(TFSCO_auxiliar_alta_edicion, FSCO_auxiliar_alta_edicion);
  Application.Run;
end.
