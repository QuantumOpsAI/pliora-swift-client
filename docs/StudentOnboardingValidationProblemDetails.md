# StudentOnboardingValidationProblemDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | URI estável que identifica a classe do problema. |
**title** | **String** | Resumo legível e estável para a classe do problema. server_localized; &#x60;code&#x60; é a autoridade estável para lógica de cliente, &#x60;title&#x60; nunca deve ser usado como chave de decisão. |
**status** | **Int** |  |
**code** | **String** | Catálogo fechado desta família. Nenhum código de consentimento existe aqui: a triagem de prontidão tem base própria. &#x60;ANAMNESIS_VERSION_SELECTION_INVALID&#x60; é a seleção de versões anteriores que inclui versão que não é do aluno, que não está concluída ou que nasceu no próprio vínculo destinatário; a seleção inteira é recusada, e o erro não diz qual versão. |
**detail** | **String** | Explicação contextual segura para exibição ou diagnóstico. | [optional]
**instance** | **String** | Referência opcional à ocorrência específica do problema. | [optional]
**correlationId** | **String** | Identificador opaco de correlação, repetido em Problem Details quando houver erro. |
**fieldErrors** | [FieldError] |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
