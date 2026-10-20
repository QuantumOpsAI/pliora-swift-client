# StudentInvitationPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**items** | [PersonalStudentInvitationListItemView] | Convites da página atual, na ordem definida pelo servidor. |
**nextCursor** | **String** | Token opaco de continuação. Não é offset, ID interno ou dado a ser interpretado pelo cliente. | [optional]
**asOf** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**expiresAt** | **Date** | Instante absoluto em que a leitura expira, fixado na primeira página e repetido nas seguintes — continuar nunca o estende. Passado dele, a continuação responde &#x60;410 CURSOR_EXPIRED&#x60; e a coleção recomeça. |
**querySnapshotId** | **String** | Identificador opaco emitido pelo servidor que marca a equivalência desta leitura — dono, coleção, &#x60;query&#x60;/&#x60;status&#x60; resolvidos, locale e conteúdo autorizado. Todas as páginas da mesma continuação trazem o mesmo valor; o cliente não o calcula, não o decodifica e não o usa como autorização. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
