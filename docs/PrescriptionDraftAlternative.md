# PrescriptionDraftAlternative

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**alternativeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**alternativeType** | [**PrescribedAlternativeType**](PrescribedAlternativeType.md) |  |
**variantId** | **String** | Variante autorizada; em &#x60;ALTERNATIVE_EXERCISE&#x60; é a variante do exercício alternativo. |
**exerciseId** | **String** | Exercício alternativo; presente somente quando &#x60;alternativeType&#x60; é &#x60;ALTERNATIVE_EXERCISE&#x60;. | [optional]
**priority** | **Int** |  | [optional]
**authorizationScope** | [**PrescribedAuthorizationScope**](PrescribedAuthorizationScope.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
