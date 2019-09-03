program ProjetoFireDac;

uses
  Vcl.Forms,
  uPrincipal in 'View\uPrincipal.pas' {Form1},
  ConnectionFactory in 'Connection\ConnectionFactory.pas',
  PessoaDAO in 'DAO\PessoaDAO.pas',
  Pessoa in 'Model\Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
