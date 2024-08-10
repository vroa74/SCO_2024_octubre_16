unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExExtCtrls, JvImage, StdCtrls;

type
  TFabout = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    function GetComputerName : String;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
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
{------------------------------------------------------------------------------}




procedure TFabout.Button1Click(Sender: TObject);
begin
 Close;
end;

procedure TFabout.FormCreate(Sender: TObject);

begin
    Application.ProcessMessages;
// Label1.Caption := IntToStr(id)+'  ' +IntToStr(Fabout.id) ;
//  fabout.sfFlashPlayer1.Movie := fmain.ruta + 'About.swf';
 // fabout.sfFlashPlayer1.Play;
 end;


end.
