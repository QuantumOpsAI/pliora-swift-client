# StudentTodayPendingBehindView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | O pendente citado, o mais antigo que cabe hoje. |
**name** | **String** | Nome do treino, conteúdo autorado preservado verbatim e invariante de locale. |
**focus** | **String** | Foco declarado do treino, preservado verbatim; nulo somente para versão publicada antes de o foco autorado existir. |
**slotDate** | **Date** | O dia, anterior a hoje e nesta semana, do pendente citado. |
**othersCount** | **Int** | Quantos outros treinos de dias passados desta semana ficaram pendentes. |
**arrangementRevision** | **String** | A &#x60;revision&#x60; do arranjo lido; é o &#x60;If-Match&#x60; de &#x60;saveStudentWeekArrangement&#x60;. |
**proposal** | [**StudentWeekPushProposalView**](StudentWeekPushProposalView.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
