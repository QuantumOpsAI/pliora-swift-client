# StudentTodayOfferView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome do treino, conteúdo autorado preservado verbatim e invariante de locale. |
**focus** | **String** | Foco declarado do treino, preservado verbatim; nulo somente para versão publicada antes de o foco autorado existir. |
**prescriptionVersionId** | **String** | A versão em vigor que o início deste treino leva. |
**placement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação que o início teria hoje: &#x60;ANTICIPATED&#x60; ou &#x60;POSTPONED&#x60; para um slot pendente, &#x60;UNSCHEDULED&#x60; para um treino Sem dia nesta semana e &#x60;EXTRA&#x60; para um treino extra (&#x60;week.today.extra&#x60;), sempre sem &#x60;slotDate&#x60;. |
**slotDate** | **Date** | Data do slot pendente que o início satisfaria; presente com &#x60;ANTICIPATED&#x60; e &#x60;POSTPONED&#x60;, ausente nas demais. | [optional]
**blockedBy** | **String** | Por que o início deste item seria recusado hoje: &#x60;MIN_REST_INTERVAL&#x60; é o intervalo mínimo entre repetições do mesmo treino, que não foi cumprido. Ausente quando o item pode ser iniciado. Vem com &#x60;availableFrom&#x60;. | [optional]
**availableFrom** | **Date** | Primeiro dia em que o início deixa de ser recusado; presente só com &#x60;blockedBy&#x60;. | [optional]
**minDaysBetweenSameWorkout** | **Int** | O intervalo mínimo entre repetições do mesmo treino, em dias, do plano em vigor, obrigatório com &#x60;blockedBy&#x60; &#x60;MIN_REST_INTERVAL&#x60;: a tela compõe com ele &#x60;Seu personal pede N dias entre repetições deste treino. Libera &lt;data&gt;.&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
