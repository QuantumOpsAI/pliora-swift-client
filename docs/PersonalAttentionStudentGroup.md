# PersonalAttentionStudentGroup

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Vínculo **ativo** que autoriza este grupo; a autorização é verificada no servidor a cada leitura — nunca inferida de cache ou de leitura anterior. |
**studentId** | **String** | Identificador opaco do aluno; nunca nome, e-mail, telefone ou contato. |
**studentName** | **String** | O nome que o aluno informou no próprio Perfil, **como ele escreveu**, de 1 a 60 caracteres (code points Unicode), preservado byte a byte. Nesta fila, que só publica vínculos &#x60;ACTIVE&#x60;, é obrigatório e nunca nulo desde &#x60;DEC-PHOME-6&#x60;. A tela mostra este nome, com &#x60;studentLabel&#x60; como linha secundária quando os dois existem e diferem. |
**studentLabel** | **String** | Rótulo opcional do aluno, **somente** o nome autorado no convite que originou o vínculo. Ele nunca é lido do perfil atual do aluno, e a projeção não cria rótulo novo: é o mesmo rótulo que a carteira de relacionamentos publica. | [optional]
**operationalPriority** | [**PersonalOperationalPriority**](PersonalOperationalPriority.md) | Prioridade do grupo, decidida pelo servidor — nesta coleção é sempre &#x60;URGENT&#x60; ou &#x60;ATTENTION&#x60;, porque um grupo só existe com ao menos um motivo vigente. |
**reasons** | [AttentionReasonReference] | Motivos vigentes do vínculo, completos e na projeção mínima &#x60;AttentionReasonReference&#x60;. Um grupo sem motivo não é emitido. |
**destination** | [**PersonalCollectionDestination**](PersonalCollectionDestination.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
