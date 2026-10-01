# ExerciseCatalogFilterOption

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | Código opaco de uma opção de filtro, emitido por &#x60;getExerciseCatalogFilters&#x60;. É vocabulário **aberto** lido da origem: não é enum, o app não o interpreta nem o traduz, e só o repassa e o compara por igualdade. |
**label** | **String** | Rótulo da opção, resolvido pelo servidor e exibido verbatim. |
**count** | **Int** | Contagem **global** da opção no catálogo inteiro, quando a origem informa. Não considera os outros filtros selecionados. Ausente significa \&quot;não sei\&quot;, nunca zero. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
