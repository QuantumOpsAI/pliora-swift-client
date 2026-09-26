# PersonalStudentExerciseSessionHistoryEntry

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**sessionStatus** | **String** | Estado da sessão, com os mesmos valores que a execução já publica em &#x60;WorkoutSessionSyncView.status&#x60;; o conjunto é reusado sem alteração. |
**occurredAt** | **Date** | Instante terminal da sessão, do servidor. |
**executedVariantId** | **String** | Variante efetivamente executada nesta sessão. Ela pertence à chave: uma variante diferente não entra nesta série. |
**equipmentContextKey** | **String** | Contexto de equipamento efetivamente usado, quando conhecido. Código de máquina estável, **nunca nome de aparelho exibível**. | [optional]
**prescribedLoad** | [**WorkoutLoad**](WorkoutLoad.md) | Carga prescrita da sessão, na unidade canônica. &#x60;null&#x60; quando o exercício não tem carga prescrita: a comparação simplesmente não existe, e **nenhum valor presumido é preenchido para destravá-la**. |
**performedLoad** | [**WorkoutLoad**](WorkoutLoad.md) | Carga executada da sessão, na mesma unidade canônica. &#x60;null&#x60; quando não houve registro. Unidade divergente não é comparável e **nunca é convertida**. |
**substitution** | [**PersonalStudentExerciseSubstitutionView**](PersonalStudentExerciseSubstitutionView.md) | Substituição daquele exercício naquela sessão, quando houve, com o motivo estruturado. Ausente quando não houve. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
