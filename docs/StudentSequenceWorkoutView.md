# StudentSequenceWorkoutView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome do treino, conteúdo autorado preservado verbatim UTF-8 e invariante de locale. |
**focus** | **String** | Foco declarado do treino, preservado verbatim; nulo somente para versão publicada antes de o foco autorado existir. |
**position** | **Int** | Posição do treino na sequência; o servidor é a autoridade da ordem e o cliente não a reordena. |
**exerciseCount** | **Int** |  |
**estimatedDurationMinutes** | [**DurationMinutesRange**](DurationMinutesRange.md) | Estimativa calculada pelo servidor, a mesma de &#x60;StudentTodayPrescribedWorkoutView&#x60;. |
**lastCompletedOn** | **Date** | Dia civil em que o aluno concluiu este treino pela última vez; ausente quando nunca o concluiu. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
