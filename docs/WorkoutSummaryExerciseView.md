# WorkoutSummaryExerciseView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedExerciseId** | **String** | Identidade do exercício na prescrição, a mesma do bundle da sessão. |
**variantId** | **String** | Variante prescrita do exercício. |
**position** | **Int** | Posição prescrita do exercício dentro do treino, começando em 1. É a ordem do personal, não uma ordem de execução escolhida pelo aluno. |
**name** | **String** | Nome do exercício prescrito {ex. \&quot;Supino Reto\&quot;}: o &#x60;displayName&#x60; da prescrição, o rótulo que o personal deu ao exercício. Dado do domínio, preservado verbatim UTF-8 e invariante de locale. |
**setCount** | **Int** | Quantidade de séries prescritas para este exercício; igual ao tamanho de &#x60;sets&#x60;. |
**blockKey** | **String** | Bloco combinado do exercício, quando ele consta num bloco de &#x60;blocks[]&#x60; do treino; ausente fora de bloco. Identificador de máquina. | [optional]
**notes** | **String** | Observação do personal para este exercício, preservada verbatim UTF-8, nunca traduzida nem truncada. Ausente quando não há. | [optional]
**cadence** | [**PrescribedCadence**](PrescribedCadence.md) |  | [optional]
**technique** | [**PrescribedTechnique**](PrescribedTechnique.md) |  | [optional]
**sets** | [WorkoutSummarySetView] | Séries prescritas do exercício, na ordem de &#x60;setIndex&#x60;. |
**lastComparable** | [**WorkoutSummaryLastComparableView**](WorkoutSummaryLastComparableView.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
