# PutStudentReferenceLoadRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**source** | [**ReferenceLoadConfirmationSource**](ReferenceLoadConfirmationSource.md) |  |
**value** | **Double** | Valor da carga de referência, maior que zero; zero não é carga. |
**unit** | [**PrescribedLoadUnit**](PrescribedLoadUnit.md) |  |
**confirmedOn** | **Date** | Dia civil que o valor informado representa; ausente, é o dia do servidor no fuso do vínculo. Só existe com &#x60;INFORMED&#x60; e não pode ser futuro. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
