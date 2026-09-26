# StudentInvitationAcceptanceView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**outcome** | [**StudentInvitationAcceptanceOutcome**](StudentInvitationAcceptanceOutcome.md) |  |
**invitationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipId** | **String** | Relação ativa criada por este aceite; repetir o aceite devolve a mesma identidade. |
**replacedRelationshipId** | **String** | Vínculo encerrado nesta mesma transação. Presente somente quando &#x60;outcome&#x60; é &#x60;REPLACED&#x60;; ausência estrutural quando não houve troca. | [optional]
**personalId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | A conta autenticada que aceitou, que é também a autoria registrada em cada decisão. |
**acceptedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**privacyDecisions** | [RecordedPrivacyDecisionView] | Exatamente as decisões gravadas, com a versão do servidor. Nunca vazia: o catálogo servido é coberto por construção. |
**sharingGrants** | [RecordedSharingGrantView] | Exatamente os grants gravados. Lista vazia quando não houve troca. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
