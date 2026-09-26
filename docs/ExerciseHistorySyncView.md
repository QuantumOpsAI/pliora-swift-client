# ExerciseHistorySyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantId** | **String** | Variante a que este histórico pertence; o histórico da variante A nunca traz execução da variante B. |
**equipmentContextKey** | **String** | Contexto de equipamento que, junto com a variante, fecha a chave de comparabilidade. Código de máquina estável, nunca nome de aparelho exibível. |
**comparisonStatus** | [**ComparisonStatus**](ComparisonStatus.md) |  |
**entries** | [ExerciseHistoryEntry] | Execuções comparáveis, da mais recente para a mais antiga, com carga e repetições de cada série preservadas individualmente. Vazio quando &#x60;comparisonStatus&#x60; não é &#x60;COMPARED&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
