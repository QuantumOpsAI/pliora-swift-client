# AccountLinkingProofView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**nextStep** | **String** | &#x60;LINKED&#x60;: não houve divergência, o provedor passou a valer para esta conta e &#x60;account&#x60; diz como. &#x60;POSSESSION_CHALLENGE_REQUIRED&#x60;: os e-mails divergem ou o provedor pertence a outra conta, o desafio foi emitido e nada foi migrado. |
**account** | [**AccountUnifiedView**](AccountUnifiedView.md) | Estado da conta depois do vínculo, presente **somente** em &#x60;LINKED&#x60;. O &#x60;outcome&#x60; que ele carrega diz se foi vínculo simples ou unificação; aqui, por não ter havido desafio, é sempre vínculo simples. | [optional]
**challenge** | [**AccountLinkingChallengeResponse**](AccountLinkingChallengeResponse.md) | Desafio de posse emitido, presente **somente** em &#x60;POSSESSION_CHALLENGE_REQUIRED&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
