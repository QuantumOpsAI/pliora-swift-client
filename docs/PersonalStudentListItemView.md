# PersonalStudentListItemView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identidade pública opaca do aluno do vínculo; nunca nome, e-mail ou contato. |
**studentLabel** | **String** | Rótulo autorado no convite, preservado verbatim UTF-8; ausente quando o convite não trouxe nome. Nunca traduzido e nunca derivado do perfil atual do aluno. | [optional]
**studentName** | **String** | O nome que o aluno informou no próprio Perfil, **como ele escreveu**, de 1 a 60 caracteres (code points Unicode), preservado byte a byte. Em vínculos &#x60;ACTIVE&#x60; e &#x60;PAUSED&#x60; é **obrigatório e nunca nulo**: o onboarding do aluno exige o nome antes do aceite do vínculo (&#x60;DEC-PHOME-6&#x60;, &#x60;DOC-ONBOARDING-ASSESSMENT&#x60; §3.10), e o commit do aceite recusa enquanto o perfil não tem nome. Em &#x60;ENDED&#x60; é **sempre &#x60;null&#x60;** (ou ausente, que equivale a &#x60;null&#x60;), porque o nome é do aluno e não acompanha um vínculo encerrado — &#x60;studentLabel&#x60;, que é do personal, continua. Não é o &#x60;studentLabel&#x60; desta carteira nem o &#x60;studentDisplayName&#x60; dos convites (metadado privado do personal): outro dono, outro campo, e o nome do aluno nunca entra em &#x60;studentDisplayName&#x60;. A tela mostra este nome quando houver, com &#x60;studentLabel&#x60; como linha secundária se diferirem; nunca o traduz, nunca o trunca sem reticências e nunca o usa como chave. | [optional]
**status** | [**RelationshipStatus**](RelationshipStatus.md) |  |
**pausedBy** | [**RelationshipPausedBy**](RelationshipPausedBy.md) | Presente **exatamente** em &#x60;PAUSED&#x60; (desde 0.93.0): o lado que pausou, por papel — nunca nome, e-mail, data ou motivo. A lista &#x60;Vínculos pausados&#x60; diz &#x60;Pausado por você&#x60; quando é &#x60;PERSONAL&#x60; e &#x60;Pausado pelo aluno&#x60; quando é &#x60;STUDENT&#x60; — &#x60;P7&#x60; de &#x60;DOC-RELATIONSHIP-LIFECYCLE&#x60; §3, decisão do owner (2026-10-17, opção A). O aviso &#x60;Vínculo pausado&#x60;, a Orientação e a fila seguem sem autoria. Valor desconhecido é tratado como pausa sem autoria. | [optional]
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAt** | **Date** | Instante server-owned do encerramento. Presente exatamente em &#x60;ENDED&#x60; e ausente nos demais estados; a ausência é ausência, nunca data zero. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
