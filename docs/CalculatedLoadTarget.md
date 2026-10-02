# CalculatedLoadTarget

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedSetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**loadPercent** | **Double** | O percentual prescrito da série, ecoado; é o prescrito e nunca é reescrito. |
**state** | [**CalculatedLoadTargetState**](CalculatedLoadTargetState.md) |  |
**loadValue** | **Double** | Carga calculada; presente somente em &#x60;CALCULATED&#x60;, e nunca zero. | [optional]
**loadUnit** | [**PrescribedLoadUnit**](PrescribedLoadUnit.md) | Unidade da carga calculada, a da referência; presente somente em &#x60;CALCULATED&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
