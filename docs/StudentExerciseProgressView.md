# StudentExerciseProgressView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**displayName** | **String** | O rótulo mais recente que uma prescrição deu ao exercício, preservado verbatim e invariante de locale. |
**variant** | [**StudentExerciseProgressVariant**](StudentExerciseProgressVariant.md) | A variante lida — a pedida, ou a de execução mais recente quando &#x60;variantId&#x60; não veio —, com a data da última execução e a contagem de sessões. |
**sessions** | [StudentExerciseProgressSession] | As execuções da variante nesta página, do dia mais recente ao mais antigo. Vazia só quando a página está além da última. |
**records** | [StudentProgressRecord] | Os recordes da variante, projeção sobre as séries elegíveis dela: o melhor de cada critério e de cada unidade gravada — um &#x60;MAX_LOAD&#x60; por unidade, um &#x60;MAX_REPS_AT_LOAD&#x60; por carga e unidade, um &#x60;MAX_DURATION&#x60; por carga e unidade. Vazia quando a variante ainda não tem recorde — a primeira vez não é recorde. |
**nextCursor** | **String** | Cursor opaco da próxima página de sessões, **nulo na última**. Nunca é offset, índice ou dado a ser interpretado pelo cliente; é base64url, sem espaço nem pontuação. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
