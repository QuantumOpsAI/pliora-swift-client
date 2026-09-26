# PersonalOnboardingCompletionConflictProblemDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | URI estável que identifica a classe do problema. |
**title** | **String** | Resumo legível e estável para a classe do problema. server_localized; &#x60;code&#x60; é a autoridade estável para lógica de cliente, &#x60;title&#x60; nunca deve ser usado como chave de decisão. |
**status** | **Int** |  |
**code** | **String** |  |
**detail** | **String** | Explicação contextual segura para exibição ou diagnóstico. | [optional]
**instance** | **String** | Referência opcional à ocorrência específica do problema. | [optional]
**correlationId** | **String** | Identificador opaco de correlação, repetido em Problem Details quando houver erro. |
**fieldErrors** | [FieldError] | Violações por campo quando a validação do comando falhar. | [optional]
**currentState** | **String** |  | [optional]
**currentRevision** | **String** |  | [optional]
**blockingStepKey** | **String** | Qual passo impede a conclusão, presente **somente** em &#x60;INVALID_ONBOARDING_TRANSITION&#x60;, para que o app possa dizer o que falta em vez de dizer que não deu. O vocabulário é o mesmo de &#x60;PersonalOnboardingStepView.key&#x60; e de &#x60;PersonalOnboardingNextAction.targetStepKey&#x60;, e &#x60;PROFILE&#x60; é hoje o **único** membro publicado aqui porque é o único passo não-pulável: os outros três continuam sendo resolvidos como &#x60;SKIPPED&#x60; pela própria conclusão e nunca a impedem. Enum de resposta cresce sem quebra, então tornar outro passo obrigatório no futuro é acrescentar um valor, e não trocar a forma. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
