# AccountLinkingIntentView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**challengeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**nonce** | **String** | Valor opaco de uso único, gerado pelo servidor e preso a esta intenção. O cliente o repassa ao provedor na autenticação e não o interpreta, deriva ou reaproveita. |
**expiresAt** | **Date** | Fim da validade da intenção, servido pelo servidor. O cliente exibe o que recebeu e não conta o tempo por conta própria; na ausência do dado, falha fechado. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
