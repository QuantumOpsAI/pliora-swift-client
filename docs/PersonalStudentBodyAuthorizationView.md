# PersonalStudentBodyAuthorizationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**scope** | [**BodyAuthorizationScope**](BodyAuthorizationScope.md) |  |
**decision** | [**StudentBodyAuthorizationDecision**](StudentBodyAuthorizationDecision.md) |  |
**effectiveAccess** | [**BodyAuthorizationEffectiveAccess**](BodyAuthorizationEffectiveAccess.md) |  |
**revision** | **String** | Revisão opaca da autorização corporal; não precondiciona nenhuma escrita do personal. |
**asOf** | **Date** | Instante do servidor em que este estado foi projetado. |
**availableActions** | [PersonalStudentBodyAuthorizationAction] | As ações abertas ao personal — hoje, somente orientar o aluno. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
