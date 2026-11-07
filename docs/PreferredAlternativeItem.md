# PreferredAlternativeItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**alternativeExerciseRef** | **String** | &#x60;exerciseId&#x60; do exercício da troca, na mesma forma de &#x60;PrescriptionDraftAlternative.exerciseId&#x60;: um exercício do catálogo que já tem identidade no Pliora ou um exercício próprio ativo do personal. Nunca igual à origem e nunca repetido na mesma lista. |
**alternativeType** | [**PrescribedAlternativeType**](PrescribedAlternativeType.md) | Mesma distinção da alternativa no rascunho. Como a troca é identificada pelo exercício e todo exercício do catálogo e todo exercício próprio tem uma única variante (&#x60;ADR-0014&#x60; §3), a escrita só aceita &#x60;ALTERNATIVE_EXERCISE&#x60;; &#x60;VARIANT&#x60; é recusado com &#x60;ALTERNATIVE_TYPE_MISMATCH&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
