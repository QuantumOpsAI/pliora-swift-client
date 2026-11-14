# StudentTodayWorkoutCardView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | [**StudentTodayWorkoutCardStatus**](StudentTodayWorkoutCardStatus.md) |  |
**pausedBy** | [**RelationshipPausedBy**](RelationshipPausedBy.md) | Presente **exatamente** em &#x60;TRAINING_PAUSED&#x60; (desde 0.93.0, &#x60;P4&#x60; de &#x60;DOC-RELATIONSHIP-LIFECYCLE&#x60; §7.4 e §11.1): o lado que pausou o vínculo, por papel — nunca nome, e-mail, data nem motivo. &#x60;STUDENT&#x60; liga a variante &#x60;C10b&#x60; do cartão (&#x60;Você pausou o vínculo com seu personal.&#x60;, com a ação &#x60;Retomar vínculo&#x60;); &#x60;PERSONAL&#x60;, a ausência do campo ou um valor que o cliente não conhece mantêm a variante neutra &#x60;C10&#x60; da &#x60;Q-18&#x60;. O cartão não decide a retomada: a ação depende do estado relido em &#x60;getStudentRelationship&#x60;. | [optional]
**firstWorkout** | **Bool** | Decidido pelo servidor: &#x60;true&#x60; se e somente se a conta nunca concluiu sessão alguma, em nenhuma relação, e só com &#x60;status&#x60; &#x60;WORKOUT_AVAILABLE&#x60;; &#x60;false&#x60; em qualquer outro estado. O cliente não o deriva de outra leitura, como a do último treino. |
**prescribedWorkout** | [**StudentTodayCardPrescribedWorkoutView**](StudentTodayCardPrescribedWorkoutView.md) |  |
**openSession** | [**StudentTodayCardOpenSessionView**](StudentTodayCardOpenSessionView.md) |  |
**completedSession** | [**StudentTodayCardCompletedSessionView**](StudentTodayCardCompletedSessionView.md) |  |
**nextScheduledWorkout** | [**StudentTodayCardNextScheduledWorkoutView**](StudentTodayCardNextScheduledWorkoutView.md) |  | [optional]
**planStartsOn** | **Date** | Dia civil, no fuso do vínculo, em que começa a ativação que ainda não começou; presente se e somente se &#x60;status&#x60; é &#x60;PLAN_NOT_STARTED&#x60;. Não é validade nem contagem de dias. | [optional]
**sequencePlan** | [**StudentTodayCardSequencePlanView**](StudentTodayCardSequencePlanView.md) |  | [optional]
**satisfiedOn** | **Date** | Dia civil, nesta semana, da sessão que satisfez o treino de hoje; presente se e somente se &#x60;status&#x60; é &#x60;WEEK_SLOT_SATISFIED&#x60;. | [optional]
**satisfiedWorkout** | [**StudentTodayCardNextScheduledWorkoutView**](StudentTodayCardNextScheduledWorkoutView.md) | O treino do slot de hoje — a data de hoje, o treino, o nome e o foco —, que já foi feito em &#x60;satisfiedOn&#x60;; presente se e somente se &#x60;status&#x60; é &#x60;WEEK_SLOT_SATISFIED&#x60;. | [optional]
**offers** | [StudentTodayOfferView] | O que o aluno pode iniciar hoje, na ordem do servidor: presente **sempre** em &#x60;REST_DAY&#x60;, &#x60;WEEK_SLOT_SATISFIED&#x60; e &#x60;WORKOUT_COMPLETED&#x60;, ausente nos demais estados. Vazia quando não há nada a oferecer; nunca ausente nesses três estados. | [optional]
**pendingBehind** | [**StudentTodayPendingBehindView**](StudentTodayPendingBehindView.md) | O pendente de dia passado e a proposta de **Empurrar a semana**; presente **só** em &#x60;WORKOUT_AVAILABLE&#x60;, com ativação por dias da semana em vigor e gatilho; ausente nos demais estados, na sequência livre e sem gatilho. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
