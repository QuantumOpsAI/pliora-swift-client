# RelationshipInvitationCreatePayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**invitationId** | **String** | Identidade do convite, criada no device e igual ao &#x60;aggregateId&#x60; do envelope. |
**inviteeEmail** | **String** | E-mail do aluno convidado, obrigatório e vinculante, exatamente como na emissão online. Normalizado somente no servidor e nunca devolvido por inteiro; o token nunca volta ao cliente por este caminho. |
**delivery** | [**StudentInvitationDeliveryInput**](StudentInvitationDeliveryInput.md) |  | [optional]
**studentDisplayName** | **String** | Metadado privado do personal, preservado byte a byte; nunca aparece na resolução pública. | [optional]
**customMessage** | **String** | Mensagem opcional do personal, considerada após trim; preservada byte a byte e nunca traduzida. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
