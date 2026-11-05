unit SCO_auxiliar_alta_edicion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvImage, Vcl.StdCtrls, Vcl.Buttons, JvExtComponent, JvRollOut,
  Vcl.DBCtrls, JvExStdCtrls, JvCombobox, JvDBCombobox, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFSCO_auxiliar_alta_edicion = class(TForm)
    JvImage1: TJvImage;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    JvRollOut2: TJvRollOut;
    JvRollOut3: TJvRollOut;
    Encor: TEdit;
    BitBtn1: TBitBtn;
    ncor: TJvDBComboBox;
    tcor: TJvDBComboBox;
    BitBtn2: TBitBtn;
    ETcor: TEdit;
    BitBtn3: TBitBtn;
    Eccor: TEdit;
    ccor: TJvDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tcorChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    ntcor:integer;
    { Public declarations }
  end;

var
  FSCO_auxiliar_alta_edicion: TFSCO_auxiliar_alta_edicion;

implementation
uses main, d_m;

{$R *.dfm}

  procedure TFSCO_auxiliar_alta_edicion.BitBtn1Click(Sender: TObject);
    begin
      if dm.MyConnection1.Connected then
         begin
          dm.ncor.Insert;
          dm.ncor.FieldByName('ncor').AsString := trim (encor.Text);
          dm.ncor.Post;
          eccor.Text:= '';
          dm.ncor.Refresh;
            ncor.Items.Clear;
            dm.ncor.First;
             repeat
                 ncor.Items.Add(dm.ncor.FieldByName('ncor').AsString );
                 dm.ncor.Next;
             until dm.ncor.Eof;
         end;
    end;

  procedure TFSCO_auxiliar_alta_edicion.BitBtn2Click(Sender: TObject);
    begin
      if dm.MyConnection1.Connected then
         begin
          dm.tcor.Insert;
          dm.tcor.FieldByName('tcor').AsString := trim (etcor.Text);
          dm.tcor.Post;
          etcor.Text:= '';
          dm.tcor.Refresh;

            tcor.Items.Clear;
            dm.tcor.First;
             repeat
                 tcor.Items.Add(dm.tcor.FieldByName('tcor').AsString );
                 dm.tcor.Next;
             until dm.tcor.Eof;
         end;
    end;

  procedure TFSCO_auxiliar_alta_edicion.BitBtn3Click(Sender: TObject);
    begin
      if dm.MyConnection1.Connected then
         begin
             if ntcor > 0 then
              begin
                dm.ccor.Insert;
                dm.ccor.FieldByName('tcor').AsInteger := ntcor;
                dm.ccor.FieldByName('ccor').AsString := trim (eccor.Text);
                try
                  dm.ccor.Post;
                except
                   on E : Exception do
                      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
                end;
                eccor.Text:= '';
                dm.ccor.Refresh;
              end else
              begin
                ShowMessage('Para poder ingresar una clase de correspondencia es necesario primero elegir un tipo de correspondencia primero...');
              end;
         end;
    end;

  procedure TFSCO_auxiliar_alta_edicion.FormCreate(Sender: TObject);
    begin
       JvImage1.Picture.LoadFromFile(fmain.ruta+fmain.mmedia+ 'legislatura.png');
        if dm.MyConnection1.Connected then
          begin
            dm.ncor.First;
             repeat
                 ncor.Items.Add(dm.ncor.FieldByName('ncor').AsString );
                 dm.ncor.Next;
             until dm.ncor.Eof;
          end;

        if dm.MyConnection1.Connected then
          begin
            dm.tcor.First;
             repeat
                 tcor.Items.Add(dm.tcor.FieldByName('tcor').AsString );
                 dm.tcor.Next;
             until dm.tcor.Eof;
          end;

        if dm.MyConnection1.Connected then
          begin
            dm.ccor.First;
             repeat
                 ccor.Items.Add(dm.ccor.FieldByName('ccor').AsString );
                 dm.ccor.Next;
             until dm.ccor.Eof;
          end;
    end;

  procedure TFSCO_auxiliar_alta_edicion.tcorChange(Sender: TObject);
    begin
      if dm.MyConnection1.Connected then
          begin
              ntcor   :=  tcor.ItemIndex+1;
              dm.ccor.Close;
              dm.ccor.SQL.Clear;
              dm.ccor.SQL.Add('select * from ccor');
              dm.ccor.SQL.Add('where tcor = ' +  QuotedStr( inttostr( ntcor) )+'' );  // Aquí agrego un espacio antes del valor
              dm.ccor.Open;
             ccor.Items.Clear;
             dm.ccor.First;
             dm.ccor.First;
             repeat
                 ccor.Items.Add(dm.ccor.FieldByName('ccor').AsString );
                 dm.ccor.Next;
             until dm.ccor.Eof;
          end;
    end;

end.
