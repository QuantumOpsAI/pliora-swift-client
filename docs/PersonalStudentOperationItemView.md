# PersonalStudentOperationItemView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Vínculo **ativo** que autoriza esta linha. A autorização é verificada no servidor a cada leitura — nunca inferida de leitura anterior, de cache ou de estado de tela. |
**studentId** | **String** | Identificador opaco do aluno; nunca nome, e-mail, telefone ou contato. |
**studentLabel** | **String** | Rótulo opcional do aluno, **somente** o nome autorado no convite que originou o vínculo. Ele nunca é lido do perfil atual do aluno, e a projeção não cria rótulo novo: é exatamente o mesmo rótulo que a carteira de relacionamentos publica, ausente quando o convite não trouxe nome. | [optional]
**status** | [**RelationshipStatus**](RelationshipStatus.md) | Estado do vínculo, reusando o enum canônico. Nesta projeção ele é sempre &#x60;ACTIVE&#x60;: &#x60;PAUSED&#x60; e &#x60;ENDED&#x60; não entram na leitura, não são somados e não viram linha vazia, e a proibição está declarada como invariante de schema para que nenhuma implementação os emita aqui por engano. |
**anamnesis** | [**PersonalStudentOperationAnamnesisView**](PersonalStudentOperationAnamnesisView.md) |  |
**prescriptionEligibility** | [**StudentPrescriptionEligibilityView**](StudentPrescriptionEligibilityView.md) | Elegibilidade para prescrição exatamente como a superfície de onboarding já a publica: &#x60;ELIGIBLE&#x60; ou &#x60;BLOCKED&#x60;, com os motivos operacionais acumuláveis em &#x60;blockingReasons&#x60;. Reusada, e não recriada — um campo &#x60;reasonCode&#x60; próprio aqui seria um segundo vocabulário para a mesma decisão. O estado é derivado e calculado pelo servidor; nenhum cliente o infere. |
**assignment** | [**PersonalStudentOperationAssignmentView**](PersonalStudentOperationAssignmentView.md) |  |
**lastCompletedSession** | [**PersonalStudentScheduleDayExecuted**](PersonalStudentScheduleDayExecuted.md) | Referência da última sessão **concluída** deste aluno, por identidade, reusando a mesma referência executada que a semana do aluno publica. Ausente quando não há sessão concluída — ausência é ausência, nunca data zero nem sessão vazia. Ela não transporta carga, repetição, série nem sequência de sessões. | [optional]
**lastOperationalActivityAt** | **Date** | Instante **do servidor** da atividade operacional mais recente deste vínculo, definido como o mais recente entre os fatos que esta projeção já representa: conclusão de sessão, conclusão de versão da anamnese, publicação ou atribuição de prescrição e relato de desconforto. É um conjunto fechado, e não uma disjunção aberta. Ausente quando nenhum desses fatos existe. Nunca vem do relógio do dispositivo e nunca é comparado entre identidades diferentes. | [optional]
**openAttention** | [**PersonalStudentOpenAttentionView**](PersonalStudentOpenAttentionView.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
