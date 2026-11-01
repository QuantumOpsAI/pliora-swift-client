# StudentWorkoutSessionResultWhatChanged

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**orderDivergence** | **Bool** | Divergência entre executedOrder e prescribedOrder. | [optional]
**splitBlocks** | **[String]** | Identificadores dos blocos separados nesta sessão. | [optional]
**substitutions** | [StudentWorkoutSessionResultSubstitution] | Substituições realizadas na sessão. | [optional]
**exerciseSetDifferences** | [StudentWorkoutSessionExerciseSetDifference] | Contagem de séries a mais ou a menos por exercício. | [optional]
**skips** | [StudentWorkoutSessionResultSkip] | Pulos de exercício ou série com justificativa declarada. | [optional]
**gapClassifications** | [StudentWorkoutSessionGapClassification] | Classificação de lacunas na execução. | [optional]
**deferredExercises** | [StudentWorkoutSessionResultDeferral] | Séries ou exercícios deixados para depois. | [optional]
**studentNotes** | [StudentWorkoutSessionStudentNote] | Observações do aluno marcadas com o selo Mostrado ao personal (§7.10). | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
