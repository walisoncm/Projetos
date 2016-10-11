unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBCustomDataSet, IBQuery, IBDatabase;

type
  TfDM = class(TDataModule)
    dsVisualizar: TDataSource;
    qrVisualizar: TIBQuery;
    DB: TIBDatabase;
    Transacao: TIBTransaction;
    qrVerifica: TIBQuery;
    tSORTEIOS: TIBDataSet;
    tSORTEIOSCONTADOR: TIntegerField;
    tSORTEIOSSORTEIO: TIntegerField;
    tSORTEIOSNUMBOLAO: TIntegerField;
    tSORTEIOSFIXOS: TIBStringField;
    tSORTEIOSVARIAVEIS: TIBStringField;
    tSORTEIOSDTBOLAO: TDateTimeField;
    tSORTEIOSDTDELETADO: TDateTimeField;
    tSORTEIOSDELETADO: TIBStringField;
    tSORTEIOSDTRESULTADO: TDateTimeField;
    tSORTEIOSRESULTADO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDM: TfDM;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
