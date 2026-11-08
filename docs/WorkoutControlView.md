# WorkoutControlView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**revision** | **String** | Revisão opaca definida pelo servidor. O cliente compara somente por igualdade, nunca infere ordem e nunca a cria; &#x60;expectedRevision&#x60; e &#x60;canonicalRevision&#x60; apenas ecoam um valor lido do servidor. |
**controlRevision** | **Int64** |  |
**sessionRevision** | **String** | Revisão opaca definida pelo servidor. O cliente compara somente por igualdade, nunca infere ordem e nunca a cria; &#x60;expectedRevision&#x60; e &#x60;canonicalRevision&#x60; apenas ecoam um valor lido do servidor. |
**bundleRevision** | **String** | Revisão opaca definida pelo servidor. O cliente compara somente por igualdade, nunca infere ordem e nunca a cria; &#x60;expectedRevision&#x60; e &#x60;canonicalRevision&#x60; apenas ecoam um valor lido do servidor. |
**serverNow** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**sessionStatus** | **String** |  |
**phase** | [**WorkoutControlPhase**](WorkoutControlPhase.md) |  |
**phaseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**paused** | **Bool** |  |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**lastRecordedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**inactivity** | [**WorkoutControlInactivity**](WorkoutControlInactivity.md) |  |
**completedSetCount** | **Int** |  |
**totalSetCount** | **Int** |  |
**allowedActions** | Set<WorkoutControlAction> |  |
**maxIntentAgeSeconds** | **Int** |  |
**currentOccurrence** | [**WorkoutControlOccurrence**](WorkoutControlOccurrence.md) |  | [optional]
**presentedTarget** | [**ExecutionTargetValues**](ExecutionTargetValues.md) |  | [optional]
**workingActualValues** | [**WorkoutControlEntryValues**](WorkoutControlEntryValues.md) |  | [optional]
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**openSet** | [**WorkoutControlOpenSet**](WorkoutControlOpenSet.md) |  | [optional]
**rest** | [**WorkoutControlRest**](WorkoutControlRest.md) |  | [optional]
**timer** | [**WorkoutControlTimer**](WorkoutControlTimer.md) |  | [optional]
**lastSet** | [**WorkoutControlLastSet**](WorkoutControlLastSet.md) |  | [optional]
**lastAcceptedOperationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**handoffReason** | **String** |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
