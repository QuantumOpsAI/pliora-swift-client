# AccountLinkingChallengeResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**challengeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**expiresAt** | **Date** | Fim da validade do desafio, servido pelo servidor. |
**resendAvailableAt** | **Date** | Instante a partir do qual pedir outro código deixa de ser recusado. Servido pelo servidor; nunca um cronômetro local. Pedir antes dele responde &#x60;429&#x60; e **não invalida** o código já enviado. |
**maxAttempts** | **Int** | Limite de tentativas do desafio, servido para que nenhum app o embuta. O saldo restante **não** é publicado. |
**destinationHint** | **String** | Dica mascarada e uniforme, nunca confirmação de existência de conta. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
