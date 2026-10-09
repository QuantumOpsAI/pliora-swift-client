# StudentExerciseProgressVariant

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantLabel** | **String** | O rótulo da variante, preservado verbatim — o que o seletor da evolução mostra (&#x60;Barra&#x60;, &#x60;Halteres&#x60;). Para o exercício do catálogo, que tem uma variante só, é o &#x60;displayName&#x60;. |
**equipmentContextKey** | **String** | O contexto de equipamento que fecha a chave de comparabilidade. Código de máquina estável, nunca nome de aparelho exibível. **Ausente** quando o contexto não discrimina; ausência é ausência, e nunca um equipamento padrão presumido. | [optional]
**lastExecutedOn** | **Date** | O dia civil (&#x60;localDate&#x60;) da sessão mais recente em que o par foi executado. |
**executionCount** | **Int** | Quantas sessões executaram o par; ao menos uma, ou o par não entra na lista. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
