# SetExecutionSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**setExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedSetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**setIndex** | **Int** |  |
**status** | [**ExecutedSetStatus**](ExecutedSetStatus.md) |  |
**target** | [**ExecutionTargetValues**](ExecutionTargetValues.md) |  |
**actual** | [**WorkoutSetValues**](WorkoutSetValues.md) |  |
**repsPerSide** | **Bool** | Copiado pelo servidor da série prescrita ao persistir a execução (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §6.5). O cliente não o envia nem o edita. | [optional]
**loadBasis** | [**LoadBasis**](LoadBasis.md) | Copiado pelo servidor da prescrição ao persistir a execução (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §6.4). O cliente não o envia nem o edita. &#x60;null&#x60; é &#x60;leitura não informada&#x60;, que só se compara com &#x60;null&#x60;. Na alternativa executada sem orientação própria, é a leitura sugerida pelo equipamento dela, nunca a do exercício original. | [optional]
**isAdditional** | **Bool** | true quando a série for adicional acrescentada durante a sessão ou após o término (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §2.5.1). | [optional]
**activeDurationSeconds** | **Int64** | floor(tempo ativo medido pelo servidor em ms/1000), persistido uma vez somente após início real explícito de série que termina COMPLETED/PARTIAL. Pode ser 0 em série não temporal com menos de 1 s; ausente em SKIPPED ou sem início real, nunca estimado de startedAt/completedAt legado nem preenchido por emenda. Na série por tempo, coincide com measuredDurationSeconds&gt;&#x3D; 1; correção de actual.durationSeconds nunca altera duração ativa ou medida. Não é aceito em nenhum input e não tem default. | [optional] [readonly]
**measuredDurationSeconds** | **Int** | Duração medida pelo cronômetro da série por tempo, em segundos; nunca é sobrescrita. Ausente fora da série por tempo e na série pulada. | [optional]
**adjustedDurationSeconds** | **Int** | Duração que o aluno corrigiu, em segundos; existe somente quando é **diferente** de &#x60;measuredDurationSeconds&#x60; e então é igual a &#x60;actual.durationSeconds&#x60;. Ausente quer dizer que o aluno não corrigiu, e nunca zero. | [optional]
**executedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**equipmentInstanceId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**observation** | **String** |  |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**completedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
