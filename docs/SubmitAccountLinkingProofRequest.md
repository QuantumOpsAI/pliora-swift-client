# SubmitAccountLinkingProofRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**proof** | **String** | Prova externa opaca, nunca persistida ou registrada em claro — o mesmo contrato de &#x60;SocialIdentityProofRequest.proof&#x60;. Ela é **contemporânea**: carrega o ID token do provedor assinado sobre o &#x60;nonce&#x60; desta intenção, e um token emitido para login comum, ou para outra intenção, é recusado. O cliente não interpreta este valor. |
**device** | [**DeviceContext**](DeviceContext.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
