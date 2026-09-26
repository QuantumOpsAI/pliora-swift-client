# InvitationEmailOwnershipChallengeView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**challengeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**invitationId** | **String** | Convite a que este desafio está preso. A prova dele não vale para nenhum outro. |
**inviteeEmailMasked** | **String** | Destino irrecuperavelmente mascarado, para reconhecimento visual. |
**expiresAt** | **Date** | Fim da validade, servido pelo servidor. O cliente exibe o que recebeu e não conta o tempo por conta própria. |
**resendAvailableAt** | **Date** | Instante a partir do qual pedir outro código deixa de ser recusado. Servido pelo servidor; nunca um cronômetro local. |
**maxAttempts** | **Int** | Limite de tentativas do desafio, servido para que nenhum app o embuta. O saldo restante **não** é publicado. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
