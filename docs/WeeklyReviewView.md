# WeeklyReviewView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reviewId** | **UUID** | UUIDv4 aleatório canônico minúsculo, não é bearer. Nunca deriva de entidade de domínio. |
**businessWeekStart** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**businessWeekEndExclusive** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**businessTimeZoneSnapshot** | **String** | Identificador de timezone IANA, por exemplo &#x60;America/Sao_Paulo&#x60;. |
**asOf** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**completedSessionCount** | **Int** |  |
**results** | [WeeklyReviewResultReference] |  |
**nextCursor** | **String** | Token opaco de continuação. Não é offset, ID interno ou dado a ser interpretado pelo cliente. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
