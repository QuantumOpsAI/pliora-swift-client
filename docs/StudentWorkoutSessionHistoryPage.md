# StudentWorkoutSessionHistoryPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**items** | [StudentWorkoutSessionHistoryItem] | Os treinos do recorte. No modo por cursor, no máximo &#x60;limit&#x60; (até 50); no modo de intervalo, todos os do intervalo, e o teto do esquema é só de segurança. |
**nextCursor** | **String** | Cursor opaco da próxima página, **nulo na última** e sempre nulo no modo de intervalo. Nunca é offset, índice ou dado a ser interpretado pelo cliente; é base64url, sem espaço nem pontuação. |
**firstSessionOn** | **Date** | A data civil (&#x60;localDate&#x60;) da primeira sessão do aluno que entra no histórico, em qualquer modo e sem depender de &#x60;from&#x60;, &#x60;to&#x60; nem do cursor: o limite inferior da navegação de mês. **Nulo** é o estado de quem nunca treinou. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
