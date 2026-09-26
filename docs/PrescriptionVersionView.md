# PrescriptionVersionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescriptionVersionId** | **String** | Identidade da versão, igual à do rascunho que a originou. |
**prescriptionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**versionNumber** | **Int** | Número da versão, único por prescrição e atribuído pelo servidor na publicação. |
**state** | [**PrescriptionVersionState**](PrescriptionVersionState.md) |  |
**publishedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**supersededAt** | **Date** | Instante em que outra versão a sucedeu; nulo enquanto é a vigente. A versão permanece legível e auditável. |
**content** | [**PrescriptionDraftContent**](PrescriptionDraftContent.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
