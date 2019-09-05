unit PessoaDAO;

interface

uses FireDAC.Comp.Client, Firedac.Stan.Param, Pessoa;

type TPessoaDAO = class (TObject)

  private
    FConnection: TFDConnection;
  public
    Constructor Create_TPessoaDAO(pConnection: TFDConnection);
    procedure GravarPessoa(pPessoa : TPessoa);
    procedure EditarPessoa(pPessoa : TPessoa);
    procedure DeletarPessoa(idPessoa : int64);
    function RetornarPessoa(idPessoa : int64; var pPessoa : TPessoa): Boolean;
end;

implementation

{ TPessoaDAO }

constructor TPessoaDAO.Create_TPessoaDAO(pConnection: TFDConnection);
begin
  FConnection := pConnection;
end;

procedure TPessoaDAO.GravarPessoa(pPessoa: TPessoa);
var lQuery : TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConnection;
    lQuery.SQL.Add('INSERT INTO PESSOA (id, nome) VALUES (:id , :nome )');

    lQuery.ParamByName('id').AsInteger := pPessoa.FId;
    lQuery.ParamByName('nome').AsString := pPessoa.FNome;
    lQuery.ExecSQL;

  finally
    lQuery.Free;
  end;
end;

procedure TPessoaDAO.EditarPessoa(pPessoa: TPessoa);
var lQuery : TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConnection;
    lQuery.SQL.Add('UPDATE PESSOA SET nome = :nome WHERE id = :pIdPessoa');

    lQuery.ParamByName('nome').AsString := pPessoa.FNome;
    lQuery.ParamByName('pIdPessoa').AsInteger := pPessoa.FId;
    lQuery.ExecSQL;
  finally
    lQuery.Free;
  end;

end;

procedure TPessoaDAO.DeletarPessoa(idPessoa: int64);
var lQuery : TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConnection;
    lQuery.SQL.Add('DELETE FROM PESSOA WHERE id = :idPessoa ');

    lQuery.ParamByName('idPessoa').AsInteger := idPessoa;
    lQuery.ExecSQL;
  finally
    lQuery.Free;
  end;
end;

function TPessoaDAO.RetornarPessoa(idPessoa: int64; var pPessoa: TPessoa): Boolean;
var lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConnection;
    lQuery.SQL.Add('SELECT * FROM PESSOA WHERE id = :pIdPessoa');
    lQuery.ParamByName('pIdPessoa').AsInteger := idPessoa;
    lQuery.Open;
    Result := lQuery.RecordCount > 0;
    if Result then
    begin
      pPessoa.FId := idPessoa;
      pPessoa.FNome := lQuery.FieldByName('nome').AsString;

    end;
  finally
    lQuery.Free;
  end;

end;

end.
