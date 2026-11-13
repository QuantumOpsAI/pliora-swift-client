# PersonalStudentScheduleDayExecuted

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão que a sessão fixou ao iniciar; pode diferir da atribuída hoje e nunca é reescrita. |
**completedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**placement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação da sessão na semana, fixada no início dela e nunca reescrita. |
**slotDate** | **Date** | Data do slot que a sessão satisfez; presente com &#x60;ANTICIPATED&#x60; e &#x60;POSTPONED&#x60;, ausente nas demais. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
