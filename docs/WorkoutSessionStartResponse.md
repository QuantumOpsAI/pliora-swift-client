# WorkoutSessionStartResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | A mesma identidade enviada no corpo; o servidor adota, não reemite. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão fixada da prescrição; imutável pelo resto da vida da sessão. |
**status** | [**WorkoutSessionStatus**](WorkoutSessionStatus.md) |  |
**startedAt** | **Date** | Instante do servidor em que o início foi confirmado; o dia civil da sessão sai dele, no fuso do vínculo. |
**nextAction** | [**WorkoutSessionNextAction**](WorkoutSessionNextAction.md) |  |
**placement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação da sessão na semana, decidida pelo casamento deste início e fixada na sessão: é a que o histórico, o resultado e a semana do personal mostram depois. |
**slotDate** | **Date** | Data do slot que a sessão satisfaz; presente com &#x60;ANTICIPATED&#x60; e &#x60;POSTPONED&#x60;, ausente nas demais colocações. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
