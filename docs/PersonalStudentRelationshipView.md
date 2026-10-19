# PersonalStudentRelationshipView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identidade pública opaca do aluno do vínculo, a mesma da carteira: é a chave da Orientação do aluno, para onde o app volta depois de retomar. Nunca nome, e-mail ou contato. |
**studentLabel** | **String** | Rótulo autorado no convite que originou o vínculo, preservado verbatim UTF-8, com a mesma regra de &#x60;PersonalStudentListItemView.studentLabel&#x60;; ausente quando o convite não trouxe nome. Nunca traduzido e nunca derivado do perfil atual do aluno. | [optional]
**studentName** | **String** | O nome que o aluno informou no próprio Perfil, como ele escreveu, de 1 a 60 code points, com a mesma regra de &#x60;PersonalStudentListItemView.studentName&#x60;: obrigatório e nunca nulo em &#x60;ACTIVE&#x60; e &#x60;PAUSED&#x60;, sempre &#x60;null&#x60; em &#x60;ENDED&#x60;. A tela mostra este nome com &#x60;studentLabel&#x60; de apoio quando diferem; o nome nunca entra em frase da tela. | [optional]
**status** | [**RelationshipStatus**](RelationshipStatus.md) |  |
**pausedBy** | [**RelationshipPausedBy**](RelationshipPausedBy.md) | Presente **exatamente** em &#x60;PAUSED&#x60;: o lado que pausou. &#x60;PERSONAL&#x60; é este personal, e a tela diz &#x60;Você pausou este vínculo. Só você pode retomá-lo.&#x60;; &#x60;STUDENT&#x60; é o aluno, e a tela do vínculo diz &#x60;O aluno pausou este vínculo. Só o aluno pode retomá-lo.&#x60; — &#x60;P7&#x60; de &#x60;DOC-RELATIONSHIP-LIFECYCLE&#x60; §3, decisão do owner (2026-10-17, opção A). O aviso &#x60;Vínculo pausado&#x60;, a Orientação e a fila continuam sem autoria em qualquer caso, e um valor que o cliente não conhece usa a variante neutra &#x60;Este vínculo está pausado. Só quem o pausou pode retomá-lo.&#x60;. | [optional]
**canResume** | **Bool** | &#x60;true&#x60; exatamente quando o vínculo está &#x60;PAUSED&#x60; com &#x60;pausedBy: PERSONAL&#x60; — só quem pausou retoma (&#x60;D2&#x60;). É o único sinal para oferecer &#x60;Retomar vínculo&#x60;; o cliente não o recalcula. &#x60;false&#x60; em &#x60;ACTIVE&#x60;, em &#x60;ENDED&#x60; e na pausa feita pelo aluno, que continua podendo ser **encerrada** pelo personal. |
**revision** | **String** | Validador opaco da versão do vínculo, o mesmo valor do &#x60;ETag&#x60; desta resposta: é o que o &#x60;If-Match&#x60; de pausar, retomar e encerrar ecoa. O cliente não o interpreta. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
