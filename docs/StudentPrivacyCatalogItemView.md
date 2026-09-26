# StudentPrivacyCatalogItemView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**consentType** | [**StudentConsentType**](StudentConsentType.md) |  |
**documentVersion** | **String** | Versão vigente do termo, resolvida pelo servidor. |
**declineConsequence** | **String** | O que recusar este item faz com a relação, no locale negociado, para ser exibido **antes** da confirmação. Presente somente quando recusar tem consequência que a pessoa precisa conhecer — recusar o compartilhamento com o personal, por exemplo, **esvazia a relação**. É texto a exibir, **nunca** um bloqueio: recusar é decisão registrada e não vira erro, e o aceite não é recusado por causa dela (&#x60;DOC-ONBOARDING-ASSESSMENT&#x60; §10.1, S4). Nenhum cliente deriva obrigatoriedade daqui, porque não existe item obrigatório nesta versão. **Lacuna registrada, e não fechada aqui: o campo é opcional.** Um servidor que sirva o catálogo sem ele em &#x60;SHARE_DATA_WITH_PERSONAL&#x60; satisfaz este contrato e mesmo assim descumpre a §10.1, porque o app não teria o que exibir. Este schema **permite** cumprir a §10.1; ele **não garante** que ela seja cumprida, e a obrigação continua vivendo na §10.1, não aqui. Torná-lo obrigatório forçaria texto em item sem consequência, e obrigação condicional por &#x60;consentType&#x60; não se expressa limpo em JSON Schema — a escolha é deliberada, e quem implementar o servidor precisa sabê-la. | [optional]
**title** | **String** | Título do item, no locale negociado. |
**summary** | **String** | Explicação curta do item, no locale negociado. |
**learnMoreUrl** | **String** | Endereço do texto completo, quando o servidor publica um. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
