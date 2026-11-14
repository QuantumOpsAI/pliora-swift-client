# UpdatePlanActivationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**mode** | [**PlanActivationMode**](PlanActivationMode.md) |  |
**endDate** | **Date** | Último dia de validade; ausente quando a ativação passa a não ter data de término. Nunca anterior ao início. | [optional]
**weekdaySlots** | [PlanWeekdaySlot] | Programação por dias da semana, um slot por treino; só em &#x60;WEEKDAYS&#x60;. Treino extra num slot é &#x60;WORKOUT_IS_EXTRA&#x60;. | [optional]
**sequence** | **[String]** | Ordem dos treinos em sequência livre; só em &#x60;SEQUENCE&#x60;. Lista ordenada, sem repetição de treino; treino extra nela é &#x60;WORKOUT_IS_EXTRA&#x60;. | [optional]
**restRequired** | [PlanRestRequiredWeekday] | Dias da semana de **descanso obrigatório** (&#x60;DOC-STUDENT-WEEK&#x60; §5.1), cada um com validade opcional; só em &#x60;WEEKDAYS&#x60;. Opcional; ausente ou vazio é nenhum. Num dia obrigatório em vigor nenhum início é aceito — nem do plano, nem repetição, nem retroativo. Um dia da semana é **ou** sugerido para um treino **ou** obrigatório: o dia que algum slot nomeia é &#x60;REST_REQUIRED_WEEKDAY_IN_SLOT&#x60;; o mesmo dia duas vezes, &#x60;REST_REQUIRED_WEEKDAY_REPEATED&#x60;; &#x60;until&#x60; anterior ao início da ativação, &#x60;REST_REQUIRED_UNTIL_BEFORE_START&#x60;; a lista em &#x60;SEQUENCE&#x60;, &#x60;REST_REQUIRED_NOT_ALLOWED_FOR_MODE&#x60; — todos &#x60;422 VALIDATION_FAILED&#x60; com o caminho do elemento em &#x60;fieldErrors&#x60;. | [optional]
**minDaysBetweenSameWorkout** | **Int** | **Intervalo mínimo entre repetições do mesmo treino**, em dias, por plano (&#x60;DOC-STUDENT-WEEK&#x60; §5.2); vale em &#x60;WEEKDAYS&#x60; e em &#x60;SEQUENCE&#x60;. Opcional; ausente é sem regra. Com valor N, uma sessão do treino no dia D só é aceita se não houver sessão do mesmo treino, aberta ou concluída, em dia D&#39; com |D − D&#39;| &lt; N. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
