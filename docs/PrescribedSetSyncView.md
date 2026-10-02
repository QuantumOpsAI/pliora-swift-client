# PrescribedSetSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedSetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**setIndex** | **Int** |  |
**setType** | [**PrescribedSetType**](PrescribedSetType.md) |  |
**loadPercent** | **Double** | Percentual da carga de referência; ausente quando a carga não é prescrita em percentual. | [optional]
**target** | [**WorkoutSetValues**](WorkoutSetValues.md) |  |
**restSeconds** | **Int** | Descanso prescrito **depois desta série**, em segundos, na forma achatada que o aluno consome. Fora de bloco é o do exercício; num bloco combinado é o do bloco, tomado uma vez por rodada (&#x60;LE-3&#x60;, &#x60;LE-12&#x60;): depois da série de um exercício que não é o último da rodada não há descanso — exceto o descanso entre estações do circuito, &#x60;stationRestSeconds&#x60; —, depois da série do último exercício vale o descanso do bloco, o máximo da faixa (&#x60;restRange.maxSeconds&#x60;), e depois da última rodada não há nenhum. **Ausente** quando não há descanso prescrito depois da série, e a ausência nunca é zero; presente, &#x60;0&#x60; é um descanso prescrito de zero segundo. O bloco, com a faixa, vai em &#x60;blocks&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
