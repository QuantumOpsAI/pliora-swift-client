# StudentAnamnesisAnalysisHistoryPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**asOf** | **Date** | Instante do servidor do corte desta página — sob leituras novas o histórico pode crescer; o cursor preserva o ponto de continuação. |
**items** | [AnamnesisAnalysisHistoryAct] | Atos dos casos da ficha do **vínculo atual do aluno** na ordem total do servidor: sequência de nascimento do caso na ficha, sequência de commit do ato dentro dele e &#x60;actId&#x60; crescente como desempate final. O cliente não reordena, não reagrupa e não filtra. |
**nextCursor** | **String** | Cursor opaco da próxima página, nulo na última — válido somente para esta operação e esta conta. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
