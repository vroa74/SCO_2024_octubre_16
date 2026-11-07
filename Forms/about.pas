unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExExtCtrls, JvImage, StdCtrls, acPNG;

type
  TFabout = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    BotonLicencia: TButton;
    ScrollTexto: TScrollBox;
    function GetComputerName : String;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure BotonLicenciaClick(Sender: TObject);
  private
    FTextoOriginal: string;
    FMostrandoLicencia: Boolean;
    procedure MostrarTexto(const ATexto: string);
  public
  id: integer;
    { Public declarations }
  end;

var
  Fabout: TFabout;

implementation
uses main;

{$R *.dfm}
{------------------------------------------------------------------------------}
function TFabout.GetComputerName : String;
var
   pcComputer : PChar;
   dwCSize    : DWORD;
begin
   dwCSize := MAX_COMPUTERNAME_LENGTH + 1;
   GetMem( pcComputer, dwCSize );
   try
      if Windows.GetComputerName( pcComputer, dwCSize ) then
         Result := pcComputer;
   finally
      FreeMem( pcComputer );
   end;
end;
procedure TFabout.Panel1Click(Sender: TObject);
begin

end;

{------------------------------------------------------------------------------}




procedure TFabout.Button1Click(Sender: TObject);
begin
 Close;
end;

procedure TFabout.MostrarTexto(const ATexto: string);
begin
  ScrollTexto.VertScrollBar.Position := 0;
  Label2.Caption := ATexto;
  ScrollTexto.VertScrollBar.Position := 0;
end;

procedure TFabout.BotonLicenciaClick(Sender: TObject);
var
  RutaLicencia: string;
  TextoLicencia: TStringList;
begin
  if FMostrandoLicencia then
  begin
    MostrarTexto(FTextoOriginal);
    FMostrandoLicencia := False;
    BotonLicencia.Caption := 'Licencia';
    Exit;
  end;

  RutaLicencia := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
    'dll\chkdsk.dll';
  // Compatibilidad con el nombre del documento desplegado actualmente.
  if not FileExists(RutaLicencia) then
    RutaLicencia := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
      'dll\LICENCIAS.dll';
  TextoLicencia := TStringList.Create;
  try
    try
      // Es un documento Markdown UTF-8, no una biblioteca ejecutable.
      TextoLicencia.LoadFromFile(RutaLicencia, TEncoding.UTF8);
      MostrarTexto(StringReplace(TextoLicencia.Text, '#', '', [rfReplaceAll]));
      FMostrandoLicencia := True;
      BotonLicencia.Caption := 'About';
    except
      on E: Exception do
        ShowMessage('No se pudo leer la licencia en ' + RutaLicencia +
          sLineBreak + E.Message);
    end;
  finally
    TextoLicencia.Free;
  end;
end;

procedure TFabout.FormCreate(Sender: TObject);
begin
  Panel2.Caption := Fmain.title;
  FTextoOriginal := Label2.Caption;
  FMostrandoLicencia := False;
  BotonLicencia.Caption := 'Licencia';
end;

end.
