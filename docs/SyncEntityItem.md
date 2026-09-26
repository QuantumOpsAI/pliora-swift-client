# SyncEntityItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**entityType** | [**SyncEntityType**](SyncEntityType.md) |  |
**entityId** | **String** | Identidade estável da entidade, a mesma entre delta, snapshot, recomputos e reconstruções. |
**kind** | [**SyncChangeKind**](SyncChangeKind.md) |  |
**tombstoneReason** | [**SyncTombstoneReason**](SyncTombstoneReason.md) | Presente se, e somente se, &#x60;kind&#x60; é &#x60;TOMBSTONE&#x60;. | [optional]
**revision** | **String** | Revisão opaca da entidade, definida pelo servidor; &#x60;null&#x60; quando a entidade é imutável e não possui revisão (por exemplo &#x60;PRESCRIPTION_VERSION&#x60;). O cliente compara somente por igualdade e nunca infere ordem, anterioridade ou magnitude a partir do valor; a ordem de aplicação vem do cursor. |
**asOf** | **Date** | Instante server-owned do corte de fatos usado no cálculo (&#x60;PROJECTION&#x60;, sempre presente) ou do fato/remoção quando o módulo o declara (&#x60;FACT&#x60;); &#x60;null&#x60; quando não se aplica. Nunca produzido nem arbitrado pelo relógio do device; nunca comparado entre identidades diferentes. |
**origin** | [**SyncItemOrigin**](SyncItemOrigin.md) |  |
**lastCommandId** | **String** | &#x60;commandId&#x60; que produziu a entidade pela última vez, para o cliente distinguir mutação já confirmada de mutação ainda pendente no outbox; &#x60;null&#x60; quando a entidade não decorre de um command do device. A ausência de um &#x60;commandId&#x60; nunca confirma nem descarta esse command. |
**view** | **[String: AnyCodable]** | Representação vigente da entidade. Permanece aberta no transporte transversal para que módulos ainda não publicados sejam compatíveis; os tipos do Workout Core têm schemas fechados no mapeamento &#x60;x-fitapp-view-schemas&#x60; e no &#x60;OfflineWorkoutBundle&#x60;. Prescrito, alvo e realizado permanecem blocos separados. Ausente em &#x60;TOMBSTONE&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
