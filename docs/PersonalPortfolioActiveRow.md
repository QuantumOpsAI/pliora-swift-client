# PersonalPortfolioActiveRow

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Vínculo **ativo** que autoriza esta linha; a autorização é verificada no servidor a cada leitura — nunca inferida de cache ou de leitura anterior. |
**studentId** | **String** | Identificador opaco do aluno; nunca nome, e-mail, telefone ou contato. |
**relationshipStatus** | **String** |  |
**studentName** | **String** | O nome que o aluno informou no próprio Perfil, **como ele escreveu**, de 1 a 60 caracteres (code points Unicode), preservado byte a byte — obrigatório e nunca nulo em &#x60;ACTIVE&#x60; desde &#x60;DEC-PHOME-6&#x60;. A tela mostra este nome, com &#x60;studentLabel&#x60; como linha secundária quando os dois existem e diferem. |
**studentLabel** | **String** | Rótulo opcional do aluno, **somente** o nome autorado no convite que originou o vínculo — nunca lido do perfil atual do aluno. | [optional]
**operationalPriority** | [**PersonalOperationalPriority**](PersonalOperationalPriority.md) |  |
**indicators** | [PersonalPortfolioIndicator] | Códigos fechados de apresentação dos fatos vigentes; &#x60;PAUSED&#x60; e &#x60;ENDED&#x60; nunca aparecem em linha ativa. Um indicador desconhecido não apaga os conhecidos nem vira verde. |
**destination** | [**PersonalCollectionDestination**](PersonalCollectionDestination.md) |  |
**anamnesis** | [**PersonalStudentOperationAnamnesisView**](PersonalStudentOperationAnamnesisView.md) |  |
**prescriptionEligibility** | [**StudentPrescriptionEligibilityView**](StudentPrescriptionEligibilityView.md) | Elegibilidade para prescrição exatamente como a superfície de onboarding a publica — reusada, nunca um segundo vocabulário. |
**assignment** | [**PersonalStudentOperationAssignmentView**](PersonalStudentOperationAssignmentView.md) |  |
**lastCompletedSession** | [**PersonalStudentScheduleDayExecuted**](PersonalStudentScheduleDayExecuted.md) | Referência da última sessão **concluída**, por identidade. Ausente quando não há sessão concluída — ausência é ausência, nunca data zero. | [optional]
**lastOperationalActivityAt** | **Date** | Instante **do servidor** da atividade operacional mais recente deste vínculo. Ausente quando nenhum fato operacional existe. | [optional]
**attentionReasons** | [AttentionReasonReference] | Motivos de atenção vigentes do vínculo, completos e na projeção mínima &#x60;AttentionReasonReference&#x60; — a mesma dos grupos da fila. Lista vazia é exatamente nenhum motivo vigente, nunca afirmação de saúde. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
