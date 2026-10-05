# PersonalAttentionItemView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**itemId** | **String** | Identidade estável e reprodutível do item, derivada da chave de deduplicação do seu motivo: reprocessamento, retry ou nova leitura produzem o mesmo identificador para a mesma condição. É opaca, não carrega semântica e não é decodificada pelo cliente. Ela também é o desempate final da ordenação, e por isso é estável entre páginas. |
**relationshipId** | **String** | Vínculo **ativo** que autoriza este item. A fila só existe dentro de vínculos ativos deste personal, e a autorização é verificada no servidor a cada leitura — nunca inferida de leitura anterior, de cache ou de estado de tela. |
**studentId** | **String** | Identificador opaco do aluno; nunca nome, e-mail, telefone ou contato. |
**studentLabel** | **String** | Rótulo opcional do aluno, **somente** o nome autorado no convite que originou o vínculo. Ele nunca é lido do perfil atual do aluno, e a projeção não cria rótulo novo: é o mesmo rótulo que a carteira de relacionamentos publica. | [optional]
**studentName** | **String** | O nome que o aluno informou no próprio Perfil, **como ele escreveu**, de 1 a 60 caracteres (code points Unicode), preservado byte a byte. Nesta fila, que só publica vínculos &#x60;ACTIVE&#x60;, é obrigatório e nunca nulo desde &#x60;DEC-PHOME-6&#x60;. A tela mostra este nome, com &#x60;studentLabel&#x60; como linha secundária quando os dois existem e diferem; não é o &#x60;studentLabel&#x60; do convite nem o &#x60;studentDisplayName&#x60; dos convites. |
**reasonCode** | [**PersonalAttentionReasonCode**](PersonalAttentionReasonCode.md) |  |
**origin** | [**SyncItemOrigin**](SyncItemOrigin.md) |  |
**occurredAt** | **Date** | Instante de ordenação do item, sempre do servidor, com **definição única por motivo** e nunca uma disjunção: o instante do relato em &#x60;DISCOMFORT_REPORTED&#x60;; o da conclusão daquela versão em &#x60;ANAMNESIS_COMPLETED_PENDING_REVIEW&#x60;; aquele em que o bloqueio passou a vigorar em &#x60;PRESCRIPTION_ELIGIBILITY_BLOCKED&#x60;; e o da ocorrência mais recente que sustenta o limiar nos dois motivos de projeção. Nos motivos 4 e 5 ele **muda** quando uma ocorrência nova entra na janela, sem alterar &#x60;itemId&#x60;: o item sobe na fila e continua sendo o mesmo item. |
**window** | [**PersonalAttentionWindow**](PersonalAttentionWindow.md) | Janela e limiar que sustentam o item. Presente **exatamente** quando &#x60;origin&#x60; é &#x60;PROJECTION&#x60;, e ausente quando é &#x60;FACT&#x60; — um fato imediato não tem janela, e inventar uma para ele o transformaria em estatística. | [optional]
**destination** | [**PersonalAttentionDestination**](PersonalAttentionDestination.md) |  |
**parameters** | [**PersonalAttentionParameters**](PersonalAttentionParameters.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
