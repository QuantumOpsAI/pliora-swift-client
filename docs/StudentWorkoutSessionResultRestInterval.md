# StudentWorkoutSessionResultRestInterval

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**targetSeconds** | **Int** | Alvo efetivo de descanso (prescrito ou ajustado pelo aluno), em segundos. | [optional]
**durationSeconds** | **Int** | Duração informada pelas interações (do término da série até o início da seguinte ou encerramento da sessão), em segundos, sem o intervalo em que o treino ficou pausado (&#x60;DOC-STUDENT-WORKOUT&#x60; §6.8 e §7.4). Nulo ou ausente quando não houve interação. | [optional]
**overtimeSeconds** | **Int** | Excedente contra o alvo efetivo (max(0, durationSeconds - targetSeconds)). | [optional]
**skipped** | **Bool** | true quando o descanso foi explicitamente pulado pelo aluno. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
