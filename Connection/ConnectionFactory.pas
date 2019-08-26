unit ConnectionFactory;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  FireDAC.DApt, Vcl.StdCtrls, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.VCLUI.Wait,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error;

type TConnectionFactory = class (TFDConnection)

  private
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1 : TFDPhysPgDriverLink;
  public
    Constructor Create_TConnectionFactory;
    procedure ConnectionDB; overload;
end;

implementation

{ TConnectionFactory }

constructor TConnectionFactory.Create_TConnectionFactory;
begin

end;

procedure TConnectionFactory.ConnectionDB;
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

end.
