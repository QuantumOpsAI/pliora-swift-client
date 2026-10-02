# PrescriptionVersionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescriptionVersionId** | **String** | Identidade da versão, igual à do rascunho que a originou. |
**prescriptionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**originKind** | [**PrescriptionOriginKind**](PrescriptionOriginKind.md) |  |
**sourcePrescriptionVersionId** | **String** | Versão publicada de origem, só quando &#x60;originKind&#x60; é &#x60;REVISION&#x60;; a origem permanece imutável e nunca é alterada pela publicação. Ausente em &#x60;BLANK&#x60;, &#x60;CLONE&#x60; e &#x60;TEMPLATE&#x60;. | [optional]
**versionNumber** | **Int** | Número da versão, único por prescrição e atribuído pelo servidor na publicação. |
**state** | [**PrescriptionVersionState**](PrescriptionVersionState.md) |  |
**publishedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**supersededAt** | **Date** | Instante em que outra versão a sucedeu; nulo enquanto é a vigente. A versão permanece legível e auditável. |
**content** | [**PrescriptionDraftContent**](PrescriptionDraftContent.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
