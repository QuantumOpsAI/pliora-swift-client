# ExecutionSetObservationUpdateCommand

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**commandId** | **String** | Identidade UUIDv7 do command, gerada no device e reutilizada em toda retentativa; chave de deduplicação transacional por conta. Um &#x60;commandId&#x60; já confirmado devolve o resultado original sem reexecutar; o mesmo &#x60;commandId&#x60; com payload divergente é &#x60;CONFLICT/IDENTITY_DIVERGENT&#x60;. |
**commandType** | **String** |  |
**schema** | **Int** | Versão do payload deste &#x60;commandType&#x60;. Versão maior do que o handler suporta é &#x60;FINAL_FAILURE/SYNC_COMMAND_SCHEMA_UNSUPPORTED&#x60;, tratada pelo cliente como \&quot;atualize o app\&quot;, preservando o fato local. |
**aggregateType** | **String** |  |
**aggregateId** | **String** | Agregado alvo. Um agregado fora do escopo do ator é &#x60;FINAL_FAILURE/FORBIDDEN&#x60; no item, sem revelar existência. |
**expectedRevision** | **String** | Revisão lida pelo cliente, quando o command exige concorrência otimista (CAS). Defasada, produz &#x60;CONFLICT/REVISION_STALE&#x60; com a versão canônica; nunca last-write-wins. | [optional]
**causationCommandId** | **String** | Command que causou este, quando a ordem é semanticamente necessária. Se for desconhecido pelo servidor e ausente do lote, o item é &#x60;RETRYABLE_FAILURE/SYNC_CAUSATION_UNKNOWN&#x60; e o cliente reenvia com a causa. | [optional]
**clientOccurredAt** | **Date** | Instante declarado pelo device, com offset explícito, armazenado como declarado e devolvido como evidência. **Nunca** é árbitro: não ordena itens, não resolve conflito e não elege vencedor. Desvio grande para o futuro é &#x60;FINAL_FAILURE/SYNC_CLOCK_SKEW&#x60;; desvio para o passado é legítimo. |
**payload** | [**ExecutionSetObservationUpdatePayload**](ExecutionSetObservationUpdatePayload.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
