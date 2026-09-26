# StudentInvitationAcceptanceContextView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**invitationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**revision** | **String** | Validador opaco deste contexto. O cliente o ecoa em &#x60;If-Match&#x60; ao confirmar e nunca o interpreta, ordena ou constrói. |
**personal** | [**InvitationPersonalView**](InvitationPersonalView.md) |  |
**emailOwnership** | [**InvitationEmailOwnershipContextView**](InvitationEmailOwnershipContextView.md) |  |
**ageAssurance** | [**StudentAgeAssuranceContextView**](StudentAgeAssuranceContextView.md) |  |
**privacyCatalog** | [StudentPrivacyCatalogItemView] | Catálogo vigente, na íntegra. O aceite exige decisão explícita para **cada** item desta lista; cobri-la parcialmente é &#x60;422 PRIVACY_DECISIONS_INCOMPLETE&#x60;. |
**replacement** | [**StudentRelationshipReplacementContextView**](StudentRelationshipReplacementContextView.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
