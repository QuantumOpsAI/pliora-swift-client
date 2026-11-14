# StudentWeekArrangementConflictProblemDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | URI estável que identifica a classe do problema. |
**title** | **String** | Resumo legível e estável para a classe do problema. server_localized; &#x60;code&#x60; é a autoridade estável para lógica de cliente, &#x60;title&#x60; nunca deve ser usado como chave de decisão. |
**status** | **Int** |  |
**code** | **String** |  |
**detail** | **String** | Explicação contextual segura para exibição ou diagnóstico. | [optional]
**instance** | **String** | Referência opcional à ocorrência específica do problema. | [optional]
**correlationId** | **String** | Identificador opaco de correlação, repetido em Problem Details quando houver erro. |
**fieldErrors** | [FieldError] | Violações por campo quando a validação do comando falhar. | [optional]
**workoutId** | **String** | O treino do primeiro movimento recusado — o que se move ou, com &#x60;SWAP&#x60;, o ocupante; presente **sempre e somente** nas quatro recusas de regra. | [optional]
**weekday** | [**PlanWeekday**](PlanWeekday.md) | O destino do movimento recusado; &#x60;null&#x60; é Sem dia. Presente **sempre e somente** nas quatro recusas de regra. | [optional]
**availableFrom** | **Date** | Primeiro dia civil em que o arranjo do treino deixa de violar o intervalo mínimo, presente **sempre e somente** em &#x60;MIN_REST_INTERVAL_NOT_MET&#x60;. | [optional]
**minDaysBetweenSameWorkout** | **Int** | O intervalo mínimo entre repetições do mesmo treino, em dias, do plano em vigor, presente **sempre e somente** em &#x60;MIN_REST_INTERVAL_NOT_MET&#x60;, ao lado de &#x60;availableFrom&#x60;, para a frase &#x60;Seu personal pede N dias entre repetições deste treino. Libera &lt;data&gt;.&#x60; | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
