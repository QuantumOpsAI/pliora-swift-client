# StudentInvitationSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**invitationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | [**StudentInvitationLifecycleStatus**](StudentInvitationLifecycleStatus.md) |  |
**deliveryStatus** | [**StudentInvitationDeliveryStatus**](StudentInvitationDeliveryStatus.md) |  |
**destinationMasked** | **String** | E-mail convidado, irreversivelmente mascarado. Estruturalmente opcional apenas porque esta projeção de sincronização ainda pode carregar convites emitidos antes da emissão v2, quando existia convite sem destino; convite emitido a partir da v2 é sempre &#x60;email-bound&#x60; e sempre o traz. | [optional]
**studentDisplayName** | **String** | Metadado privado do personal, preservado verbatim; ausente quando não informado. | [optional]
**sentAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**acceptedAt** | **Date** | Instante do aceite; nulo enquanto o convite não foi aceito. |
**supersededByInvitationId** | **String** | Convite que substituiu este num reenvio. A identidade anterior permanece recuperável e a entrada anterior não é apagada. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
