program all;

uses
  Vcl.Forms,
  main_p in 'main_p.pas' {Form1},
  Reportearchivar in 'Reportearchivar.pas' {FArchivar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFArchivar, FArchivar);
  Application.Run;
end.
