# StudentTodayCardOpenSessionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | A identidade da sessão, a mesma que o início adotou. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão fixada da prescrição; imutável pelo resto da vida da sessão. |
**status** | [**StudentTodayCardSessionStatus**](StudentTodayCardSessionStatus.md) |  |
**startedAt** | **Date** | Instante do servidor em que o início da sessão foi confirmado. |
**completedSetCount** | **Int** | Séries já registradas como feitas nesta sessão, contadas pelo servidor. |
**totalSetCount** | **Int** | Séries prescritas do treino da sessão, contadas pelo servidor; o cliente não recalcula nenhuma das duas contagens. |
**lastRecordedAt** | **Date** | Maior instante de servidor entre o início da sessão e qualquer fato aceito nela; é dele que se conta o prazo da interrupção. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
