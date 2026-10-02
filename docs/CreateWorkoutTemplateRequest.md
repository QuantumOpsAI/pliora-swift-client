# CreateWorkoutTemplateRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**templateId** | **String** | Identidade do modelo, gerada pelo cliente; o servidor adota em vez de emitir outra. |
**name** | **String** | Nome do modelo, autorado pelo personal e preservado verbatim; vira &#x60;content.name&#x60;. |
**description** | **String** | Descrição do modelo, autorada pelo personal e preservada verbatim UTF-8; ausente quando o personal não a escreveu. | [optional]
**tags** | **[String]** | Etiquetas do modelo, até dez, **na ordem em que o personal as escreveu**, que o servidor preserva. Uma etiqueta repetida — ignorando caixa e acento — é &#x60;422 VALIDATION_FAILED&#x60; no pedido, sem gravar. A lista não declara &#x60;uniqueItems&#x60; de propósito: o gerador a transformaria em conjunto não ordenado nos clientes, e a ordem das etiquetas é do personal. Ausente no pedido é nenhuma etiqueta. | [optional]
**goal** | [**WorkoutTemplateGoal**](WorkoutTemplateGoal.md) |  | [optional]
**level** | [**WorkoutTemplateLevel**](WorkoutTemplateLevel.md) |  | [optional]
**source** | [**WorkoutTemplateSource**](WorkoutTemplateSource.md) |  | [optional]
**loadPolicy** | [**PrescriptionLoadPolicy**](PrescriptionLoadPolicy.md) |  | [optional]
**notesPolicy** | [**PrescriptionNotesPolicy**](PrescriptionNotesPolicy.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
