# PrescriptionDraftSet

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedSetId** | **String** | Identidade da série, criada pelo personal no device para que a edição offline seja idempotente. |
**setIndex** | **Int** |  |
**setType** | [**PrescribedSetType**](PrescribedSetType.md) | Tipo da série, **obrigatório**: a série comum é &#x60;WORKING&#x60;, nunca a ausência do campo. &#x60;DROP_SET&#x60; nunca é a primeira série do exercício, e em bloco combinado o tipo é por série, não por rodada. |
**derivedFromPrescribedSetId** | **String** | Série da versão de origem da qual esta foi copiada, **gravada pelo servidor** quando o rascunho é &#x60;REVISION&#x60;. É o vínculo que deixa a revisão dizer o que mudou. Ausente em série que o personal criou neste rascunho e em rascunho que não é revisão. O cliente nunca a declara: reenviá-la na edição é inócuo e um valor diferente do gravado nunca o substitui. | [optional]
**target** | [**PrescribedTarget**](PrescribedTarget.md) |  | [optional]
**repsPerSide** | **Bool** | Indica contagem de repetições por lado em exercício unilateral (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §6.5). Obrigatório não vir com série por tempo (&#x60;durationSeconds&#x60;) nem com &#x60;TO_FAILURE&#x60; sem repetições mínimas. Ausente equivale a false. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
