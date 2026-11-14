# StudentScheduleView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**planState** | [**StudentTrainingPlanState**](StudentTrainingPlanState.md) | Presente **só** com o vínculo pausado (&#x60;TRAINING_PAUSED&#x60;): então &#x60;days&#x60; vem vazio e &#x60;planMode&#x60; é ausente. Ausente em toda programação com dias. | [optional]
**planMode** | [**PlanActivationMode**](PlanActivationMode.md) | Como o plano chega ao aluno, quando há ativação vigente; ausente quando não há. Em &#x60;SEQUENCE&#x60; os dias não carregam programação por data e o app leva ao plano em sequência (&#x60;getStudentTodayWorkout&#x60;, &#x60;sequencePlan&#x60;). Nunca revela a validade. | [optional]
**from** | **Date** | Primeira data civil devolvida, ecoando o intervalo efetivamente aplicado. |
**to** | **Date** | Última data civil devolvida, ecoando o intervalo efetivamente aplicado. |
**weekStart** | **Date** | A segunda-feira da semana de &#x60;from&#x60;, no fuso do vínculo: a semana do aluno vai de segunda a domingo. Informativo; o cliente não recalcula a semana. |
**timeZone** | **String** | Timezone IANA em que o servidor resolveu as datas civis e a noção de \&quot;hoje\&quot;. O cliente não reinterpreta as datas noutro timezone. |
**days** | [StudentScheduleDayView] | Uma entrada por data civil entre &#x60;from&#x60; e &#x60;to&#x60;, inclusive, em ordem crescente e sem lacuna. Um dia sem treino prescrito é &#x60;REST_DAY&#x60;, ou &#x60;REST_REQUIRED&#x60; no descanso obrigatório em vigor sem sessão na data. Vazio somente com &#x60;planState: TRAINING_PAUSED&#x60;. |
**unscheduled** | [StudentScheduleUnscheduledWorkoutView] | Os treinos do conjunto semanal **Sem dia** na semana de &#x60;weekStart&#x60; (o grupo &#x60;Sem dia&#x60;, abaixo do domingo). Vazia quando não há nenhum, e sempre vazia em sequência livre (a Minha semana não se aplica a ela) e com o vínculo pausado; nunca ausente. |
**extras** | [StudentScheduleExtraWorkoutView] | Os **treinos extras** da versão em vigor (a lista &#x60;Extras&#x60; da aba Treinos, &#x60;week.schedule.extras&#x60;), na ordem do plano. Valem **nos dois modos** — é a única parte da Minha semana que entra na sequência livre (&#x60;DEC-SEMANA-20&#x60;) —, e a lista é vazia quando o plano não tem extra e com o vínculo pausado; nunca ausente. |
**arrangementRevision** | **String** | A &#x60;revision&#x60; do arranjo da semana (&#x60;getStudentWeekArrangement&#x60;), para o arrastar da AL1 gravar com &#x60;If-Match&#x60; sem outra leitura; presente só com &#x60;planMode: WEEKDAYS&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
