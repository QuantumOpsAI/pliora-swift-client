# StudentPushDestinationUpsertForbiddenProblemDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | URI estável que identifica a classe do problema. |
**title** | **String** | Resumo legível e estável para a classe do problema. server_localized; &#x60;code&#x60; é a autoridade estável para lógica de cliente, &#x60;title&#x60; nunca deve ser usado como chave de decisão. |
**status** | **Int** |  |
**code** | **String** | &#x60;FORBIDDEN&#x60; sem contexto de aluno; &#x60;PUSH_DESTINATION_OWNED_BY_ANOTHER_ACCOUNT&#x60; quando a instalação endereçada já é de outra conta e nunca é reatribuída. |
**detail** | **String** | Explicação contextual segura para exibição ou diagnóstico. | [optional]
**instance** | **String** | Referência opcional à ocorrência específica do problema. | [optional]
**correlationId** | **String** | Identificador opaco de correlação, repetido em Problem Details quando houver erro. |
**fieldErrors** | [FieldError] | Violações por campo quando a validação do comando falhar. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
