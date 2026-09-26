# PersonalStudentDiscomfortExecutionContextView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**sessionStatus** | **String** | Estado da sessão, com os mesmos valores que a execução já publica em &#x60;WorkoutSessionSyncView.status&#x60;; o conjunto é reusado sem alteração. |
**sessionOccurredAt** | **Date** | Instante da sessão, do servidor. |
**prescriptionVersionId** | **String** | Versão de prescrição atribuída sob a qual a sessão correu. Ausente quando a sessão não tem versão atribuída conhecida; ausência é ausência. | [optional]
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**executedVariantId** | **String** | Variante realmente executada, que não se presume igual à prescrita. |
**equipmentContextKey** | **String** | Contexto de equipamento, quando conhecido. Código de máquina estável, **nunca nome de aparelho exibível**. | [optional]
**sets** | [PersonalStudentExerciseSetContextView] | Séries daquele exercício naquela sessão, na ordem de execução. Lista vazia é exatamente zero séries registradas nesta leitura, e nunca indisponibilidade. |
**substitution** | [**PersonalStudentExerciseSubstitutionView**](PersonalStudentExerciseSubstitutionView.md) | Substituição daquele exercício naquela sessão, quando houve. Ausente quando não houve; ausência é ausência, nunca uma substituição neutra presumida. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
