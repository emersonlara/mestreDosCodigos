unit DDD.Modulo.Impl.Adaptador.EntidadeDataSet;

interface

uses
  System.Generics.Collections, System.Rtti, Data.DB,
  FireDac.Comp.DataSet,
  DDD.Core.Intf.Entidade, DDD.Modulo.Intf.Adaptador;

type
  TNomeCampoPropriedade = TPair<String, TRttiProperty>;
  TNomeCampoPropriedadeDic = TDictionary<String, TRttiProperty>;

  TAdaptadorEntidadeDataSet<T: IEntidade> = class(TInterfacedObject, IAdaptador)
  private
    FDataSet: TFDDataSet;
    FEntidade: IEntidade;
    FPropriedadeCampoDic: TNomeCampoPropriedadeDic;
    procedure MapearPropriedadesFields;
    function RegistroJaExiste: boolean;
    procedure MapearPropriedadeField(const APropriedade: TRttiProperty);
    procedure InserirOuEditar;
  public
    class function New(const ADataSet: TFDDataSet; const AEntidade: T): IAdaptador;
    constructor Create(const ADataSet: TFDDataSet; const AEntidade: T);
    destructor Destroy; override;
    procedure Adaptar;
  end;

implementation

uses
  DDD.Anotacao.Entidade.Propriedade, System.SysUtils,
  pkgUtils.Impl.RttiUtils, pkgUtils.Impl.FDDataSetPropriedadesTemporarias,
  pkgUtils.Intf.DataSetPropriedadesTemporarias, DataSet.Constantes, DDD.Core.Intf.ID;

class function TAdaptadorEntidadeDataSet<T>.New(const ADataSet: TFDDataSet; const AEntidade: T): IAdaptador;
begin
  result := Create(ADataSet, AEntidade);
end;

constructor TAdaptadorEntidadeDataSet<T>.Create(const ADataSet: TFDDataSet; const AEntidade: T);
begin
  FDataSet := ADataSet;
  FEntidade := AEntidade;
  FPropriedadeCampoDic := TNomeCampoPropriedadeDic.Create();

  if not Assigned(FDataSet) then
    raise EArgumentNilException.Create('N�o foi informado um DataSet para a classe de Adapta��o');

  if not Assigned(FEntidade) then
    raise EArgumentNilException.Create('N�o foi informado uma Entidade para a classe de Adapta��o');

  MapearPropriedadesFields;
end;

destructor TAdaptadorEntidadeDataSet<T>.Destroy;
begin
  FPropriedadeCampoDic.Clear;
  FreeAndNil(FPropriedadeCampoDic);
  inherited;
end;

procedure TAdaptadorEntidadeDataSet<T>.MapearPropriedadesFields;
var
  _propriedades: TArray<TRttiProperty>;
  _propriedade: TRttiProperty;
begin
  _propriedades := RttiUtils.getProperties(FEntidade as TObject);
  for _propriedade in _propriedades do
  begin
    MapearPropriedadeField(_propriedade);
  end;
end;

procedure TAdaptadorEntidadeDataSet<T>.MapearPropriedadeField(const APropriedade: TRttiProperty);
var
  _anotacoes: TArray<TCustomAttribute>;
  _anotacao: TCustomAttribute;
  _anotacaoProp: TPropriedadeAttribute;
  _campo: TField;
begin
  _anotacoes := APropriedade.GetAttributes;
  for _anotacao in _anotacoes do
  begin
    if not(_anotacao is TPropriedadeAttribute) then
      continue;

    _anotacaoProp := (_anotacao as TPropriedadeAttribute);
    _campo := FDataSet.FindField(_anotacaoProp.NomePropriedade);

    if not Assigned(_campo) then
      continue;
    FPropriedadeCampoDic.Add(_campo.FieldName, APropriedade);
  end;
end;

procedure TAdaptadorEntidadeDataSet<T>.Adaptar;
var
  i: Integer;
  _propriedades: TArray<TRttiProperty>;
  _propriedade: TRttiProperty;
  _anotacao: TPropriedadeAttribute;
  _campoPropriedade: TNomeCampoPropriedade;
  _campo: TField;
  _atualizarChave: boolean;
begin
  InserirOuEditar;
  for _campoPropriedade in FPropriedadeCampoDic do
  begin
    _campo := FDataSet.FindField(_campoPropriedade.Key);
    _atualizarChave := (FDataSet.State = dsInsert) and _campoPropriedade.Key.Equals('ID');
    if _atualizarChave then
    begin
      _campo.AsInteger := (_campoPropriedade.Value.GetValue(FEntidade as TObject).AsInterface as IID).Valor;
      continue;
    end;
    if _campo.DataType in FieldTypeInteiro then
    begin
      _campo.AsInteger := _campoPropriedade.Value.GetValue(FEntidade as TObject).AsInteger;
      continue;
    end;
    if _campo.DataType in FieldTypeReal then
    begin
      _campo.AsFloat := _campoPropriedade.Value.GetValue(FEntidade as TObject).AsExtended;
      continue;
    end;
    if _campo.DataType in FieldTypeString then
    begin
      _campo.AsString := _campoPropriedade.Value.GetValue(FEntidade as TObject).AsString;
      continue;
    end;
    if _campo.DataType in [ftDateTime, ftDate] then
    begin
      _campo.AsDateTime := _campoPropriedade.Value.GetValue(FEntidade as TObject).AsType<TDateTime>;
      continue;
    end;
  end;
  FDataSet.Post;
end;

procedure TAdaptadorEntidadeDataSet<T>.InserirOuEditar;
begin
  if RegistroJaExiste then
    FDataSet.Edit
  else
    FDataSet.Insert;
end;

function TAdaptadorEntidadeDataSet<T>.RegistroJaExiste: boolean;
var
  _propriedadeID: TRttiProperty;
  _propriedadesTemporarias: IDataSetPropriedadesTemporarias;
begin
  _propriedadeID := FPropriedadeCampoDic.Items['ID'];
  if not Assigned(_propriedadeID) then
    exit;
  _propriedadesTemporarias := TFDDataSetPropriedadesTemporarias.New(FDataSet);
  FDataSet.IndexFieldNames := 'ID';

  result := FDataSet.FindKey([(_propriedadeID.GetValue(FEntidade as TObject).AsInterface as IID).Valor]);
end;

end.
