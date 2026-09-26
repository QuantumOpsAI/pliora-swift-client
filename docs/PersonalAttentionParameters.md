# PersonalAttentionParameters

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonCode** | **String** |  |
**discomfortReportId** | **String** | Identificador opaco do relato individual. É o mesmo alvo que &#x60;acknowledgePersonalStudentDiscomfortReport&#x60; reconhece, e é por ele que a expiração deste item acontece. |
**reportedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**area** | **String** | Região declarada, com os mesmos valores que &#x60;ExecutionDiscomfortReportPayload&#x60; já publica; o conjunto é reusado sem alteração para que o fato lido pelo personal seja o mesmo que o aluno registrou. |
**sensation** | **String** | Sensação declarada, com os mesmos valores que &#x60;ExecutionDiscomfortReportPayload&#x60; já publica. É relato operacional, nunca classificação clínica. |
**intensity** | **Int** | Intensidade declarada na mesma escala inteira já publicada na execução. |
**version** | [**StudentAnamnesisVersionRef**](StudentAnamnesisVersionRef.md) |  |
**blockingReasons** | Set<StudentPrescriptionEligibilityBlockingReason> | Razões de bloqueio vigentes no instante &#x60;asOf&#x60;, acumuláveis e nomeadas. |
**blockedSince** | **Date** | Instante em que o bloqueio passou a vigorar — a mais antiga das razões vigentes, porque o item é único e persiste enquanto qualquer uma delas vigorar. |
**variantId** | **String** | Variante do exercício. Ela faz parte da chave de comparabilidade: carga de variantes diferentes não é equivalente e nunca entra na mesma janela. |
**equipmentId** | **String** | Equipamento, quando ele for materialmente relevante para a comparação. Ausente quando não discrimina; ausência aqui é ausência, e nunca um equipamento padrão presumido. | [optional]
**prescribedLoad** | [**WorkoutLoad**](WorkoutLoad.md) | Carga prescrita da sessão na unidade canônica, reusando a representação já publicada na execução. Comparação é por igualdade exata, sem tolerância. |
**performedLoad** | [**WorkoutLoad**](WorkoutLoad.md) | Carga executada da sessão, na mesma unidade canônica. |
**substitutionReason** | [**SubstitutionReason**](SubstitutionReason.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
