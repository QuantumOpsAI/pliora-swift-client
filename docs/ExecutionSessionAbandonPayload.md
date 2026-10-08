# ExecutionSessionAbandonPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**abandonedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**reason** | **String** | &#x60;USER_REQUESTED&#x60; é o descarte pelo aluno. &#x60;INTERRUPTED&#x60; é o motivo do abandono que o servidor faz sozinho, sete dias depois da interrupção, quando não há série executada; o app não o envia. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
