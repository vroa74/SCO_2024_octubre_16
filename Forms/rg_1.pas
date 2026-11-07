unit rg_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls;

type
  TFrg_1 = class(TForm)
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    DBMemo2: TDBMemo;
    Label1: TLabel;
    DBText1: TDBText;
    procedure Panel1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frg_1: TFrg_1;

implementation
uses d_m, main, rg;

{$R *.dfm}

procedure TFrg_1.Panel1DblClick(Sender: TObject);
begin
    close;
end;

end.
