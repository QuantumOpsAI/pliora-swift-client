# PersonalStudentPlanActivationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**asOf** | **Date** | Instante do servidor em que esta fotografia foi lida. |
**asOfDate** | **Date** | Dia civil de &#x60;asOf&#x60; no fuso do vínculo; é a referência de &#x60;activation.daysUntilEnd&#x60; e de &#x60;activation.validity&#x60;, e o app não calcula \&quot;hoje\&quot; por conta própria. |
**relationshipState** | [**PlanRelationshipState**](PlanRelationshipState.md) |  |
**activation** | [**PlanActivationView**](PlanActivationView.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
