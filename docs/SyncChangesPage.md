# SyncChangesPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**items** | [SyncEntityItem] | Entidades alteradas desde o cursor, coalescidas por identidade, na sequência server-owned. |
**cursor** | **String** | Cursor opaco que substitui o enviado; posicional e exclusivo em relação à última entrada entregue. Com &#x60;hasMore: false&#x60; é final e estável até a próxima mudança. Persistido pelo cliente somente após aplicar a página inteira de forma atômica. |
**hasMore** | **Bool** | Há mais páginas imediatamente disponíveis a partir de &#x60;cursor&#x60;. Página menor que o limite com &#x60;hasMore: true&#x60; é válida. |
**effectiveLimit** | **Int** | Limite realmente aplicado nesta página; pode ser menor que o pedido. |
**serverTime** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
