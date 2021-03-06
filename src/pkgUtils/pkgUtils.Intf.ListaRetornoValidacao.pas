unit pkgUtils.Intf.ListaRetornoValidacao;

interface

type
  TRetornoValidacao = record
    CodigoRetorno: integer;
    MensagemDeErro: string;
  end;

  IListaRetornoValidacao = Interface(IInterface)
    ['{ABF2058A-71CA-4484-A174-88B5955BD36B}']
    function getQtd: integer;
    function getValidacao(const Numero: integer): TRetornoValidacao;
    function EstaVazio: boolean;
    function ToString: string;
    procedure AddListaValidacoes(const AListaValidacoes: IListaRetornoValidacao);
    procedure AdicionarRetorno(const ARetornoValidacao: TRetornoValidacao);
  end;

implementation

end.
