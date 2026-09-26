# SyncConflictResolvePayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**conflictId** | **String** | Conflito &#x60;OPEN&#x60; do próprio ator, obtido em &#x60;SyncCommandResult.conflict&#x60;. Inexistente ou de outra conta é &#x60;FINAL_FAILURE/SYNC_CONFLICT_NOT_FOUND&#x60;, sem detalhe. |
**choice** | [**SyncConflictResolution**](SyncConflictResolution.md) |  |
**canonicalRevision** | **String** | Revisão canônica lida pelo cliente ao apresentar o conflito (&#x60;SyncConflict.canonicalRevision&#x60;). Ecoada como recebida, inclusive quando é a constante reservada &#x60;IMMUTABLE&#x60; de um conflito &#x60;IMMUTABLE_TARGET&#x60; sobre entidade sem revisão. O cliente nunca fabrica este valor. |
**replacementCommandId** | **String** | Command que materializa a escolha: o substituto em &#x60;SUPERSEDED_BY_CLIENT&#x60; e a emenda auditável em &#x60;ACCEPTED_AS_AMENDMENT&#x60;; ausente em &#x60;DISCARDED&#x60;. Viaja no mesmo lote ou já foi confirmado pelo servidor; desconhecido em ambos é &#x60;RETRYABLE_FAILURE/SYNC_CAUSATION_UNKNOWN&#x60; e o conflito permanece &#x60;OPEN&#x60;. Obrigatório nessas duas escolhas: ausente é &#x60;FINAL_FAILURE/SYNC_CONFLICT_REPLACEMENT_REQUIRED&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
