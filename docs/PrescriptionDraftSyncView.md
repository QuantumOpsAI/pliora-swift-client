# PrescriptionDraftSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**draftId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Aluno do vínculo ativo a que o rascunho pertence; identificador opaco, nunca nome ou contato. |
**sourcePrescriptionVersionId** | **String** | Versão publicada de origem, quando o rascunho foi derivado dela; a origem permanece imutável. | [optional]
**content** | [**PrescriptionDraftContent**](PrescriptionDraftContent.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
