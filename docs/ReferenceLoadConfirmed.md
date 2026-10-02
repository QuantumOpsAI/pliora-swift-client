# ReferenceLoadConfirmed

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | **Double** | Valor da carga, maior que zero; zero não é carga. |
**unit** | [**PrescribedLoadUnit**](PrescribedLoadUnit.md) |  |
**confirmedOn** | **Date** | Dia civil que a confirmação representa, no fuso do vínculo. |
**revision** | **String** | Revisão opaca da confirmação, definida pelo servidor: o valor a ecoar em &#x60;If-Match&#x60; ao confirmar de novo ou remover, e o mesmo do &#x60;ETag&#x60; da resposta do &#x60;PUT&#x60;. Muda a cada confirmação; o cliente só a compara por igualdade. |
**basis** | [**ReferenceLoadBasis**](ReferenceLoadBasis.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
