unit uSQLColunaTeste;

interface

uses
  DUnitX.TestFramework,
  System.SysUtils,
  DesignPattern.Builder.Intf.Director,
  SQL.Intf.Tabela,
  SQL.Intf.Tabela.Builder,
  SQL.Intf.Coluna,
  SQL.Intf.Coluna.Builder,
  Teste.Builder.Tabela,
  Teste.Constantes;

type

  [TestFixture]
  TSQLColunaTeste = class(TObject)
  private
    FDirectorColuna: IDirector<IBuilderColuna, ISQLColuna>;
    FDirectorTabela: IDirector<IBuilderTabela, ISQLTabela>;
    function getColunaSimples: ISQLColuna;
    function getColunaComTabela: ISQLColuna;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure ColunaSimples;
    [Test]
    procedure ColunaSimplesComTabela;
    [Test]
    procedure ColunaComAlias;
    [Test]
    procedure ColunaComAliasETabela;
  end;

implementation

uses
  SQL.Enums,
  SQL.Impl.Coluna.Director,
  SQL.Impl.Tabela.Director,
  Teste.Builder.Coluna;

procedure TSQLColunaTeste.ColunaComAlias;
var
  _coluna: ISQLColuna;
begin
  _coluna := getColunaSimples;
  _coluna.setColuna(COLUNA_COM_ALIAS);
  _coluna.setNomeVirtual(COLUNA_NOME_VIRTUAL);

  Assert.AreEqual(Format('%s as %s', [COLUNA_COM_ALIAS, COLUNA_NOME_VIRTUAL]),
    _coluna.ToString);
end;

procedure TSQLColunaTeste.ColunaComAliasETabela;
var
  _coluna: ISQLColuna;
begin
  _coluna := getColunaComTabela;
  _coluna.setColuna(COLUNA_COM_ALIAS);
  _coluna.setNomeVirtual(COLUNA_NOME_VIRTUAL);

  Assert.AreEqual(Format('%s.%s as %s', [TABELA_SEM_ALIAS, COLUNA_COM_ALIAS, COLUNA_NOME_VIRTUAL]),
    _coluna.ToString);
end;

procedure TSQLColunaTeste.ColunaSimples;
begin
  Assert.AreEqual(COLUNA_SEM_ALIAS, getColunaSimples.ToString);
end;

procedure TSQLColunaTeste.ColunaSimplesComTabela;
begin
  Assert.AreEqual(
    Format('%s.%s', [TABELA_SEM_ALIAS, COLUNA_SEM_ALIAS]),
    getColunaComTabela.ToString);
end;

function TSQLColunaTeste.getColunaComTabela: ISQLColuna;
var
  _builderColuna: IBuilderColuna;
  _builderTabela: IBuilderTabela;
begin
  _builderColuna := TCBColunaSimples.New;
  _builderColuna.SetOtimizarPara(OTIMIZAR_PARA);

  _builderTabela := TCBTabelaComNomeApenas.New;
  _builderTabela.SetOtimizarPara(OTIMIZAR_PARA);

  FDirectorColuna.setBuilder(_builderColuna);
  FDirectorTabela.setBuilder(_builderTabela);

  FDirectorColuna.construir;
  FDirectorTabela.construir;

  result := FDirectorColuna.getObjetoPronto;
  result.setTabela(FDirectorTabela.getObjetoPronto);
end;

function TSQLColunaTeste.getColunaSimples: ISQLColuna;
var
  _builder: IBuilderColuna;
begin
  _builder := TCBColunaSimples.New;

  FDirectorColuna.setBuilder(_builder);
  FDirectorColuna.construir;
  result := FDirectorColuna.getObjetoPronto;

end;

procedure TSQLColunaTeste.Setup;
begin
  FDirectorTabela := TDirectorTabela.New;
  FDirectorColuna := TDirectorColuna.New;
end;

procedure TSQLColunaTeste.TearDown;
begin

end;

initialization

TDUnitX.RegisterTestFixture(TSQLColunaTeste);

end.
