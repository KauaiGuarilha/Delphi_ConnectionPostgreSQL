unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  FireDAC.DApt, Vcl.StdCtrls, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.VCLUI.Wait,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, ConnectionFactory;

type
  TForm1 = class(TForm)
    DBGPessoa: TDBGrid;
    edtNumero: TEdit;
    edtNome: TEdit;
    btnIncluir: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FConnectionFactory : TConnectionFactory;
    FDConnection1 : TFDConnection;
    FDQuery1 : TFDQuery;
    DataSource1 : TDataSource;
  public
    procedure ConectarTabela;
   // procedure InserirCadP;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FConnectionFactory := TConnectionFactory.Create_TConnectionFactory;
  FConnectionFactory.ConnectionDB;
  ConectarTabela;
end;

procedure TForm1.btnIncluirClick(Sender: TObject);
begin
  //InserirCadP;
end;

procedure TForm1.ConectarTabela;
begin
  DataSource1 := TDataSource.Create(nil);

  DataSource1.DataSet := FConnectionFactory.CriarQuery;
  DBGPessoa.DataSource := DataSource1;

  FConnectionFactory.CriarQuery.Open('select * from pessoa');
end;


end.

