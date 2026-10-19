# PreparePushRegistrationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**installationId** | **String** | Identidade opaca da instalação, **gerada pelo app** na conta que a registra: alfanumérica estável, sem espaço e sem pontuação fora &#x60;-&#x60; e &#x60;_&#x60;, e **nunca** identificador físico do aparelho — nem serial, IMEI, MAC, &#x60;ANDROID_ID&#x60;, &#x60;identifierForVendor&#x60; nem qualquer valor emitido por hardware, SO ou provedor de push. O servidor não a interpreta nem a expõe a outra conta; troca de conta gera identidade nova e exige preparo do novo binding; fencing atômico invalida o destino/token anterior antes de ativar o novo. |
**platform** | [**PushPlatform**](PushPlatform.md) |  |
**provider** | [**PushProvider**](PushProvider.md) |  |
**token** | **String** | Write-only. Limite adicional de4096 bytes UTF-8 validado no servidor. Nunca em view/erro/log/crash. |
**apnsEnvironment** | [**PushApnsEnvironment**](PushApnsEnvironment.md) |  | [optional]
**permissionState** | [**PushPermissionState**](PushPermissionState.md) |  |
**locale** | [**Locale**](Locale.md) |  | [optional]
**receivingEnabled** | **Bool** |  |
**capabilities** | Set<PushCapability> |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
