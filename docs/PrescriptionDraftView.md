# PrescriptionDraftView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**draftId** | **String** | Identidade do rascunho, criada pelo personal no device. É também a identidade da versão publicada depois (&#x60;prescriptionVersionId&#x60;). |
**prescriptionId** | **String** | Container lógico estável da prescrição dentro do vínculo; um vínculo tem uma só. |
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**originKind** | [**PrescriptionOriginKind**](PrescriptionOriginKind.md) |  |
**sourcePrescriptionVersionId** | **String** | Versão publicada de origem, só quando &#x60;originKind&#x60; é &#x60;REVISION&#x60;; a origem permanece imutável. Ausente em &#x60;BLANK&#x60;, &#x60;CLONE&#x60; e &#x60;TEMPLATE&#x60;. | [optional]
**state** | **String** |  |
**revision** | **String** | Revisão opaca do servidor; comparada somente por igualdade e nunca inferida pelo cliente. |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**content** | [**PrescriptionDraftContent**](PrescriptionDraftContent.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
