unit ConnectionFactory;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  FireDAC.DApt, Vcl.StdCtrls, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.VCLUI.Wait,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, Pessoa, PessoaDAO;

type TConnectionFactory = class (TFDConnection)

  private
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1 : TFDPhysPgDriverLink;
    FPessoa : TPessoa;
    FPessoaDAO : TPessoaDAO;
  public
    Constructor Create_TConnectionFactory;
    procedure ConnectionDB; overload;
    function Connectar : Boolean;
end;

implementation

{ TConnectionFactory }

constructor TConnectionFactory.Create_TConnectionFactory;
begin
  FDConnection1 := TFDConnection.Create(nil);
  FDPhysPgDriverLink1 := TFDPhysPgDriverLink.Create(nil);
  FPessoa := TPessoa.Create(FDConnection1);
  FPessoaDAO := TPessoaDAO.Create_TPessoaDAO(FDConnection1);
end;

function TConnectionFactory.Connectar: Boolean;
begin
  ConnectionDB;
  FDConnection1.Connected := True;
  Result := FDConnection1.Connected;
end;

procedure TConnectionFactory.ConnectionDB;
begin
    FDConnection1.DriverName := 'PG';
    FDConnection1.Params.Values['Database']  := 'postgres';
    FDConnection1.Params.Values['User_Name'] := 'postgres';
    FDConnection1.Params.Values['Password']  := '#abc123#';
    FDConnection1.Params.Values['Server']    := 'localhost';
    FDConnection1.Params.Values['Port']      := '5432';

    FDPhysPgDriverLink1.DriverID := 'PG';
    FDPhysPgDriverLink1.VendorHome := ExtractFilePath(Application.ExeName) + 'pgbin32\';
    FDPhysPgDriverLink1.VendorLib := 'libpq.dll';
end;

end.
