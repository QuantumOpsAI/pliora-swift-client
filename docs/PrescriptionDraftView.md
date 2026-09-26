# PrescriptionDraftView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**draftId** | **String** | Identidade do rascunho, criada pelo personal no device. É também a identidade da versão publicada depois (&#x60;prescriptionVersionId&#x60;). |
**prescriptionId** | **String** | Container lógico estável da prescrição dentro do vínculo. |
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**sourcePrescriptionVersionId** | **String** | Versão publicada de origem, quando o rascunho é uma revisão; a origem permanece imutável. | [optional]
**state** | **String** |  |
**revision** | **String** | Revisão opaca do servidor; comparada somente por igualdade e nunca inferida pelo cliente. |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**content** | [**PrescriptionDraftContent**](PrescriptionDraftContent.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
