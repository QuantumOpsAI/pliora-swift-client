# AccountEmailCancellationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accountId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**attemptId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**purpose** | **String** |  |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**state** | **String** |  |
**cancelledAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]
**confirmedAccount** | [**AccountEmailConfirmedAccountView**](AccountEmailConfirmedAccountView.md) |  | [optional]
**rereadRequired** | **Bool** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
