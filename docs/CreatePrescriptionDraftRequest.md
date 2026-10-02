# CreatePrescriptionDraftRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**draftId** | **String** | Identidade do rascunho, gerada pelo cliente; o servidor adota em vez de emitir outra. |
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome da prescrição, autorado pelo personal e preservado verbatim. |
**source** | [**PrescriptionDraftSource**](PrescriptionDraftSource.md) |  | [optional]
**loadPolicy** | [**PrescriptionLoadPolicy**](PrescriptionLoadPolicy.md) |  | [optional]
**notesPolicy** | [**PrescriptionNotesPolicy**](PrescriptionNotesPolicy.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
