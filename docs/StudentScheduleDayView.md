# StudentScheduleDayView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**date** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**status** | [**StudentScheduleDayStatus**](StudentScheduleDayStatus.md) |  |
**workoutId** | **String** | Identificador público opaco do treino prescrito para esta data; nulo quando não há treino prescrito (&#x60;REST_DAY&#x60; e &#x60;REST_REQUIRED&#x60;). |
**workoutName** | **String** | Nome do treino prescrito {ex. \&quot;Treino A\&quot;}; nulo quando não há treino. Conteúdo do domínio preservado verbatim UTF-8 e invariante de locale. |
**workoutFocus** | **String** | Foco declarado do treino {ex. \&quot;Costas e Bíceps\&quot;}; nulo quando não há treino ou quando a versão foi publicada antes de o foco autorado existir. Conteúdo autorado, preservado verbatim e invariante de locale. O cliente compõe a linha exibida; o separador visual é copy do cliente. |
**doneOn** | **Date** | A data, nesta semana, da sessão que satisfez o treino deste dia; presente **sempre e somente** com &#x60;status&#x60; &#x60;DONE_ELSEWHERE&#x60;. | [optional]
**placedSessions** | [StudentSchedulePlacedSessionView] | As sessões colocadas nesta data que não são o treino do dia — antecipada, adiada ou repetição —, em ordem de início. Vazia quando não há nenhuma; nunca ausente. Em sequência livre (&#x60;planMode: SEQUENCE&#x60;) é sempre vazia: a sessão da sequência é o treino do dia. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
