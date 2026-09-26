# SyncConflict

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**conflictId** | **String** | Identidade do conflito, referenciada por &#x60;sync.conflict.resolve&#x60;. |
**kind** | [**SyncConflictKind**](SyncConflictKind.md) |  |
**canonicalRevision** | **String** | Revisão canônica no momento da detecção; valor que a resolução precisa ecoar em &#x60;canonicalRevision&#x60; para ser aceita. **Entidade imutável.** Quando o alvo não possui revisão — o caso de &#x60;IMMUTABLE_TARGET&#x60; sobre uma &#x60;PRESCRIPTION_VERSION&#x60; publicada ou sobre a versão fixada de uma sessão, em que &#x60;canonical.revision&#x60; é &#x60;null&#x60; — este campo carrega a constante reservada &#x60;IMMUTABLE&#x60;, declarada em &#x60;x-fitapp-immutable-canonical-revision&#x60;. A constante nunca é confundida com uma revisão real, porque o servidor jamais emite &#x60;IMMUTABLE&#x60; como revisão de entidade mutável; ela existe para que a precondição da resolução seja sempre declarável e comparável por igualdade, sem valor nulo e sem placeholder inventado pelo cliente. |
**canonical** | [**SyncEntityItem**](SyncEntityItem.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
