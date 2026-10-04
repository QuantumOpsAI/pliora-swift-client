# StudentTodayCardRelationshipView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | **String** | &#x60;ACTIVE&#x60; ou &#x60;PAUSED&#x60;. O vínculo pausado é exibido com o mesmo personal, e a resposta não traz motivo, autoria nem data da pausa. Encerramento é &#x60;403&#x60;, não um estado exibível aqui. |
**personal** | [**StudentActivePersonalView**](StudentActivePersonalView.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
