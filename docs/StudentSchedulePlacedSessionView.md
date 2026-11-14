# StudentSchedulePlacedSessionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutName** | **String** | Nome do treino da sessão, como estava na versão que a originou; conteúdo autorado preservado verbatim. |
**workoutFocus** | **String** | Foco declarado do treino, preservado verbatim; nulo somente para versão publicada antes de o foco autorado existir. |
**placement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação fixada no início: &#x60;ANTICIPATED&#x60;, &#x60;POSTPONED&#x60;, &#x60;REPEAT&#x60;, &#x60;UNSCHEDULED&#x60; ou &#x60;EXTRA&#x60; (&#x60;Mobilidade · FEITO · extra&#x60;). Nunca &#x60;ON_SCHEDULE&#x60;, que é o treino do próprio dia. Em sequência livre, a única sessão colocada é a do extra (&#x60;EXTRA&#x60;). |
**slotDate** | **Date** | Data do slot satisfeito; presente com &#x60;ANTICIPATED&#x60; e &#x60;POSTPONED&#x60;, ausente nas demais. | [optional]
**status** | **String** | Estado da sessão colocada, decidido pelo servidor. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
