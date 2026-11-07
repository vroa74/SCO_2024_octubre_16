unit ConsultasUI;

interface

uses
  System.Classes, Vcl.Forms, Vcl.ExtCtrls;

type
  TConsultaDiferida = class(TComponent)
  private
    FTimer: TTimer;
    FFormulario: TCustomForm;
    FConsulta: TNotifyEvent;
    procedure Ejecutar(Sender: TObject);
  public
    constructor Create(AFormulario: TCustomForm; AConsulta: TNotifyEvent); reintroduce;
    procedure Solicitar(AIntervalo: Cardinal = 300);
    procedure Cancelar;
  end;

implementation

constructor TConsultaDiferida.Create(AFormulario: TCustomForm;
  AConsulta: TNotifyEvent);
begin
  inherited Create(AFormulario);
  FFormulario := AFormulario;
  FConsulta := AConsulta;
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.Interval := 300;
  FTimer.OnTimer := Ejecutar;
end;

procedure TConsultaDiferida.Solicitar(AIntervalo: Cardinal);
begin
  Cancelar;
  FTimer.Interval := AIntervalo;
  if FFormulario.Visible and not (csDestroying in ComponentState) then
    FTimer.Enabled := True;
end;

procedure TConsultaDiferida.Cancelar;
begin
  FTimer.Enabled := False;
end;

procedure TConsultaDiferida.Ejecutar(Sender: TObject);
begin
  Cancelar;
  if FFormulario.Visible and Assigned(FConsulta) then
    FConsulta(Self);
end;

end.
