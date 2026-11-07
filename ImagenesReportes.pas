unit ImagenesReportes;

interface

uses System.Classes;

procedure PrepararLogosImpresion(APropietario: TComponent);

implementation

uses Winapi.Windows, Vcl.Graphics, Vcl.Imaging.jpeg, ppCtrls;

{$R ImagenesReportes.res}

var
  LogoReporte: TJPEGImage;

procedure PrepararLogosImpresion(APropietario: TComponent);
var
  I: Integer;
  Recurso: TResourceStream;
  Imagen: TppImage;
begin
  if LogoReporte = nil then
  begin
    LogoReporte := TJPEGImage.Create;
    try
      Recurso := TResourceStream.Create(HInstance, 'LOGO_SGTD', RT_RCDATA);
      try
        LogoReporte.LoadFromStream(Recurso);
      finally
        Recurso.Free;
      end;
    except
      LogoReporte.Free;
      LogoReporte := nil;
      raise;
    end;
  end;
  for I := 0 to APropietario.ComponentCount - 1 do
    if APropietario.Components[I] is TppImage then
    begin
      Imagen := TppImage(APropietario.Components[I]);
      // Mantener los logotipos que el usuario cargo desde la configuracion.
      if Imagen.Picture.Graphic = nil then
        Imagen.Picture.Assign(LogoReporte);
    end;
end;

initialization
  LogoReporte := nil;

finalization
  LogoReporte.Free;

end.
