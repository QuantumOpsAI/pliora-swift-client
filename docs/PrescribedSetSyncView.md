# PrescribedSetSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedSetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**setIndex** | **Int** |  |
**setType** | [**PrescribedSetType**](PrescribedSetType.md) |  |
**repsMin** | **Int** | Mínimo da faixa de repetições prescrita para a série, quando prescrita em faixa; ausente em série por repetição exata ou por tempo. | [optional]
**repsMax** | **Int** | Máximo da faixa de repetições prescrita para a série, quando prescrita em faixa; ausente em série por repetição exata ou por tempo. | [optional]
**loadPercent** | **Double** | Percentual da carga de referência; ausente quando a carga não é prescrita em percentual. | [optional]
**target** | [**WorkoutSetValues**](WorkoutSetValues.md) |  |
**effortType** | [**PrescribedEffortType**](PrescribedEffortType.md) | Tipo do esforço prescrito para esta série. Presente se e somente se &#x60;effortValue&#x60; está presente. | [optional]
**effortValue** | **Double** | Valor do esforço prescrito, na escala de &#x60;effortType&#x60;. Presente se e somente se &#x60;effortType&#x60; está presente; nunca é convertido no RPE declarado. | [optional]
**repsPerSide** | **Bool** | true quando a contagem de repetições da série prescrita for por lado (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §6.5). | [optional]
**restSeconds** | **Int** | Descanso prescrito **depois desta série**, em segundos, na forma achatada que o aluno consome. Fora de bloco é o do exercício; num bloco combinado é o do bloco, tomado uma vez por rodada (&#x60;LE-3&#x60;, &#x60;LE-12&#x60;): depois da série de um exercício que não é o último da rodada não há descanso — exceto o descanso entre estações do circuito, &#x60;stationRestSeconds&#x60; —, depois da série do último exercício vale o descanso do bloco, o máximo da faixa (&#x60;restRange.maxSeconds&#x60;), e depois da última rodada não há nenhum. **Ausente** quando não há descanso prescrito depois da série, e a ausência nunca é zero; presente, &#x60;0&#x60; é um descanso prescrito de zero segundo. O bloco, com a faixa, vai em &#x60;blocks&#x60;. | [optional]
**restMinSeconds** | **Int** | Mínimo da faixa de descanso prescrito depois desta série, em segundos, quando há descanso depois dela. Igual a &#x60;restMaxSeconds&#x60; quando o descanso é um valor único (ex. &#x60;stationRestSeconds&#x60; ou faixa de extremos iguais). Ausente quando não há descanso depois da série. | [optional]
**restMaxSeconds** | **Int** | Máximo da faixa de descanso prescrito depois desta série, em segundos (igual a &#x60;restSeconds&#x60;). Ausente quando não há descanso depois da série. | [optional]
**note** | **String** | Nota curta do personal específica para esta série (ex. \&quot;barra vazia\&quot;, \&quot;~60% da carga de trabalho\&quot;), preservada verbatim UTF-8. Ausente quando não há. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
