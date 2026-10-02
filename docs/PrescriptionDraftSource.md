# PrescriptionDraftSource

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | [**PrescriptionDraftSourceKind**](PrescriptionDraftSourceKind.md) |  |
**prescriptionVersionId** | **String** | Versão publicada de origem: a do mesmo aluno em &#x60;REVISION&#x60;, ou a de outro aluno do mesmo personal em &#x60;CLONE&#x60;. Versão que designa um rascunho aberto é &#x60;409 PRESCRIPTION_VERSION_NOT_PUBLISHED&#x60;. | [optional]
**draftId** | **String** | Rascunho aberto de **outro** aluno do mesmo personal, só em &#x60;CLONE&#x60;. Rascunho já publicado é &#x60;409 DRAFT_ALREADY_PUBLISHED&#x60;; descartado, &#x60;404&#x60;. | [optional]
**templateId** | **String** | Modelo ativo do próprio personal, só em &#x60;TEMPLATE&#x60;. | [optional]
**workoutIds** | **Set<String>** | Treinos da origem que entram na cópia, identificados pelo &#x60;workoutId&#x60; que a origem tem. A ordem do pedido não importa — é um conjunto, sem repetição, e a cópia segue a ordem de &#x60;position&#x60; da origem. A cópia nasce com identidades novas. Um treino que a origem não tem é &#x60;422 VALIDATION_FAILED&#x60; com &#x60;fieldErrors&#x60; de código &#x60;WORKOUT_NOT_IN_SOURCE&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
