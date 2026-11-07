unit config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,  Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TFConfig = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfig: TFConfig;

implementation
uses main;

{$R *.dfm}


function VerificarDimensionesPNG(Const ww:integer; Const hh:integer;  const Archivo: string): Boolean;
var
  PNG: TPngImage;
begin
  Result := False;
  if LowerCase(ExtractFileExt(Archivo)) = '.png' then
  begin
    if FileExists(Archivo) then
    begin
      PNG := TPngImage.Create;
      try
        PNG.LoadFromFile(Archivo);

        if (PNG.Width = ww) and (PNG.Height = hh) then
          Result := True;
      finally
        PNG.Free;  // Libera el objeto TPngImage
      end;
    end;
  end;
end;
{**************************************************************************************************}
function RenameFileWithDateTime(const FilePath: string): Boolean;
var
  NewFileName, FileDir, FileName, FileExt: string;
  DateTimeStr: string;
begin
  FileDir := ExtractFileDir(FilePath);
  FileName := ChangeFileExt(ExtractFileName(FilePath), '');  // Nombre sin la extensión
  FileExt := ExtractFileExt(FilePath);  // Extensión del archivo
  DateTimeStr := FormatDateTime('yyyymmdd_hhnnss', Now);
  NewFileName := FileDir + '\' + FileName + '_' + DateTimeStr + FileExt;
  Result := RenameFile(FilePath, NewFileName);
  if not Result then
    Writeln('Error al renombrar el archivo: ' + SysErrorMessage(GetLastError));
end;

{**************************************************************************************************}
procedure ClearImage(Image: TImage);
begin
  Image.Picture := nil;
  Image.Repaint;
end;
{**************************************************************************************************}

function CopyAndRenameFile(const SourceFilePath, DestFilePath: string): Boolean;
begin
  Result := CopyFile(PChar(SourceFilePath), PChar(DestFilePath), False);
  if not Result then
    Writeln('Error al copiar y renombrar el archivo: ' + SysErrorMessage(GetLastError));
end;

{-------------------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------------------------------------}

procedure TFConfig.Button1Click(Sender: TObject);
var
 Success: Boolean;
begin
      if OpenDialog1.Execute then
        BEGIN
           if (VerificarDimensionesPNG(202,250, OpenDialog1.FileName )) then
           begin
               ClearImage(Image1);
               Success := RenameFileWithDateTime(fmain.ruta+fmain.mmedia+'ple.png');
               if not Success then
                 begin
                    ShowMessage('Error al renombrar el archivo.');
                 end;
                CopyAndRenameFile(OpenDialog1.FileName, fmain.ruta+fmain.mmedia+'ple.png');
                image1.Picture.LoadFromFile(OpenDialog1.FileName);

           end
           else
           begin
             ShowMessage('las dimenciones de la imagen deben se de 202 X 250');
           end;
        END;
end;

procedure TFConfig.Button2Click(Sender: TObject);
var
 Success: Boolean;
begin
      if OpenDialog1.Execute then
        BEGIN
           if (VerificarDimensionesPNG(389,193, OpenDialog1.FileName )) then
           begin
               ClearImage(Image2);
               Success := RenameFileWithDateTime(fmain.ruta+fmain.mmedia+'legislatura.png');
               if not Success then
                 begin
                    ShowMessage('Error al renombrar el archivo.');
                 end;
                CopyAndRenameFile(OpenDialog1.FileName, fmain.ruta+fmain.mmedia+'legislatura.png');
                image2.Picture.LoadFromFile(OpenDialog1.FileName);


           end
           else
           begin
             ShowMessage('las dimenciones de la imagen deben se de 389 X 193');
           end;
        END;

end;

procedure TFConfig.FormCreate(Sender: TObject);
begin //al crear la imagen
Image1.Picture.LoadFromFile(fmain.ruta+fmain.mmedia+'ple.png');
Image2.Picture.LoadFromFile(fmain.ruta+fmain.mmedia+'legislatura.png');

end;

procedure TFConfig.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[1].Text := fmain.PutDate;
 StatusBar1.Panels[2].Text := fmain.PutTime;

end;

end.
