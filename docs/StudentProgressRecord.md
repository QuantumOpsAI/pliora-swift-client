# StudentProgressRecord

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | [**StudentWorkoutSessionRecordType**](StudentWorkoutSessionRecordType.md) |  |
**origin** | **String** | O selo de projeção. |
**exerciseLabel** | **String** | O rótulo do exercício, o &#x60;displayName&#x60; que o personal deu na prescrição, preservado verbatim e invariante de locale. |
**loadValue** | **Double** | A carga do recorde, na unidade gravada. Ausente com &#x60;BODYWEIGHT&#x60; e quando o recorde de duração não tem carga. | [optional]
**loadUnit** | **String** | A unidade da carga do recorde, como gravada. Ausente quando o recorde de duração não tem carga. | [optional]
**reps** | **Int** | As repetições do recorde &#x60;MAX_REPS_AT_LOAD&#x60;; ausente nos outros. | [optional]
**durationSeconds** | **Int** | A duração do recorde &#x60;MAX_DURATION&#x60;, em segundos; ausente nos outros. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
