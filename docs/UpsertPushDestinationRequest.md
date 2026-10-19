# UpsertPushDestinationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**platform** | [**PushPlatform**](PushPlatform.md) |  |
**provider** | [**PushProvider**](PushProvider.md) |  |
**token** | **String** | Write-only. Limite adicional de4096 bytes UTF-8 validado no servidor. Nunca em view/erro/log/crash. |
**apnsEnvironment** | [**PushApnsEnvironment**](PushApnsEnvironment.md) |  | [optional]
**permissionState** | [**PushPermissionState**](PushPermissionState.md) |  |
**locale** | [**Locale**](Locale.md) |  | [optional]
**receivingEnabled** | **Bool** |  |
**capabilities** | Set<PushCapability> |  |
**registrationContextId** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
