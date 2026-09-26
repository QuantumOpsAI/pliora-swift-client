# SyncCommandBatchRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**batchId** | **String** | Identidade UUIDv7 do lote, igual ao valor enviado em &#x60;Idempotency-Key&#x60;. Reenvio com o mesmo corpo repete a resposta original; com corpo diferente é &#x60;409 SYNC_BATCH_IDEMPOTENCY_CONFLICT&#x60;. |
**syncTrigger** | [**SyncTrigger**](SyncTrigger.md) |  |
**device** | [**DeviceContext**](DeviceContext.md) |  |
**knownCursor** | **String** | Último cursor de delta que o device materializou, **emitido pelo servidor** e ecoado como recebido. Serve somente para a dica &#x60;changesAvailable&#x60;; nunca é criado nem alterado pelo cliente. | [optional]
**commands** | [SyncCommandEnvelope] | Commands do lote, na ordem causal, entre 1 e 100 itens. &#x60;commandId&#x60; repetido dentro do lote recusa o lote inteiro com &#x60;422 SYNC_ENVELOPE_INVALID&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
