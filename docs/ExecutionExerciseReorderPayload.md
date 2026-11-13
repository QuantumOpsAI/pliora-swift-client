# ExecutionExerciseReorderPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reorderId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedPosition** | **Int** |  |
**fromExecutedPosition** | **Int** |  |
**toExecutedPosition** | **Int** |  |
**reorderedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**observation** | **String** | Observação opcional desta adaptação (&#x60;REAL-05&#x60;, &#x60;DOC-STUDENT-WORKOUT&#x60; §7.10), texto curto do aluno, preso a ela. Nasce sem ser mostrada ao personal; a escolha é &#x60;setStudentObservationSharing&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
