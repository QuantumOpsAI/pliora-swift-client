# PersonalAttentionPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**asOf** | **Date** | Instante do servidor em que esta página foi calculada, obrigatório em toda leitura. Ele é o que ancora a janela móvel dos motivos de projeção, e é exigido pelo selo &#x60;PROJECTION&#x60; de &#x60;SyncItemOrigin&#x60;. |
**items** | [PersonalAttentionItemView] | Itens na ordenação total definida pela operação. Lista vazia é exatamente zero itens nesta leitura, e nunca erro, indisponibilidade ou afirmação sobre o estado de alguém. |
**nextCursor** | **String** | Cursor opaco da próxima página, **nulo na última**. Nunca é offset, índice ou dado a ser interpretado pelo cliente. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
