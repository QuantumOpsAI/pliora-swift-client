# CreateStudentInvitationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**inviteeEmail** | **String** | E-mail do aluno convidado, obrigatório em toda emissão. É o destino vinculante do convite: uma conta autenticada com endereço divergente só prossegue mediante prova de posse deste endereço, e essa prova jamais altera o e-mail principal da conta. Normalizado somente no servidor e nunca devolvido por inteiro em projeção alguma — as leituras publicam apenas &#x60;destinationMasked&#x60;. |
**studentDisplayName** | **String** | Metadado privado opcional do personal, preservado byte a byte; nunca aparece na resolução pública do convite nem é traduzido. | [optional]
**delivery** | [**StudentInvitationDeliveryInput**](StudentInvitationDeliveryInput.md) |  | [optional]
**customMessage** | **String** | Mensagem opcional do personal, considerada após trim e limitada a 200 caracteres; preservada byte a byte e nunca traduzida. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
