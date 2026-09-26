# SyncCommandResult

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**commandId** | **String** | Identificador UUIDv7 em minúsculas, **gerado no device** e reutilizado em toda retentativa. Usado para &#x60;batchId&#x60;, &#x60;commandId&#x60;, &#x60;causationCommandId&#x60; e &#x60;replacementCommandId&#x60;. Opaco para o servidor: o timestamp embutido não ordena commands nem arbitra conflito. |
**status** | [**SyncCommandResultStatus**](SyncCommandResultStatus.md) |  |
**code** | **String** | Código de máquina estável da razão, presente em &#x60;RETRYABLE_FAILURE&#x60; e &#x60;FINAL_FAILURE&#x60;. Autoridade de decisão do cliente; nenhuma copy trafega no resultado do item. | [optional]
**retryAfterSeconds** | **Int** | Espera mínima sugerida, em segundos, antes de reenviar um &#x60;RETRYABLE_FAILURE&#x60;. | [optional]
**result** | [**SyncEntityItem**](SyncEntityItem.md) |  | [optional]
**conflict** | [**SyncConflict**](SyncConflict.md) |  | [optional]
**problem** | [**ProblemDetails**](ProblemDetails.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
