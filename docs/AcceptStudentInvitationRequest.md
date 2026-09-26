# AcceptStudentInvitationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **String** | Bearer secret opaco de uso único que prova a posse do convite; nunca deve ser enviado em path, logs ou analytics. |
**invitationId** | **String** | Conferência cruzada **opcional**. Quando presente tem de ser o convite daquele token; divergir responde &#x60;404 INVITATION_NOT_FOUND&#x60;. Não substitui o token e não identifica o convite sozinho. | [optional]
**emailOwnershipProofId** | **String** | Prova de posse do endereço convidado, obtida em &#x60;verifyInvitationEmailOwnershipChallenge&#x60; **para este convite**. Exigida quando houve divergência; ausente quando não houve. Uma prova de outro convite é recusada, e nenhuma prova altera o e-mail da conta. | [optional]
**ageAssurance** | [**StudentAgeAssuranceEvidenceInput**](StudentAgeAssuranceEvidenceInput.md) |  | [optional]
**privacyDecisions** | [StudentPrivacyDecisionInput] | Decisão explícita &#x60;GRANTED&#x60; ou &#x60;DECLINED&#x60; para **cada** item do catálogo que o contexto pré-aceite serviu. Cobrir o catálogo parcialmente é &#x60;422 PRIVACY_DECISIONS_INCOMPLETE&#x60;; a lista vazia não é representável e **deixou de provar conclusão da etapa**. Tipos repetidos recusam o pedido. |
**sharingGrants** | [StudentSharingGrantInput] | Decisão explícita por categoria do catálogo fechado, presente **somente quando há troca** e então cobrindo todas as categorias que o contexto ofereceu. Ausente sem troca. Nenhuma categoria vem marcada, e omitir a lista nunca concede nada. | [optional]
**replacement** | [**StudentRelationshipReplacementInput**](StudentRelationshipReplacementInput.md) |  | [optional]
**timeZone** | **String** | Timezone IANA que a relação registra para derivar o dia civil da dupla. Obrigatório; identificador desconhecido ou offset fixo é &#x60;422 VALIDATION_ERROR&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
