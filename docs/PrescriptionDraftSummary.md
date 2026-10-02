# PrescriptionDraftSummary

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**draftId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome da prescrição no rascunho, autorado pelo personal e preservado verbatim. |
**nextVersionNumber** | **Int** | Número previsto da versão; &#x60;1&#x60; quando o aluno ainda não tem plano publicado, senão o número da vigente mais um. |
**originKind** | [**PrescriptionOriginKind**](PrescriptionOriginKind.md) |  |
**sourcePrescriptionVersionId** | **String** | Versão publicada de origem, só em &#x60;REVISION&#x60;; a origem permanece imutável. Ausente em &#x60;BLANK&#x60;, &#x60;CLONE&#x60; e &#x60;TEMPLATE&#x60;. | [optional]
**sourceVersionNumber** | **Int** | Número da versão de origem, em &#x60;REVISION&#x60;. | [optional]
**revision** | **String** | Revisão opaca do rascunho, a mesma que &#x60;getPersonalPrescriptionDraft&#x60; devolve em &#x60;ETag&#x60;; ecoada em &#x60;If-Match&#x60; ao descartar ou editar. |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**workoutCount** | **Int** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
