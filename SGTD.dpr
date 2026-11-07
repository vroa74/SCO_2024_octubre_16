program SGTD;

uses
  Forms,
  main in 'main.pas' {Fmain},
  d_m in 'd_m.pas' {DM: TDataModule},
  login in 'login.pas' {FLogin},
  SCOAlta in 'Forms\SCOAlta.pas' {fscoalta},
  scoage_alta in 'Forms\scoage_alta.pas' {fscoage_alta},
  about in 'Forms\about.pas' {Fabout},
  RG in 'Forms\RG.pas' {Frg},
  sco_aux_impresion in 'Forms\sco_aux_impresion.pas' {F_aux_imp},
  rg_1 in 'Forms\rg_1.pas' {Frg_1},
  scoage_bus in 'Forms\scoage_bus.pas' {Fscoage_bus},
  sco_cat_grupo in 'Forms\sco_cat_grupo.pas' {Fcat_gru},
  config in 'Forms\config.pas' {FConfig},
  Reportearchivar in 'Forms\Reportearchivar.pas' {FReportearchivar},
  RG_historico in 'Forms\RG_historico.pas' {FRG_historico},
  SCO_auxiliar_alta_edicion in 'Forms\SCO_auxiliar_alta_edicion.pas' {FSCO_auxiliar_alta_edicion},
  sco_age_aux in 'Forms\sco_age_aux.pas' {fsco_age_aux},
  scoconsultas in 'Forms\scoconsultas.pas' {FSCOconsultas};

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
  Application.CreateForm(Tfscoalta, fscoalta);
  Application.CreateForm(TF_aux_imp, F_aux_imp);
  Application.CreateForm(TFrg_1, Frg_1);
  Application.CreateForm(TFscoage_bus, Fscoage_bus);
  Application.CreateForm(TFscoage_bus, Fscoage_bus);
  Application.CreateForm(TFcat_gru, Fcat_gru);
  Application.CreateForm(TFConfig, FConfig);
  Application.CreateForm(TFReportearchivar, FReportearchivar);
  Application.CreateForm(TFRG_historico, FRG_historico);
  Application.CreateForm(TFSCO_auxiliar_alta_edicion, FSCO_auxiliar_alta_edicion);
  Application.CreateForm(Tfsco_age_aux, fsco_age_aux);
  Application.CreateForm(TFSCOconsultas, FSCOconsultas);
  Application.CreateForm(TFSCOconsultas, FSCOconsultas);
  Application.Run;
end.
