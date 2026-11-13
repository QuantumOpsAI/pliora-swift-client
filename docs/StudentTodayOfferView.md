# StudentTodayOfferView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome do treino, conteúdo autorado preservado verbatim e invariante de locale. |
**focus** | **String** | Foco declarado do treino, preservado verbatim; nulo somente para versão publicada antes de o foco autorado existir. |
**prescriptionVersionId** | **String** | A versão em vigor que o início deste treino leva. |
**placement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação que o início teria hoje: &#x60;ANTICIPATED&#x60; ou &#x60;POSTPONED&#x60; nesta versão (&#x60;UNSCHEDULED&#x60; a partir de 0.122.0, &#x60;EXTRA&#x60; a partir de 0.123.0). |
**slotDate** | **Date** | Data do slot pendente que o início satisfaria; presente com &#x60;ANTICIPATED&#x60; e &#x60;POSTPONED&#x60;, ausente nas demais. | [optional]
**blockedBy** | **String** | Por que o início deste item seria recusado hoje: &#x60;MIN_REST_INTERVAL&#x60; é o intervalo mínimo entre repetições, que entra em 0.121.0; nesta versão nunca é produzido. Vem com &#x60;availableFrom&#x60;. | [optional]
**availableFrom** | **Date** | Primeiro dia em que o início deixa de ser recusado; presente só com &#x60;blockedBy&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
