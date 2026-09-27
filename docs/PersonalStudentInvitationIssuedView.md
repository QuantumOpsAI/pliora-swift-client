# PersonalStudentInvitationIssuedView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**invitationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentDisplayName** | **String** | Metadado privado do personal; nulo quando não informado e nunca exposto em resolução pública. |
**status** | [**StudentInvitationLifecycleStatus**](StudentInvitationLifecycleStatus.md) |  |
**deliveryStatus** | [**StudentInvitationDeliveryStatus**](StudentInvitationDeliveryStatus.md) |  |
**destinationMasked** | **String** | E-mail convidado, irreversivelmente mascarado. Todo convite emitido a partir da emissão v2 é &#x60;email-bound&#x60; e tem destino, de modo que o campo está presente em todos eles. Ele permanece ESTRUTURALMENTE OPCIONAL por uma razão medida e não por indecisão: convites emitidos antes desta versão, sob a modalidade de link, não têm destino nenhum, o servidor omite a chave, e um cliente que a exigisse falharia a decodificação antes de o aluno ver o convite — foi o que aconteceu em 0.26.0 e o que 0.27.0 corrigiu. Ausência é estrutural, nunca &#x60;null&#x60; e nunca string vazia. O destino em claro nunca é devolvido. | [optional]
**deliveryAttempts** | [StudentInvitationDeliveryAttemptView] | Tentativas de entrega do e-mail transacional, da mais recente para a mais antiga, como o servidor as observou. Estruturalmente ausente enquanto nenhuma tentativa foi registrada — &#x60;DO_NOT_SEND&#x60; não gera tentativa — e nunca &#x60;null&#x60;. É histórico de ENTREGA: nenhuma tentativa altera o ciclo de vida do convite, e nenhuma afirma recebimento ou leitura pelo aluno. | [optional]
**shareableUrl** | **String** | URL pública canônica &#x60;https://join.pliora.com/i/{linkCode}&#x60;. O código é opaco, redigido, não é token de aceite e é obrigatório em toda emissão ou reenvio NOVO. Fica ausente no replay da mesma Idempotency-Key, cancelamento e listagem. Reenviar cria outro código e revoga o anterior. | [optional]
**sentAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**acceptedAt** | **Date** | Instante RFC 3339 da aceitação; nulo enquanto o convite não foi aceito. |
**relationshipId** | **String** | Identificador público opaco da relação, que nasce somente no commit atômico único do aceite, depois da revisão de privacidade; nulo até lá. |
**availableActions** | Set<PersonalStudentInvitationAction> |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
