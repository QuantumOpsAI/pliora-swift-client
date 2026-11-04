# WorkoutSummarySetView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedSetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**setIndex** | **Int** |  |
**setType** | [**PrescribedSetType**](PrescribedSetType.md) |  |
**repsMin** | **Int** |  | [optional]
**repsMax** | **Int** |  | [optional]
**repsExact** | **Int** |  | [optional]
**durationSeconds** | **Int** | Duração alvo da série por tempo, em segundos. Exclui toda repetição prescrita. | [optional]
**loadValue** | **Double** |  | [optional]
**loadUnit** | [**PrescribedLoadUnit**](PrescribedLoadUnit.md) |  | [optional]
**loadBasis** | [**LoadBasis**](LoadBasis.md) | Leitura do peso do exercício prescrito, como publicada; &#x60;null&#x60; é &#x60;leitura não informada&#x60;. O aluno a vê colada à carga (&#x60;20 kg cada halter&#x60;). | [optional]
**loadPercent** | **Double** | Percentual da carga de referência; exclui &#x60;loadValue&#x60; e &#x60;loadUnit&#x60;. | [optional]
**repsPerSide** | **Bool** | true quando a contagem de repetições da série prescrita for por lado (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §6.5). | [optional]
**restSeconds** | **Int** | Descanso prescrito depois desta série, em segundos; ausente quando não há. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
