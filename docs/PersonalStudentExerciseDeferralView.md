# PersonalStudentExerciseDeferralView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | [**DeferralStatus**](DeferralStatus.md) |  |
**reason** | [**DeferralReason**](DeferralReason.md) |  | [optional]
**deferredAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**prescribedPosition** | **Int** | Posição do exercício na ordem prescrita, contada de 1, no instante do adiamento — a mesma posição que &#x60;prescribedPosition&#x60; da entrada publica. |
**executedPosition** | **Int** | Posição para onde o exercício foi na organização executada quando adiado, contada de 1 — o &#x60;executedPosition&#x60; gravado pelo fato de adiamento, não a posição em que ele eventualmente executou. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
