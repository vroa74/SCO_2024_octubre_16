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
    Image1: TImage;
    Label2: TLabel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image2: TImage;
    Image6: TImage;
    function GetComputerName : String;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
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
procedure TFabout.Panel1Click(Sender: TObject);
begin

end;

{------------------------------------------------------------------------------}




procedure TFabout.Button1Click(Sender: TObject);
begin
 Close;
end;

procedure TFabout.FormCreate(Sender: TObject);

begin
    Application.ProcessMessages;
    panel2.Caption :=  fmain.title;
// Label1.Caption := IntToStr(id)+'  ' +IntToStr(Fabout.id) ;
//  fabout.sfFlashPlayer1.Movie := fmain.ruta + 'About.swf';
 // fabout.sfFlashPlayer1.Play;
 end;


end.
