program Project1;

uses
  Forms,
  main in 'main.pas' {Fmain},
  d_m in 'd_m.pas' {DM: TDataModule},
  login in 'login.pas' {FLogin},
  scoalta in 'scoalta.pas' {Form1},
  scobus in 'scobus.pas' {Form2},
  scoedi in 'scoedi.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFmain, Fmain);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
