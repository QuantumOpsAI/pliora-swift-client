# PutStudentReferenceLoadRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**source** | [**ReferenceLoadConfirmationSource**](ReferenceLoadConfirmationSource.md) |  |
**value** | **Double** | Valor da carga de referência, maior que zero; zero não é carga. |
**unit** | [**PrescribedLoadUnit**](PrescribedLoadUnit.md) |  |
**loadBasis** | [**LoadBasis**](LoadBasis.md) | Leitura do peso confirmada junto com o valor. O app a envia sempre, pré-preenchida com a leitura do exercício no plano; com &#x60;ACCEPTED_ESTIMATE&#x60; precisa ser a da estimativa vigente — diferente dela é &#x60;409 REFERENCE_LOAD_ESTIMATE_STALE&#x60;, como valor ou unidade diversos. Ausente, a confirmação grava &#x60;leitura não informada&#x60; (&#x60;null&#x60;), que não serve de base a alvo em percentual. | [optional]
**confirmedOn** | **Date** | Dia civil que o valor informado representa; ausente, é o dia do servidor no fuso do vínculo. Só existe com &#x60;INFORMED&#x60; e não pode ser futuro. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
