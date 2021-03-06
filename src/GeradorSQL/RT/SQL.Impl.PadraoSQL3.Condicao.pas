unit SQL.Impl.PadraoSQL3.Condicao;

interface

uses
  System.Rtti,
  SQL.Enums,
  SQL.Impl.SQL,
  SQL.Intf.SQL,
  SQL.Intf.Condicao,
  SQL.Intf.Coluna;

type
  TSQL3Condicao = class(TSQL, ISQLCondicao)
  private
    FOperadorLogico: TOperadorLogico;
    FOperadorComparacao: TOperadorComparacao;
    FColuna: ISQLColuna;
    FValor: string;
  protected
    procedure ConstruirSQL; override;
  public
    constructor Create; override;
    class function New: ISQLCondicao; reintroduce;
    function getOperadorLogico: TOperadorLogico;
    function setColuna(const AColuna: ISQLColuna): ISQLCondicao;
    function setOperadorComparacao(const AOperadorComparacao: TOperadorComparacao): ISQLCondicao;
    function setOperadorLogico(const AOperadorLogico: TOperadorLogico): ISQLCondicao;
    function setValor(const AColuna: ISQL): ISQLCondicao; overload;
    function setValor(const AValor: TValue): ISQLCondicao; overload;
    function getColuna: ISQLColuna;
  end;

implementation

uses
  System.TypInfo,
  System.SysUtils,
  SQL.Mensagens;

{ TSQL3Condicao }

class function TSQL3Condicao.New: ISQLCondicao;
begin
  result := Create;
end;

constructor TSQL3Condicao.Create;
begin
  inherited;
  FOperadorLogico := olUnknow;
  FOperadorComparacao := ocUnknow;
  FColuna := nil;
  FValor := EmptyStr;
end;

function TSQL3Condicao.getColuna: ISQLColuna;
begin
  result := FColuna;
end;

function TSQL3Condicao.getOperadorLogico: TOperadorLogico;
begin
  result := FOperadorLogico;
end;

function TSQL3Condicao.setColuna(const AColuna: ISQLColuna): ISQLCondicao;
begin
  FColuna := AColuna;
  result := self;
end;

function TSQL3Condicao.setOperadorComparacao(const AOperadorComparacao: TOperadorComparacao)
  : ISQLCondicao;
begin
  FOperadorComparacao := AOperadorComparacao;
  result := self;
end;

function TSQL3Condicao.setOperadorLogico(const AOperadorLogico: TOperadorLogico): ISQLCondicao;
begin
  FOperadorLogico := AOperadorLogico;
  result := self;
end;
function TSQL3Condicao.setValor(const AValor: TValue): ISQLCondicao;
begin
  FValor := AValor.ToString;
  result := self;
end;

function TSQL3Condicao.setValor(const AColuna: ISQL): ISQLCondicao;
begin
  FValor := AColuna.ToString;
  result := self;
end;

procedure TSQL3Condicao.ConstruirSQL;
var
  _comparadoCom: string;
begin
  inherited;
  _comparadoCom := FOperadorComparacao.getSQLString;
  FTexto := Format('(%s %s %s)', [FColuna.ToString, _comparadoCom, FValor]);
end;

end.
