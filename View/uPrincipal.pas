unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  FireDAC.DApt, Vcl.StdCtrls, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.VCLUI.Wait,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DBGPessoa: TDBGrid;
    btnAbrirTab: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnAbrirTabClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FDConnection1 : TFDConnection;
    procedure ConectarTabela;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAbrirTabClick(Sender: TObject);
begin
   ConectarTabela;
end;

procedure TForm1.Button1Click(Sender: TObject);
var FDPhysPgDriverLink1 : TFDPhysPgDriverLink;

begin
  FDPhysPgDriverLink1 := TFDPhysPgDriverLink.Create(nil);
  FDConnection1 := TFDConnection.Create(nil);
  try
    FDPhysPgDriverLink1.VendorHome := ExtractFilePath(Application.ExeName) + 'pgbin32\';
    FDPhysPgDriverLink1.VendorLib := 'libpq.dll';
    FDPhysPgDriverLink1.DriverID := 'PG';

    FDPhysPgDriverLink1.Release;

    FDConnection1.Connected := false;

    FDConnection1.DriverName := 'PG';
    FDConnection1.Params.Values['Database']  := 'postgres';
    FDConnection1.Params.Values['User_Name'] := 'postgres';
    FDConnection1.Params.Values['password']  := '#abc123#';
    FDConnection1.Params.Values['Server']    := 'localhost';
    FDConnection1.Params.Values['Port']      := '5432';

    FDConnection1.Connected := true;
    finally
      FDPhysPgDriverLink1.Free;
    end;
end;

procedure TForm1.ConectarTabela;
var FDQuery1 : TFDQuery;
    DataSource1 : TDataSource;
begin
  FDQuery1 := TFDQuery.Create(nil);              // Criando a Query
  DataSource1 := TDataSource.Create(nil);        // Criando o DataSource


  FDQuery1.Connection := FDConnection1;
  DataSource1.DataSet := FDQuery1;               // Ligando o DataSource no FDQuery
  DBGPessoa.DataSource := DataSource1;           // Ligando a tabela no DataSource

  FDQuery1.Open('select * from pessoa');
end;

end.
