# ExecutionSessionCompletePayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**completedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAtBasis** | **String** | A base do instante de término, enviada **só** pela tela de decisão do treino quando a sessão ainda está &#x60;IN_PROGRESS&#x60; — aberta pelo aviso de treino parado, antes das 12 horas — e o aluno escolhe terminar com o que foi feito. Com ela, o término é o instante do último registro (&#x60;lastRecordedAt&#x60;), e não o do pedido. O **Terminar treino** de dentro da sessão não envia o campo e usa o instante do pedido. Em sessão &#x60;INTERRUPTED&#x60; a regra do último registro vale sempre, com ou sem o campo. | [optional]
**pendingDeferralResolutions** | [DeferralResolutionAtCompletion] | Uma entrada por adiamento ainda aberto no instante do encerramento; lista vazia significa que não havia pendência, nunca que ela foi ignorada. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
