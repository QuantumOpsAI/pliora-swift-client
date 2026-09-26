# SyncSnapshotPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**items** | [SyncEntityItem] | Entidades do escopo nesta página, todas &#x60;UPSERT&#x60;, em ordem total determinista por módulo, tipo e identidade. |
**capturedSequence** | **String** | Identificador opaco do corte do change-log capturado antes de materializar a primeira página; igual em todas as páginas da mesma rematerialização. Não é número, não é ordenável e não é cursor. |
**hasMore** | **Bool** | &#x60;true&#x60; enquanto o snapshot continua; enquanto for &#x60;true&#x60;, &#x60;deltaCursor&#x60; é &#x60;null&#x60;. |
**pageCursor** | **String** | Cursor opaco da própria paginação do snapshot, de vida curta; presente somente quando &#x60;hasMore&#x60; é &#x60;true&#x60;. Não é intercambiável com o cursor de delta. | [optional]
**deltaCursor** | **String** | Cursor de delta posicionado exatamente no corte capturado, devolvido **somente na última página** (&#x60;hasMore: false&#x60;); &#x60;null&#x60; em toda página intermediária. Continuar &#x60;GET /sync/changes&#x60; a partir dele entrega apenas o que mudou depois do corte, sem repetir o snapshot e sem perder mudança ocorrida durante a paginação. |
**effectiveLimit** | **Int** | Limite realmente aplicado nesta página. |
**serverTime** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
