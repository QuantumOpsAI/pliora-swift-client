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

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
