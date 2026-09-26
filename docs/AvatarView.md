# AvatarView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**state** | [**AvatarState**](AvatarState.md) |  |
**assetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**mediaVersion** | **String** | Versão opaca da mídia, parte da identidade do avatar junto com &#x60;assetId&#x60;. Muda a cada substituição e a cada importação aceita. O cliente compara por igualdade; não interpreta, não ordena aritmeticamente e não a fabrica. | [optional]
**origin** | [**AvatarOrigin**](AvatarOrigin.md) |  | [optional]
**variants** | [AvatarVariantView] | Derivados temporários disponíveis para leitura. Vazia em &#x60;NONE&#x60;, em &#x60;PROCESSING&#x60; e em &#x60;REJECTED&#x60;. | [optional]
**rejectionReason** | [**AvatarRejectionReason**](AvatarRejectionReason.md) |  | [optional]
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
