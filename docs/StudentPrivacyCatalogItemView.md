# StudentPrivacyCatalogItemView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**consentType** | [**StudentConsentType**](StudentConsentType.md) |  |
**documentVersion** | **String** | Versão imutável do termo apresentado, resolvida pelo servidor e ecoada pelo cliente em &#x60;privacyDecisions[].documentVersion&#x60;. |
**documentText** | **String** | O texto exato e imutável desta versão, no locale negociado, apresentado por inteiro antes da confirmação. É o texto que o comprovante do aceite preserva. |
**documentSha256** | **String** | SHA-256, em hexadecimal minúsculo, dos bytes UTF-8 de &#x60;documentText&#x60;. O aceite grava texto, hash, locale e versão juntos, e o comprovante devolve os mesmos. |
**acceptanceRequired** | **Bool** | &#x60;true&#x60; somente em &#x60;SHARE_DATA_WITH_PERSONAL&#x60;: sem o ato &#x60;GRANTED&#x60; sobre ele o aceite é recusado com &#x60;403 CONSENT_REQUIRED&#x60;, sem consumir o convite. O cliente não deriva obrigatoriedade do tipo: lê este campo. |
**declineConsequence** | **String** | O que recusar este item faz, no locale negociado, para ser exibido **antes** da confirmação. Num item facultativo é texto a exibir, nunca um bloqueio; no item obrigatório diz que sem ele não é possível seguir com o vínculo. Nenhum cliente deriva obrigatoriedade daqui — ela está em &#x60;acceptanceRequired&#x60;. | [optional]
**title** | **String** | Título do item, no locale negociado. |
**summary** | **String** | Explicação curta do item, no locale negociado. |
**learnMoreUrl** | **String** | Endereço do texto completo, quando o servidor publica um. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
