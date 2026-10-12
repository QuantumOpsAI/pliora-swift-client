# StudentPushDestinationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**installationId** | **String** | Identidade opaca da instalação, **gerada pelo app** na conta que a registra: alfanumérica estável, sem espaço e sem pontuação fora &#x60;-&#x60; e &#x60;_&#x60;, e **nunca** identificador físico do aparelho — nem serial, IMEI, MAC, &#x60;ANDROID_ID&#x60;, &#x60;identifierForVendor&#x60; nem qualquer valor emitido por hardware, SO ou provedor de push. O servidor não a interpreta nem a expõe a outra conta; troca de conta gera identidade nova, porque destino alheio não é reatribuído. |
**provider** | [**StudentPushDestinationProvider**](StudentPushDestinationProvider.md) |  |
**apnsEnvironment** | [**StudentPushDestinationApnsEnvironment**](StudentPushDestinationApnsEnvironment.md) | Ambiente APNs declarado no registro; presente somente com &#x60;provider&#x60; &#x60;APNS&#x60;. | [optional]
**status** | **String** | &#x60;ACTIVE&#x60; é candidato a envio; &#x60;INACTIVE&#x60; nunca recebe — a desativação encerra a entrega sem apagar o registro, para que a revisão continue endereçável e a reativação exija token novo. |
**registeredAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**revision** | **String** | Revisão opaca do destino, igual ao &#x60;ETag&#x60; das respostas de escrita. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
