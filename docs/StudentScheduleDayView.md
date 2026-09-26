# StudentScheduleDayView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**date** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**status** | [**StudentScheduleDayStatus**](StudentScheduleDayStatus.md) |  |
**workoutId** | **String** | Identificador público opaco do treino prescrito para esta data; nulo quando não há treino prescrito (&#x60;REST_DAY&#x60;). |
**workoutName** | **String** | Nome do treino prescrito {ex. \&quot;Treino A\&quot;}; nulo quando não há treino. Conteúdo do domínio preservado verbatim UTF-8 e invariante de locale. |
**workoutFocus** | **String** | Foco declarado do treino {ex. \&quot;Costas e Bíceps\&quot;}; nulo quando não há treino ou quando a versão foi publicada antes de o foco autorado existir. Conteúdo autorado, preservado verbatim e invariante de locale. O cliente compõe a linha exibida; o separador visual é copy do cliente. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
