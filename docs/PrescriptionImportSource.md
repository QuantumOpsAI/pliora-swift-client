# PrescriptionImportSource

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**templateId** | **String** | Modelo ativo do próprio personal. | [optional]
**prescriptionVersionId** | **String** | Versão publicada de aluno de vínculo ativo do mesmo personal. | [optional]
**workoutIds** | **Set<String>** | Treinos da origem que entram na cópia, identificados pelo &#x60;workoutId&#x60; que a origem tem. A ordem do pedido não importa — é um conjunto, sem repetição, e a cópia segue a ordem de &#x60;position&#x60; da origem. A cópia nasce com identidades novas. Um treino que a origem não tem é &#x60;422 VALIDATION_FAILED&#x60; com &#x60;fieldErrors&#x60; de código &#x60;WORKOUT_NOT_IN_SOURCE&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
