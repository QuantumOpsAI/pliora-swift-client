# PrescribedBlock

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**blockKey** | **String** | Identidade do bloco no treino; única em &#x60;blocks[]&#x60;. Identificador de máquina, nunca copy de tela. |
**blockType** | [**PrescribedBlockType**](PrescribedBlockType.md) |  |
**restRange** | [**PrescribedRestRange**](PrescribedRestRange.md) |  | [optional]
**stationRestSeconds** | **Int** | Descanso prescrito entre estações de um circuito, em segundos. Só existe em &#x60;CIRCUIT&#x60;; ausente quando o personal não o prescreveu, e nunca zero. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
