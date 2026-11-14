# SaveStudentWeekArrangementRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**weekStart** | **Date** | A segunda-feira da semana em que os movimentos valem, no fuso do vínculo. |
**scope** | **String** | &#x60;THIS_WEEK&#x60;: só nesta semana (&#x60;Só nesta semana&#x60;, &#x60;LS-6&#x60; pré-selecionado); &#x60;FROM_THIS_WEEK_ON&#x60;: nesta e nas próximas (&#x60;Nesta e nas próximas&#x60;). |
**collision** | **String** | O que fazer quando o dia de destino já tem treino: &#x60;SWAP&#x60; troca os dois (o ocupante vai para o dia de origem, no mesmo alcance); &#x60;STACK&#x60; faz os dois nesse dia. | [optional] [default to .stack]
**moves** | [StudentWeekArrangementMove] | Os movimentos, um por treino. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
