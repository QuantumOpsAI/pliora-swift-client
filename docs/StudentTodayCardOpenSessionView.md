# StudentTodayCardOpenSessionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | A identidade da sessão, a mesma que o início adotou. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão fixada da prescrição; imutável pelo resto da vida da sessão. |
**status** | [**StudentTodayCardSessionStatus**](StudentTodayCardSessionStatus.md) |  |
**startedAt** | **Date** | Instante do servidor em que o início da sessão foi confirmado. |
**completedSetCount** | **Int** | Séries COMPLETED/PARTIAL contadas pelo servidor; nunca OPEN/SKIPPED ou emendas. |
**totalSetCount** | **Int** | Séries prescritas fixadas na sessão, contadas pelo servidor. |
**lastRecordedAt** | **Date** | Última atividade confirmada do servidor, inclusive PAUSE/RESUME/APPLY_VALUES e transições aceitas. Leituras, ticks, alertas, ACK, replay e cap não são atividade. Inatividade de 2 h/12 h exclui a interseção desde essa atividade com os primeiros 3600 s de cada pausa confirmada, sem contar pausas antigas novamente; não é lastRecordedAt cru mais 12 h. Após o cap continua pausado, sem aviso de fase, revisão ou atividade automáticos; o contador volta a correr. |
**serverNow** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**controlRevision** | **Int64** |  |
**paused** | **Bool** |  |
**restStartedAt** | **Date** | Início real original do descanso no servidor após COMPLETED/PARTIAL, respeitando a posição no bloco. Pausa, emenda e ajuste não o deslocam. Ausente sem descanso corrente, após SKIPPED, sem intervalo de descanso nessa posição, com descanso já consolidado ou com sessão INTERRUPTED. | [optional]
**restTimer** | [**WorkoutControlTimer**](WorkoutControlTimer.md) |  | [optional]
**restPrescribedTargetSeconds** | **Int** | Alvo prescrito original do descanso corrente. Ausente quando não existe prescrição, inclusive no checkpoint; zero é alvo real, nunca ausência. | [optional]
**restDurationSeconds** | **Int** | Alvo efetivo do descanso corrente: adjustedTargetSeconds quando presente, senão targetSeconds, inclusive 0. Só aparece com descanso real e alvo prescrito existente; ausência não é 0. Ajuste exige alvo e preserva o prescrito, nunca afeta próximo descanso. Mesma origem de restTimer. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
