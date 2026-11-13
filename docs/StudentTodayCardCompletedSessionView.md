# StudentTodayCardCompletedSessionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**durationSeconds** | **Int** | Duração da sessão em segundos, entre os instantes de servidor do início e da conclusão. |
**completedSetCount** | **Int** | Séries feitas na sessão. |
**totalSetCount** | **Int** | Séries prescritas do treino da sessão. |
**recordCount** | **Int** | Quantos recordes a sessão bateu: o tamanho de &#x60;records&#x60; em &#x60;getStudentWorkoutSessionResult&#x60;, pela mesma projeção. **Nulo** quando a projeção não pôde ser lida nesta resposta, e então o cartão não desenha a linha de recordes: nulo nunca é lido como zero, e &#x60;0&#x60; só diz que a sessão não bateu recorde. |
**placement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação da sessão na semana, fixada no início dela e nunca reescrita. |
**slotDate** | **Date** | Data do slot que a sessão satisfez; presente com &#x60;ANTICIPATED&#x60; e &#x60;POSTPONED&#x60;, ausente nas demais. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
