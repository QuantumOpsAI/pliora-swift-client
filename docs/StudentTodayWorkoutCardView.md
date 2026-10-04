# StudentTodayWorkoutCardView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | [**StudentTodayWorkoutCardStatus**](StudentTodayWorkoutCardStatus.md) |  |
**firstWorkout** | **Bool** | Decidido pelo servidor: &#x60;true&#x60; se e somente se a conta nunca concluiu sessão alguma, em nenhuma relação, e só com &#x60;status&#x60; &#x60;WORKOUT_AVAILABLE&#x60;; &#x60;false&#x60; em qualquer outro estado. O cliente não o deriva de outra leitura, como a do último treino. |
**prescribedWorkout** | [**StudentTodayCardPrescribedWorkoutView**](StudentTodayCardPrescribedWorkoutView.md) |  |
**openSession** | [**StudentTodayCardOpenSessionView**](StudentTodayCardOpenSessionView.md) |  |
**completedSession** | [**StudentTodayCardCompletedSessionView**](StudentTodayCardCompletedSessionView.md) |  |
**nextScheduledWorkout** | [**StudentTodayCardNextScheduledWorkoutView**](StudentTodayCardNextScheduledWorkoutView.md) |  | [optional]
**planStartsOn** | **Date** | Dia civil, no fuso do vínculo, em que começa a ativação que ainda não começou; presente se e somente se &#x60;status&#x60; é &#x60;PLAN_NOT_STARTED&#x60;. Não é validade nem contagem de dias. | [optional]
**sequencePlan** | [**StudentTodaySequencePlanView**](StudentTodaySequencePlanView.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
