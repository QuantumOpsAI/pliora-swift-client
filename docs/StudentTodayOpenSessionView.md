# StudentTodayOpenSessionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | A identidade criada no device e adotada pelo servidor no início da sessão; a mesma usada pelo transporte de sync. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão fixada da prescrição; imutável pelo resto da vida da sessão. |
**status** | [**WorkoutSessionStatus**](WorkoutSessionStatus.md) | Reutiliza o estado publicado pelo início de sessão. Uma sessão encerrada não aparece aqui: ela é &#x60;lastSession&#x60; ou nada. |
**startedAt** | **Date** | O instante declarado pelo cliente no início, preservado como recebido. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
