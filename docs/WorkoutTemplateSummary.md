# WorkoutTemplateSummary

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**templateId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome do modelo, o mesmo &#x60;content.name&#x60; da leitura inteira, autorado pelo personal e preservado verbatim. |
**description** | **String** | Descrição do modelo, autorada pelo personal e preservada verbatim UTF-8; ausente quando o personal não a escreveu. | [optional]
**tags** | **[String]** | Etiquetas do modelo, até dez, **na ordem em que o personal as escreveu**, que o servidor preserva. Uma etiqueta repetida — ignorando caixa e acento — é &#x60;422 VALIDATION_FAILED&#x60; no pedido, sem gravar. A lista não declara &#x60;uniqueItems&#x60; de propósito: o gerador a transformaria em conjunto não ordenado nos clientes, e a ordem das etiquetas é do personal. Ausente no pedido é nenhuma etiqueta. |
**goal** | [**WorkoutTemplateGoal**](WorkoutTemplateGoal.md) |  | [optional]
**level** | [**WorkoutTemplateLevel**](WorkoutTemplateLevel.md) |  | [optional]
**workoutCount** | **Int** |  |
**exerciseCount** | **Int** |  |
**revision** | **String** | A mesma revisão que &#x60;getPersonalWorkoutTemplate&#x60; devolve em &#x60;ETag&#x60;. |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
