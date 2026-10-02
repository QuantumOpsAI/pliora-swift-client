# PlanActivationChangeView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**asOf** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**asOfDate** | **Date** | Dia civil de &#x60;asOf&#x60; no fuso do vínculo; é a referência de &#x60;activation.daysUntilEnd&#x60;. |
**outcome** | [**PlanActivationOutcome**](PlanActivationOutcome.md) |  |
**activation** | [**PlanActivationView**](PlanActivationView.md) |  | [optional]
**replacedActivationId** | **String** | Ativação que esta substituiu e encerrou; só em &#x60;REPLACED&#x60;. | [optional]
**endedActivationId** | **String** | Ativação que esta operação encerrou; só em &#x60;ENDED&#x60;. | [optional]
**retiredAssignmentCount** | **Int** | Atribuições &#x60;AVAILABLE&#x60; futuras, materializadas pela ativação anterior, retiradas na mesma operação; só em &#x60;REPLACED&#x60;, &#x60;ALTERED&#x60; e &#x60;ENDED&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
