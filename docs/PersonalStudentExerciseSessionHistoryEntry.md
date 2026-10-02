# PersonalStudentExerciseSessionHistoryEntry

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**sessionStatus** | **String** | Estado da sessão, com os mesmos valores que a execução já publica em &#x60;WorkoutSessionSyncView.status&#x60;; o conjunto é reusado sem alteração. |
**occurredAt** | **Date** | Instante terminal da sessão, do servidor. |
**executedVariantId** | **String** | Variante efetivamente executada nesta sessão. Ela pertence à chave: uma variante diferente não entra nesta série. |
**executedVariantLabel** | **String** | Rótulo da variante executada, preservado verbatim e nunca usado no lugar de &#x60;executedVariantId&#x60;. O catálogo não é guardado (ADR-0014): nenhum nome vem dele; para exercício do catálogo, que tem uma variante só, é o &#x60;displayName&#x60; da prescrição. |
**equipmentContextKey** | **String** | Contexto de equipamento efetivamente usado, quando conhecido. Código de máquina estável, **nunca nome de aparelho exibível**. | [optional]
**sets** | [PersonalStudentExerciseSetContextView] | Séries na ordem de execução, reusando a mesma forma que preserva prescrito, alvo e realizado. &#x60;actual.reps&#x60; é o número executado quando registrado; &#x60;null&#x60; é ausência de fato e nunca zero presumido. Nenhum limiar ou julgamento é derivado das repetições nesta leitura. |
**substitution** | [**PersonalStudentExerciseSubstitutionView**](PersonalStudentExerciseSubstitutionView.md) | Substituição daquele exercício naquela sessão, quando houve, com o motivo estruturado. Ausente quando não houve. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
