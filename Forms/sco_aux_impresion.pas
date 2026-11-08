unit sco_aux_impresion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ppParameter, ppBands, ppMemo, ppStrtch, ppCtrls,
  jpeg, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDesignLayer, Data.DB, System.IOUtils, ImagenesReportes;

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
    ppParameterList1: TppParameterList;
    Rpetsol: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
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
    ppHeaderBand2: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
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
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppImage1: TppImage;
    ppImage3: TppImage;
    ppImage2: TppImage;
    ppLabel2: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function ValidarYObtenerRutaArchivo(const RutaRelativa: string): string;
    procedure ImprimirYActualizarTramite(Reporte: TppReport; LogoImage: TppImage; LabelTitle, LabelCopy: TppLabel);
  public
  end;

var
  F_aux_imp: TF_aux_imp;

implementation

uses login, d_m, scoage_alta, scoalta, about, rg, main;

{$R *.dfm}

{------------------------------------------------------------------------------}
{ Función privada para validar la existencia del archivo de imagen institucional}
{------------------------------------------------------------------------------}
function TF_aux_imp.ValidarYObtenerRutaArchivo(const RutaRelativa: string): string;
begin
  Result := TPath.Combine(fmain.ruta, RutaRelativa);
  if not FileExists(Result) then
  begin
    raise EFOpenError.CreateFmt(
      'Error crítico: El archivo de imagen requerido no existe.'#13#10 +
      'Archivo: %s'#13#10 +
      'Ruta esperada: %s',
      [ExtractFileName(Result), Result]
    );
  end;
end;

{------------------------------------------------------------------------------}
{ Método unificado para la lógica de impresión y actualización de trámite      }
{------------------------------------------------------------------------------}
procedure TF_aux_imp.ImprimirYActualizarTramite(Reporte: TppReport; LogoImage: TppImage; LabelTitle, LabelCopy: TppLabel);
var
  RutaLogo: string;
begin
  try
    RutaLogo := ValidarYObtenerRutaArchivo(fmain.mmedia + 'ple.png');
    LogoImage.Picture.LoadFromFile(RutaLogo);
  except
    on E: Exception do
    begin
      // Si el logo no se encuentra, se continúa la impresión sin interrumpir al usuario
    end;
  end;

  LabelTitle.Caption := fmain.Ttitle;
  LabelCopy.Caption := fmain.CopyRight;
  PrepararLogosImpresion(Self);
  Reporte.Print;

  if Assigned(dm) and Assigned(dm.QImpresion) and dm.MyConnection1.Connected then
  begin
    try
      dm.QImpresion.Edit;
      dm.QImpresion.FieldByName('tramite').AsBoolean := True;
      dm.QImpresion.FieldByName('FIAT').AsDateTime := StrToDate(fmain.PutDate);
      dm.QImpresion.FieldByName('Q_tra').AsString := dm.MyConnection1.Username;
      dm.QImpresion.Post;
    except
      on E: Exception do
      begin
        if dm.QImpresion.State in [dsEdit, dsInsert] then
          dm.QImpresion.Cancel;
      end;
    end;
  end;

  Close;
end;

{------------------------------------------------------------------------------}
{ Eventos de Botones                                                           }
{------------------------------------------------------------------------------}
procedure TF_aux_imp.Button1Click(Sender: TObject);
begin
  ImprimirYActualizarTramite(Rnormal, ppImage1, pplabel60, pplabel61);
end;

procedure TF_aux_imp.Button2Click(Sender: TObject);
begin
  ImprimirYActualizarTramite(Rpetsol, ppImage3, pplabel2, pplabel59);
end;

procedure TF_aux_imp.Button3Click(Sender: TObject);
begin
  ImprimirYActualizarTramite(Respecial, ppImage2, pplabel63, pplabel62);
end;

procedure TF_aux_imp.FormCreate(Sender: TObject);
begin
  F_aux_imp.Caption  := 'SISTEMA DE GESTIÓN Y TRÁNSITO DOCUMENTAL (SGTD / Agenda )';

end;

end.
