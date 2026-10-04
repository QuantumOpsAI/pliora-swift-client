# StudentInvitationAcceptanceConflictProblemDetails

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
**blockingStepKey** | **String** | Qual passo do onboarding do aluno impede o aceite, presente **somente** em &#x60;INVALID_ONBOARDING_TRANSITION&#x60;, para que o app leve a pessoa ao passo que falta em vez de dizer que não deu. &#x60;STUDENT_PROFILE_NAME&#x60; é o passo S2c do onboarding (&#x60;DOC-ONBOARDING-ASSESSMENT&#x60; §10.1): informar o nome com &#x60;saveStudentProfile&#x60;. É o **único** membro publicado aqui porque o nome é a única pré-condição do vínculo que o aceite verifica por este código; enum de resposta cresce sem quebra, então outra pré-condição é acrescentar um valor, e não trocar a forma. O nome do aluno nunca viaja nesta resposta. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
