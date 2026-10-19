# StudentRelationshipView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | [**RelationshipStatus**](RelationshipStatus.md) |  |
**pausedBy** | [**RelationshipPausedBy**](RelationshipPausedBy.md) | Presente **exatamente** em &#x60;PAUSED&#x60;: o lado que pausou. &#x60;STUDENT&#x60; é este aluno, e a &#x60;AL19&#x60; diz &#x60;Você pausou este vínculo. Só você pode retomá-lo.&#x60;; &#x60;PERSONAL&#x60; é o personal, e a &#x60;AL19&#x60; e a linha &#x60;Vínculo&#x60; do Perfil dizem &#x60;Seu personal pausou este vínculo. Só ele pode retomá-lo.&#x60; — &#x60;P6&#x60; de &#x60;DOC-RELATIONSHIP-LIFECYCLE&#x60; §3, decisão do owner (2026-10-17, opção A). Com &#x60;PERSONAL&#x60;, Hoje, Treinos e a sessão seguem a &#x60;Q-18&#x60;, sem a palavra pausa; com &#x60;STUDENT&#x60;, o cartão de Hoje é a variante &#x60;C10b&#x60; (&#x60;P4&#x60;, pelo &#x60;pausedBy&#x60; de &#x60;getStudentTodayWorkout&#x60;). Um valor que o cliente não conhece usa o estado neutro, sem oferecer retomar. | [optional]
**canResume** | **Bool** | &#x60;true&#x60; exatamente quando o vínculo está &#x60;PAUSED&#x60; com &#x60;pausedBy: STUDENT&#x60; — só quem pausou retoma (&#x60;D2&#x60;). É o único sinal para oferecer &#x60;Retomar vínculo&#x60;; o cliente não o recalcula. &#x60;false&#x60; em &#x60;ACTIVE&#x60;, em &#x60;ENDED&#x60; e na pausa feita pelo personal, que o aluno continua podendo **encerrar**. |
**personalDisplayName** | **String** | Nome de exibição do personal do vínculo, conteúdo autorado preservado verbatim UTF-8, o mesmo de &#x60;StudentActivePersonalView.displayName&#x60;. Presente em &#x60;ACTIVE&#x60; e &#x60;PAUSED&#x60;; ausente em &#x60;ENDED&#x60;. Nunca traduzido, truncado sem reticências nem usado como chave, e nunca entra em frase da tela. | [optional]
**revision** | **String** | Validador opaco da versão do vínculo, o mesmo valor do &#x60;ETag&#x60; desta resposta: é o que o &#x60;If-Match&#x60; de pausar, retomar e encerrar ecoa. O cliente não o interpreta. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
