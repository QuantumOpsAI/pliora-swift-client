# WorkoutCoreSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutAssignmentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | **String** | O estado corrigido; &#x60;null&#x60; quando a emenda corrigiu os valores. |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**completedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**lastRecordedAt** | **Date** | Última atividade confirmada do servidor, ou início antes de qualquer atividade: inclui PAUSE/RESUME/APPLY_VALUES e transições aceitas. Leituras, ticks, alertas, ACK, replay e cap não renovam atividade. Para 2 h/12 h, exclui apenas a interseção desde lastRecordedAt com os primeiros 3600 s de cada pausa confirmada não sobreposta (R5); pausas antigas não contam novamente. Não é lastRecordedAt cru mais 12 h. No cap o operacional continua pausado, sem aviso/revisão/atividade automáticos; inatividade volta a crescer. Retomada confirmada move a atividade. Registrar um fato não muda a revisão pública de ciclo de vida da sessão; controle tem sua revisão operacional. |
**endedBy** | [**WorkoutSessionEndedBy**](WorkoutSessionEndedBy.md) |  | [optional]
**sessionEffort** | [**WorkoutSessionEffort**](WorkoutSessionEffort.md) | A nota de esforço do treino inteiro, declarada pelo aluno ao terminar (&#x60;rateStudentWorkoutSessionEffort&#x60;). **Ausente** quando o aluno não a deu, e sempre ausente fora de &#x60;COMPLETED&#x60; com &#x60;endedBy: STUDENT&#x60;: a sessão aberta, a descartada e a encerrada pelo servidor não têm nota. Ausência nunca é zero. | [optional]
**recordedLater** | **Bool** | true quando o treino foi marcado como feito depois (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §3.5). | [optional]
**exerciseOrderPolicy** | [**ExerciseOrderPolicyView**](ExerciseOrderPolicyView.md) |  |
**calculatedLoadTargets** | [CalculatedLoadTarget] | Um item por série **prescrita em percentual** do treino da sessão, na ordem da prescrição, cada &#x60;prescribedSetId&#x60; uma só vez; ausente quando nenhuma série do treino é em percentual. Fixado no início da sessão e nunca recalculado. O valor calculado vale para a **variante prescrita**: trocar de variante o tira, e a carga de referência não é transportada entre variantes. | [optional]
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**executedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**equipmentInstanceId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedPosition** | **Int** |  |
**executedPosition** | **Int** |  |
**setExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedSetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**setIndex** | **Int** |  |
**target** | [**ExecutionTargetValues**](ExecutionTargetValues.md) |  |
**actual** | [**WorkoutSetValues**](WorkoutSetValues.md) |  |
**repsPerSide** | **Bool** | Copiado pelo servidor da série prescrita ao persistir a execução (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §6.5). O cliente não o envia nem o edita. | [optional]
**loadBasis** | [**LoadBasis**](LoadBasis.md) | Copiado pelo servidor da prescrição ao persistir a execução (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §6.4). O cliente não o envia nem o edita. &#x60;null&#x60; é &#x60;leitura não informada&#x60;, que só se compara com &#x60;null&#x60;. Na alternativa executada sem orientação própria, é a leitura sugerida pelo equipamento dela, nunca a do exercício original. | [optional]
**isAdditional** | **Bool** | true quando a série for adicional acrescentada durante a sessão ou após o término (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §2.5.1). | [optional]
**activeDurationSeconds** | **Int64** | floor(tempo ativo medido pelo servidor em ms/1000), persistido uma vez somente após início real explícito de série que termina COMPLETED/PARTIAL. Pode ser 0 em série não temporal com menos de 1 s; ausente em SKIPPED ou sem início real, nunca estimado de startedAt/completedAt legado nem preenchido por emenda. Na série por tempo, coincide com measuredDurationSeconds&gt;&#x3D; 1; correção de actual.durationSeconds nunca altera duração ativa ou medida. Não é aceito em nenhum input e não tem default. | [optional] [readonly]
**measuredDurationSeconds** | **Int** | Duração medida pelo cronômetro da série por tempo, em segundos; nunca é sobrescrita. Ausente fora da série por tempo e na série pulada. | [optional]
**adjustedDurationSeconds** | **Int** | Duração que o aluno corrigiu, em segundos; existe somente quando é **diferente** de &#x60;measuredDurationSeconds&#x60; e então é igual a &#x60;actual.durationSeconds&#x60;. Ausente quer dizer que o aluno não corrigiu, e nunca zero. | [optional]
**observation** | **String** |  |
**restPeriodId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**afterSetExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**targetSeconds** | **Int** | Descanso prescrito, em segundos; ausente quando não havia prescrição, nunca zero. | [optional]
**adjustedTargetSeconds** | **Int** | Alvo ajustado pelo aluno; só existe quando &#x60;targetSeconds&#x60; existe. | [optional]
**measuredSeconds** | **Int** | Derivado no servidor de início, fim e pausas. |
**endedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**substitutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**executedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**type** | [**SubstitutionType**](SubstitutionType.md) |  |
**reason** | **String** |  |
**authorizationSource** | [**SubstitutionAuthorizationSource**](SubstitutionAuthorizationSource.md) |  |
**scope** | **String** |  |
**registeredAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**deferralId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**amendmentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**previous** | [**WorkoutSetValues**](WorkoutSetValues.md) |  |
**replacement** | [**WorkoutSetValues**](WorkoutSetValues.md) | Os valores corrigidos; &#x60;null&#x60; quando a emenda corrigiu o estado. |
**amendedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**discomfortReportId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**area** | **String** |  |
**sensation** | **String** |  |
**intensity** | **Int** |  |
**description** | **String** |  | [optional]
**notifyPersonal** | **Bool** |  |
**reportedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**publishedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**workouts** | [PrescribedWorkoutSyncView] |  |
**assignmentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**priority** | **String** |  |
**alternativeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantId** | **String** | Variante a que este histórico pertence; o histórico da variante A nunca traz execução da variante B. |
**displayName** | **String** | Rótulo da alternativa na prescrição, o mesmo de &#x60;PrescriptionDraftAlternative&#x60;, preservado verbatim. É o nome que o aluno vê na tela de troca e que o histórico guarda, independentemente de o exercício continuar na origem do catálogo. |
**equipment** | **String** | Equipamento do exercício da alternativa em texto legível, como a origem o entrega — o mesmo de &#x60;ExerciseCatalogDetail.equipment&#x60;. Ausente quando a origem não o informa. | [optional]
**primaryMuscles** | **[String]** | Músculos principais do exercício da alternativa em texto legível, como a origem os entrega — os mesmos de &#x60;ExerciseCatalogDetail.primaryMuscles&#x60;. Ausente quando a origem não os informa. | [optional]
**name** | **String** |  |
**variantIds** | **[String]** |  |
**equipmentContextKey** | **String** | Contexto de equipamento que, junto com a variante, fecha a chave de comparabilidade. Código de máquina estável, nunca nome de aparelho exibível. |
**equipmentCodes** | **[String]** |  |
**manifestId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseVariantId** | **String** | ExerciseVariant canônica à qual todo asset deste manifesto pertence. |
**assets** | [ExerciseMediaAsset] |  |
**comparisonStatus** | [**ComparisonStatus**](ComparisonStatus.md) |  |
**entries** | [ExerciseHistoryEntry] | Execuções comparáveis, da mais recente para a mais antiga, com carga e repetições de cada série preservadas individualmente. Vazio quando &#x60;comparisonStatus&#x60; não é &#x60;COMPARED&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
