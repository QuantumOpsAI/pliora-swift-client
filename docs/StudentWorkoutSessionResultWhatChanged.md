# StudentWorkoutSessionResultWhatChanged

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**orderDivergence** | **Bool** | Divergência entre executedOrder e prescribedOrder. | [optional]
**splitBlocks** | **[String]** | Identificadores dos blocos separados nesta sessão. | [optional]
**substitutions** | [StudentWorkoutSessionResultSubstitution] | Substituições realizadas na sessão. | [optional]
**exerciseSetDifferences** | [StudentWorkoutSessionExerciseSetDifference] | Contagem de séries a mais ou a menos por exercício. | [optional]
**skips** | [StudentWorkoutSessionResultSkip] | Pulos de exercício ou série com justificativa declarada. | [optional]
**gapClassifications** | [StudentWorkoutSessionGapClassification] | Classificação de lacunas na execução: as séries &#x60;Não fiz&#x60;, &#x60;Fiz sem anotar os números&#x60; e com &#x60;valores da prescrição&#x60;. | [optional]
**deferredExercises** | [StudentWorkoutSessionResultDeferral] | Séries ou exercícios deixados para depois. | [optional]
**studentNotes** | [StudentWorkoutSessionStudentNote] | As observações do aluno na sessão, da série e das adaptações, marcadas ou não; o selo &#x60;Mostrado ao personal&#x60; vem de &#x60;sharedWithPersonal&#x60; de cada uma (§7.10). | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
