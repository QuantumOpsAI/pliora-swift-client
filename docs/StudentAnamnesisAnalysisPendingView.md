# StudentAnamnesisAnalysisPendingView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**asOf** | **Date** | Instante do servidor em que a pendência foi calculada — o corte da leitura, nunca o relógio do aparelho, o instante de um ato do caso nem o momento de entrega de um push. |
**state** | [**StudentAnamnesisAnalysisPendingState**](StudentAnamnesisAnalysisPendingState.md) |  |
**nextAction** | [**StudentAnamnesisAnalysisPendingNextAction**](StudentAnamnesisAnalysisPendingNextAction.md) |  |
**caseId** | **String** | Referência opaca do caso atual — presente se e somente se há destino autorizado, isto é, &#x60;state&#x60; diferente de &#x60;NO_PENDING&#x60;. É o alvo do toque na pendência: o app relê o caso no destino protegido, que revalida vínculo e permissão — nem push entregue nem resposta cacheada autorizam. Ausente em &#x60;NO_PENDING&#x60;; o cliente nunca o inventa nem o deriva de outra leitura. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
