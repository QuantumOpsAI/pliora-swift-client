# UpsertStudentPushDestinationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**provider** | [**StudentPushDestinationProvider**](StudentPushDestinationProvider.md) |  |
**token** | **String** | Token de registro FCM ou device token APNs. Credencial de entrega em posse da instalação: &#x60;writeOnly&#x60;, nunca devolvido por leitura ou erro e nunca registrado em log, métrica ou &#x60;fieldErrors&#x60;. |
**apnsEnvironment** | [**StudentPushDestinationApnsEnvironment**](StudentPushDestinationApnsEnvironment.md) | Ambiente APNs do token; obrigatório com &#x60;APNS&#x60;, proibido com &#x60;FCM&#x60;. | [optional]
**permissionState** | [**StudentPushDestinationPermissionState**](StudentPushDestinationPermissionState.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
