unit Pessoa;

interface

type TPessoa = class

  private
    id : Integer;
    nome : String;
    function getId: Integer;
    function getNome: String;
    procedure setID(const Value: Integer);
    procedure setNome(const Value: String);
  public
    property FId : Integer read getId write setID;
    property FNome : String read getNome write setNome;

end;

implementation

{ TPessoaDAO }

function TPessoa.getId: Integer;
begin
  result := id;
end;

function TPessoa.getNome: String;
begin
  result := nome;
end;

procedure TPessoa.setID(const Value: Integer);
begin
  id := Value;
end;

procedure TPessoa.setNome(const Value: String);
begin
  nome := Value;
end;

end.
