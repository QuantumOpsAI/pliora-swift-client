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
**stackedSlots** | [StudentScheduleStackedSlotView] | Os outros treinos do mesmo dia quando há empilhamento (&#x60;Fazer os dois nesse dia&#x60;), em ordem do plano; o primeiro fica nos campos do dia. **Vazia quando não há empilhamento; nunca ausente.** Só existe num dia com treino — nunca em &#x60;REST_DAY&#x60; nem em &#x60;REST_REQUIRED&#x60; — e é sempre vazia em sequência livre (&#x60;planMode: SEQUENCE&#x60;). |
**suggestedWeekdays** | Set<PlanWeekday> | Os dias sugeridos pelo personal para o treino deste dia, **só quando** o dia arranjado pelo aluno difere da sugestão (&#x60;sugerido: terça&#x60;); ausente quando o dia segue a sugestão, sem treino e em sequência livre. | [optional]
**lastCompletedOn** | **Date** | Dia civil em que o aluno concluiu o treino deste dia pela última vez (&#x60;Última vez: …&#x60;); ausente sem treino e quando nunca o concluiu. | [optional]
**timesThisWeek** | **Int** | Quantas sessões concluídas do treino deste dia o aluno tem nesta semana (&#x60;N vez(es) nesta semana&#x60;); presente quando o dia tem treino. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
