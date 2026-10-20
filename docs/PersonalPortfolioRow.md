# PersonalPortfolioRow

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identificador opaco do aluno; nunca nome, e-mail, telefone ou contato. |
**relationshipStatus** | **String** |  |
**studentName** | [**Null**](Null.md) | Sempre ausente ou nulo: o nome é do aluno e não acompanha o vínculo encerrado. |
**studentLabel** | **String** | Rótulo autorado no convite, preservado como estava quando a relação existia. | [optional]
**operationalPriority** | **String** |  |
**indicators** | [PersonalPortfolioIndicator] | Sempre contém &#x60;ENDED&#x60; e nunca indicador de atividade operacional. |
**destination** | **String** |  |
**anamnesis** | [**PersonalStudentOperationAnamnesisView**](PersonalStudentOperationAnamnesisView.md) |  |
**prescriptionEligibility** | [**StudentPrescriptionEligibilityView**](StudentPrescriptionEligibilityView.md) | Elegibilidade para prescrição exatamente como a superfície de onboarding a publica — reusada, nunca um segundo vocabulário. |
**assignment** | [**PersonalStudentOperationAssignmentView**](PersonalStudentOperationAssignmentView.md) |  |
**lastCompletedSession** | [**PersonalStudentScheduleDayExecuted**](PersonalStudentScheduleDayExecuted.md) | Referência da última sessão **concluída**, por identidade. Ausente quando não há sessão concluída — ausência é ausência, nunca data zero. | [optional]
**lastOperationalActivityAt** | **Date** | Instante **do servidor** da atividade operacional mais recente deste vínculo. Ausente quando nenhum fato operacional existe. | [optional]
**attentionReasons** | [AttentionReasonReference] | Motivos de atenção vigentes do vínculo, completos e na projeção mínima &#x60;AttentionReasonReference&#x60; — a mesma dos grupos da fila. Lista vazia é exatamente nenhum motivo vigente, nunca afirmação de saúde. |
**pausedBy** | [**RelationshipPausedBy**](RelationshipPausedBy.md) | Autoria da pausa por papel, como a carteira relacional publica — nunca nome, e-mail, data ou motivo. |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAt** | **Date** | Instante server-owned do encerramento — a referência de encerramento já autorizada. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
