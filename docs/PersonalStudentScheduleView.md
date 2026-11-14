# PersonalStudentScheduleView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**from** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**to** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**timeZone** | **String** | Timezone IANA de registro do vínculo, em que o servidor resolveu as datas civis. |
**firstDayOfWeek** | **String** | Primeiro dia da semana canônica, definido pelo servidor. |
**today** | **Date** | Data de hoje derivada do relógio do servidor no timezone do vínculo. |
**days** | [PersonalStudentScheduleDayView] | Os sete dias do intervalo, em ordem crescente e sem lacuna. |
**unscheduled** | [StudentScheduleUnscheduledWorkoutView] | Os treinos do conjunto semanal **Sem dia** nesta semana, na forma da agenda do aluno; vazia com &#x60;view&#x3D;SUGGESTED&#x60;, em sequência livre e quando não há nenhum. |
**extras** | [StudentScheduleExtraWorkoutView] | Os **treinos extras** da versão em vigor, na forma da agenda do aluno, nas duas visões (&#x60;view&#x60;) e **nos dois modos** (&#x60;DEC-SEMANA-20&#x60;); vazia quando o plano não tem extra; nunca ausente. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
