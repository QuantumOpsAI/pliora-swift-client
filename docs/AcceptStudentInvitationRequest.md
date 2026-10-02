# AcceptStudentInvitationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **String** | Credencial curta da jornada que referencia o convite sem expor o token de aceite; nunca deve ser enviada em path, query, logs ou analytics. |
**invitationId** | **String** | Conferência cruzada **opcional**. Quando presente tem de ser o convite daquele token; divergir responde &#x60;404 INVITATION_NOT_FOUND&#x60;. Não substitui o token e não identifica o convite sozinho. | [optional]
**emailOwnershipProofId** | **String** | Prova de posse do endereço convidado **para este convite**: o &#x60;proofId&#x60; que o contexto pré-aceite publica com &#x60;emailOwnership.status &#x3D; PROVEN&#x60;. Ela nasce por um de dois caminhos, e só por eles: o desafio de posse do convite (&#x60;verifyInvitationEmailOwnershipChallenge&#x60;) ou a jornada criada com &#x60;emailDiscoveryProofId&#x60; em &#x60;createPendingStudentInvitationJourney&#x60;. Exigida quando houve divergência; ausente quando não houve. A prova de endereço (&#x60;discoveryProofId&#x60;, de &#x60;verifyInvitationEmailDiscoveryChallenge&#x60;) **nunca** é aceita aqui: ela não autoriza aceite. Uma prova de outro convite é recusada, e nenhuma prova altera o e-mail da conta. | [optional]
**ageAssurance** | [**StudentAgeAssuranceEvidenceInput**](StudentAgeAssuranceEvidenceInput.md) |  | [optional]
**privacyDecisions** | [StudentPrivacyDecisionInput] | Decisão explícita &#x60;GRANTED&#x60; ou &#x60;DECLINED&#x60; para **cada** item do catálogo que o contexto pré-aceite serviu. Cobrir o catálogo parcialmente é &#x60;422 PRIVACY_DECISIONS_INCOMPLETE&#x60;; a lista vazia não é representável e **deixou de provar conclusão da etapa**. Tipos repetidos recusam o pedido. |
**sharingGrants** | [StudentSharingGrantInput] | Decisão explícita por categoria do catálogo fechado, presente **somente quando há troca** e então cobrindo todas as categorias que o contexto ofereceu. Ausente sem troca. Nenhuma categoria vem marcada, e omitir a lista nunca concede nada. | [optional]
**replacement** | [**StudentRelationshipReplacementInput**](StudentRelationshipReplacementInput.md) |  | [optional]
**timeZone** | **String** | Timezone IANA que a relação registra para derivar o dia civil da dupla. Obrigatório; identificador desconhecido ou offset fixo é &#x60;422 VALIDATION_ERROR&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
