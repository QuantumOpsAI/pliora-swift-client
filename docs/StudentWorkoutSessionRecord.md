# StudentWorkoutSessionRecord

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | [**StudentWorkoutSessionRecordType**](StudentWorkoutSessionRecordType.md) |  |
**origin** | **String** | O selo de projeção. |
**setExecutionId** | **String** | A série da sessão que bateu o recorde; uma das séries de &#x60;exercises[].sets&#x60;, que dá o exercício e o critério por extenso. |
**previousValue** | **Double** | O melhor valor da base no mesmo critério, que o recorde superou: a carga (na unidade de &#x60;loadUnit&#x60;) em &#x60;MAX_LOAD&#x60;, as repetições em &#x60;MAX_REPS_AT_LOAD&#x60; e os segundos em &#x60;MAX_DURATION&#x60;. Sempre existe, porque a primeira vez não é recorde. |
**loadValue** | **Double** | A carga do recorde, na unidade gravada. Ausente com &#x60;BODYWEIGHT&#x60; e quando o recorde de duração não tem carga. | [optional]
**loadUnit** | **String** | A unidade da carga do recorde, como gravada. Ausente quando o recorde de duração não tem carga. | [optional]
**reps** | **Int** | As repetições do recorde &#x60;MAX_REPS_AT_LOAD&#x60;; ausente nos outros. | [optional]
**durationSeconds** | **Int** | A duração do recorde &#x60;MAX_DURATION&#x60;, em segundos; ausente nos outros. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
