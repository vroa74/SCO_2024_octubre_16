unit sco_aux_impresion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ppParameter, ppBands, ppMemo, ppStrtch, ppCtrls,
  jpeg, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe;

type
  TF_aux_imp = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ppDBPipeline1: TppDBPipeline;
    Respecial: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppImage2: TppImage;
    ppLine9: TppLine;
    ppDetailBand2: TppDetailBand;
    ppShape12: TppShape;
    ppShape11: TppShape;
    ppShape10: TppShape;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppLabel33: TppLabel;
    ppMemo1: TppMemo;
    ppShape3: TppShape;
    ppLabel31: TppLabel;
    ppShape4: TppShape;
    ppLabel53: TppLabel;
    ppDBText7: TppDBText;
    ppDBText26: TppDBText;
    ppLabel55: TppLabel;
    ppDBText29: TppDBText;
    ppDBText16: TppDBText;
    ppDBText30: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppParameterList1: TppParameterList;
    Rpetsol: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppImage3: TppImage;
    ppLine8: TppLine;
    ppLabel58: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShape15: TppShape;
    ppShape14: TppShape;
    ppShape13: TppShape;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel47: TppLabel;
    ppDBMemo5: TppDBMemo;
    ppLabel48: TppLabel;
    ppDBText20: TppDBText;
    ppMemo2: TppMemo;
    ppLabel49: TppLabel;
    ppShape5: TppShape;
    ppLabel51: TppLabel;
    ppShape6: TppShape;
    ppLabel54: TppLabel;
    ppDBText17: TppDBText;
    ppDBText27: TppDBText;
    ppLabel50: TppLabel;
    ppDBText33: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppParameterList2: TppParameterList;
    Rnormal: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppImage1: TppImage;
    ppLine5: TppLine;
    ppLine2: TppLine;
    ppLine11: TppLine;
    ppLabel35: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppShape7: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape1: TppShape;
    ppLabel15: TppLabel;
    ppShape2: TppShape;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText6: TppDBText;
    ppDBText3: TppDBText;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText10: TppDBText;
    ppLabel52: TppLabel;
    ppLabel16: TppLabel;
    ppDBText8: TppDBText;
    ppDBText28: TppDBText;
    ppDBText31: TppDBText;
    ppLabel56: TppLabel;
    ppDBText32: TppDBText;
    ppLabel57: TppLabel;
    ppDBMemo6: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_aux_imp: TF_aux_imp;

implementation
uses login, d_m, scoage_alta, scoage_edi, scoage_bus, scoalta, scoedi, scobus, scoconsultas, about, rg,  Archivo, SArchivo, main;


{$R *.dfm}

procedure TF_aux_imp.Button1Click(Sender: TObject);
begin
       Rnormal.Print;
       dm.QImpresion.Edit;
       dm.QImpresion.FieldByName('tramite').AsBoolean := true;
       dm.QImpresion.FieldByName('FIAT').AsDateTime := StrToDate(fmain.PutDate);
       dm.QImpresion.FieldByName('Q_tra').AsString := dm.MyConnection1.Username;
       dm.QImpresion.Post;
       close;
end;

procedure TF_aux_imp.Button2Click(Sender: TObject);
begin
       Rpetsol.Print;
       dm.QImpresion.Edit;
       dm.QImpresion.FieldByName('tramite').AsBoolean := true;
       dm.QImpresion.FieldByName('FIAT').AsDateTime := StrToDate(fmain.PutDate);
       dm.QImpresion.FieldByName('Q_tra').AsString := dm.MyConnection1.Username;
       dm.QImpresion.Post;
       close;

end;

procedure TF_aux_imp.Button3Click(Sender: TObject);
begin
       Respecial.Print;
       dm.QImpresion.Edit;
       dm.QImpresion.FieldByName('tramite').AsBoolean := true;
       dm.QImpresion.FieldByName('FIAT').AsDateTime := StrToDate(fmain.PutDate);
       dm.QImpresion.FieldByName('Q_tra').AsString := dm.MyConnection1.Username;
       dm.QImpresion.Post;
       close;
end;

end.
