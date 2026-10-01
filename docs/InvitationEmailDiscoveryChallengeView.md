# InvitationEmailDiscoveryChallengeView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**challengeId** | **String** | Desafio preso à conta autenticada; de outra conta, responde como inexistente. |
**destinationMasked** | **String** | O endereço digitado, irrecuperavelmente mascarado, para a pessoa conferir o que digitou. |
**expiresAt** | **Date** | Fim da validade, servido pelo servidor; nunca um cronômetro local. |
**resendAvailableAt** | **Date** | Instante a partir do qual pedir outro código deixa de ser recusado com &#x60;429&#x60;. Servido pelo servidor. |
**maxAttempts** | **Int** | Limite de tentativas do desafio. O saldo restante não é publicado. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
