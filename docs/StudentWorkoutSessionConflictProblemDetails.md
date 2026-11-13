# StudentWorkoutSessionConflictProblemDetails

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
**availableFrom** | **Date** | Primeiro dia civil, no fuso do vínculo, em que o início deste treino é aceito, presente **sempre e somente** em &#x60;MIN_REST_INTERVAL_NOT_MET&#x60;: a data da última sessão do mesmo treino, aberta ou concluída, mais o intervalo mínimo. | [optional]
**minDaysBetweenSameWorkout** | **Int** | O intervalo mínimo entre repetições do mesmo treino, em dias, do plano em vigor, presente **sempre e somente** em &#x60;MIN_REST_INTERVAL_NOT_MET&#x60;, ao lado de &#x60;availableFrom&#x60;: a AL2 compõe a frase &#x60;Seu personal pede N dias entre repetições deste treino. Libera &lt;data&gt;.&#x60; com este número, sem calcular nada. | [optional]
**sessionId** | **String** | Identidade canônica da sessão aberta do aluno, presente **sempre e somente** em &#x60;SESSION_ALREADY_EXISTS&#x60;. É o que permite ao app levar à retomada da sessão que já existe, sem uma leitura a mais, em vez de criar outra. | [optional]
**placement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação que o casamento calcula agora para o treino pedido, presente **sempre e somente** em &#x60;PLACEMENT_CHANGED&#x60;: o app reabre o resumo com o aviso desta colocação, em vez da que mostrou antes. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
