# ExecutionExerciseDeferPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**deferralId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedPosition** | **Int** |  |
**executedPosition** | **Int** |  |
**reason** | **String** | Motivo estruturado do adiamento. **Fonte:** &#x60;pliora-docs&#x60;, &#x60;product/wireframes/workout-core/lote-3-workout-core-v2.2-spec.md&#x60; §9.4 (\&quot;Dados que o adiamento precisa preservar — lista fechada\&quot;), que nomeia &#x60;EQUIPMENT_BUSY&#x60; como o motivo inicial relevante do adiamento. &#x60;EQUIPMENT_BUSY&#x60; e &#x60;EQUIPMENT_UNAVAILABLE&#x60; são semanticamente distintos e não se substituem: **ocupado** é aparelho em uso por outra pessoa, que volta a ficar livre e permite o exercício retornar na fila dinâmica (tela F1, &#x60;STUDENT_WORKOUT_EQUIPMENT_BUSY&#x60;, §11.6); **indisponível** é aparelho quebrado ou ausente, que não retorna. Colapsar os dois destruiria o dado que o personal lê depois. O conjunto é fechado porque o motivo é fato de domínio auditável, não texto livre. Crescer o conjunto depois é **aditivo** (request-side: o servidor passa a aceitar mais); renomear ou remover um valor já publicado é **breaking** e exige MAJOR com plano de migração. |
**deferredAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
