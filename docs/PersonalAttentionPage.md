# PersonalAttentionPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**asOf** | **Date** | Instante do servidor em que a leitura foi cortada, obrigatório em toda página. Ele ancora a janela móvel dos motivos de projeção e é o mesmo em todas as páginas de uma leitura aceita. |
**origin** | [**SyncItemOrigin**](SyncItemOrigin.md) | Selo de origem reusado sem variação. Nesta leitura é sempre &#x60;PROJECTION&#x60;: a página é um read model derivado e reconstruível, e o selo é o que torna &#x60;asOf&#x60; exigível por schema, e não só por prosa. |
**querySnapshotId** | **String** | Identificador opaco da equivalência da leitura, derivado autenticamente do mesmo escopo e digest do cursor. O cliente não o calcula, não o decodifica e nunca o usa como autorização; ele só permite reconhecer que duas páginas pertencem à mesma leitura. |
**expiresAt** | **Date** | Instante absoluto de expiração da continuação — &#x60;asOf&#x60; mais 300 segundos, fixo desde a primeira página e **nunca** prorrogado por continuação. Depois dele o cursor responde &#x60;410 CURSOR_EXPIRED&#x60;. |
**counts** | [**PersonalAttentionQueryCounts**](PersonalAttentionQueryCounts.md) |  |
**items** | [PersonalAttentionStudentGroup] | Grupos por vínculo na ordenação total definida pela operação. Lista vazia é exatamente zero vínculos nesta leitura, e nunca erro, indisponibilidade ou afirmação sobre o estado de alguém. |
**nextCursor** | **String** | Cursor opaco da próxima página, **nulo na última**. Nunca é offset, índice ou dado a ser interpretado pelo cliente. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
