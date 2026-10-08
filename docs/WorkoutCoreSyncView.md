# WorkoutCoreSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutAssignmentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | [**DeferralStatus**](DeferralStatus.md) |  |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**completedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**lastRecordedAt** | **Date** | O instante do servidor do último fato aceito na sessão, ou o do início quando ainda não há fato. É dele que correm as 12 horas até a interrupção; a retomada o leva ao instante em que foi confirmada. Registrar um fato não muda a revisão pública da sessão. |
**endedBy** | [**WorkoutSessionEndedBy**](WorkoutSessionEndedBy.md) |  | [optional]
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
**measuredDurationSeconds** | **Int** | Duração medida pelo cronômetro da série por tempo, em segundos; nunca é sobrescrita. Ausente fora da série por tempo e na série pulada. | [optional]
**adjustedDurationSeconds** | **Int** | Duração que o aluno corrigiu, em segundos; existe somente quando é **diferente** de &#x60;measuredDurationSeconds&#x60; e então é igual a &#x60;actual.durationSeconds&#x60;. Ausente quer dizer que o aluno não corrigiu, e nunca zero. | [optional]
**observation** | **String** |  |
**restPeriodId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**afterSetExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**targetSeconds** | **Int** |  |
**adjustedTargetSeconds** | **Int** |  | [optional]
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
**replacement** | [**WorkoutSetValues**](WorkoutSetValues.md) |  |
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
