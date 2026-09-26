# PersonalStudentOperationsPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**asOf** | **Date** | Instante do servidor em que esta página foi calculada, obrigatório em toda leitura. Ele amarra cada estado a um corte, e é o que impede que uma leitura de três dias atrás e uma de três segundos atrás sejam indistinguíveis. |
**origin** | [**SyncItemOrigin**](SyncItemOrigin.md) | Selo de origem já publicado, reusado sem variação. Nesta leitura ele é sempre &#x60;PROJECTION&#x60;, porque nada aqui é entidade armazenada: cada item é derivado dos fatos de relacionamento, anamnese, elegibilidade, atribuição e execução, e o selo &#x60;PROJECTION&#x60; é o que torna &#x60;asOf&#x60; exigível por schema, e não só por prosa. |
**items** | [PersonalStudentOperationItemView] | Vínculos ativos desta página, na ordenação total definida pela operação. Lista vazia é exatamente zero vínculos ativos nesta leitura, e nunca erro, indisponibilidade ou afirmação sobre o estado de alguém. |
**nextCursor** | **String** | Cursor opaco da próxima página, **nulo na última**. Nunca é offset, índice ou dado a ser interpretado pelo cliente. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
