# PersonalPrescriptionConflictProblemDetails

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
**existingDraftId** | **String** | Identidade do rascunho que já está aberto para o aluno, presente **somente** em &#x60;DRAFT_ALREADY_OPEN&#x60;. É o que permite ao app abrir o rascunho existente ou descartá-lo, sem uma leitura a mais e sem expor nada além de uma identidade que o próprio personal criou: o rascunho é do mesmo vínculo e do mesmo autor que está pedindo. | [optional]
**blockingReasons** | Set<StudentPrescriptionEligibilityBlockingReason> | Por que o aluno está bloqueado, acumulável e nomeado, presente **somente** em &#x60;STUDENT_NOT_ELIGIBLE&#x60;. É o mesmo &#x60;StudentPrescriptionEligibilityBlockingReason&#x60; que o personal já lê em &#x60;GET /personal/students/{studentId}/anamnesis&#x60; e em &#x60;GET /personal/students/operations&#x60; sobre o mesmo aluno — reusado, e não recriado, para que a recusa e a leitura não possam divergir sobre a mesma decisão. A recusa não é superfície nova: ela repete ali o que o mesmo ator já obtém numa leitura, e resolver um motivo não resolve os outros. &#x60;RELATIONSHIP_NOT_ACTIVE&#x60; pertence ao enum reusado, mas não chega aqui nestas operações: vínculo encerrado é respondido antes, como &#x60;403 RELATIONSHIP_INACTIVE&#x60;, que é veredito de autorização sobre quem chama, e não estado derivado do aluno. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
