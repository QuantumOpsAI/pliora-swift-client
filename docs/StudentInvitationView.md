# StudentInvitationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**invitationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | **String** |  |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**destinationMasked** | **String** | E-mail convidado, irreversivelmente mascarado, para reconhecimento visual. Todo convite emitido a partir da v2 é &#x60;email-bound&#x60; (&#x60;DEC-CONV-2&#x60;) e o traz. Continua ESTRUTURALMENTE OPCIONAL porque convite emitido antes da v2, sob a modalidade de link, não tem destino: o servidor omite a chave, e exigi-la aqui reintroduziria a falha de decodificação que 0.27.0 corrigiu. Ausência é estrutural, nunca &#x60;null&#x60;; o cliente omite a linha em vez de exibir lugar vazio. O endereço em claro nunca é devolvido por esta rota pública. | [optional]
**personal** | [**InvitationPersonalView**](InvitationPersonalView.md) |  |
**capabilities** | Set<StudentInvitationCapability> |  |
**canAccept** | **Bool** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
