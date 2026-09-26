# PrescriptionDraftCreatePayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**draftId** | **String** | Identidade do rascunho, criada no device e igual ao &#x60;aggregateId&#x60; do envelope. |
**studentId** | **String** | Aluno do vínculo ativo. O escopo real é derivado do contexto de segurança; um aluno fora do vínculo ativo resulta em &#x60;FINAL_FAILURE/FORBIDDEN&#x60;, sem revelar existência. |
**name** | **String** | Nome da prescrição, autorado pelo personal e preservado verbatim. |
**sourcePrescriptionVersionId** | **String** | Versão publicada de origem, quando o rascunho é uma revisão. Uma versão fora da relação ou inexistente responde de forma indistinguível com &#x60;FINAL_FAILURE/PRESCRIPTION_VERSION_NOT_FOUND&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
