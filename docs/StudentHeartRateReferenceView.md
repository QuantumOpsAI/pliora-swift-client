# StudentHeartRateReferenceView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | **String** | Se a referência está calculável nesta conta. |
**asOf** | **Date** | Instante do servidor em que este estado foi projetado. |
**maxHeartRateReferenceBpm** | **Int** | Referência de FC máxima em batimentos por minuto; só presente com &#x60;status&#x60; &#x60;AVAILABLE&#x60;. | [optional]
**method** | **String** | Método do cálculo; só presente com &#x60;status&#x60; &#x60;AVAILABLE&#x60;. | [optional]
**validOn** | **Date** | Data UTC em que o cálculo vale; o app relê quando a data local passa. Só presente com &#x60;status&#x60; &#x60;AVAILABLE&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
