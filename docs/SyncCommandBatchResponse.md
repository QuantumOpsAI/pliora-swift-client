# SyncCommandBatchResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**batchId** | **String** | Identificador UUIDv7 em minúsculas, **gerado no device** e reutilizado em toda retentativa. Usado para &#x60;batchId&#x60;, &#x60;commandId&#x60;, &#x60;causationCommandId&#x60; e &#x60;replacementCommandId&#x60;. Opaco para o servidor: o timestamp embutido não ordena commands nem arbitra conflito. |
**serverTime** | **Date** | Instante do servidor; o único campo que pode diferir entre a primeira execução e o replay. |
**results** | [SyncCommandResult] | Um resultado por command enviado, na ordem do lote. |
**changesAvailable** | **Bool** | Dica: há entrada nova no escopo do ator desde &#x60;knownCursor&#x60;. &#x60;null&#x60; quando o lote não informou &#x60;knownCursor&#x60;. Nunca substitui &#x60;GET /sync/changes&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
