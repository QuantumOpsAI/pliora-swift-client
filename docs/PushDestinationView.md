# PushDestinationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**installationId** | **String** | Identidade opaca da instalação, **gerada pelo app** na conta que a registra: alfanumérica estável, sem espaço e sem pontuação fora &#x60;-&#x60; e &#x60;_&#x60;, e **nunca** identificador físico do aparelho — nem serial, IMEI, MAC, &#x60;ANDROID_ID&#x60;, &#x60;identifierForVendor&#x60; nem qualquer valor emitido por hardware, SO ou provedor de push. O servidor não a interpreta nem a expõe a outra conta; troca de conta gera identidade nova e exige preparo do novo binding; fencing atômico invalida o destino/token anterior antes de ativar o novo. |
**platform** | [**PushPlatform**](PushPlatform.md) |  |
**provider** | [**PushProvider**](PushProvider.md) |  |
**apnsEnvironment** | [**PushApnsEnvironment**](PushApnsEnvironment.md) |  | [optional]
**permissionState** | [**PushPermissionState**](PushPermissionState.md) |  |
**locale** | [**Locale**](Locale.md) |  |
**receivingEnabled** | **Bool** |  |
**capabilities** | Set<PushCapability> |  |
**status** | **String** |  |
**registeredAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**revision** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
