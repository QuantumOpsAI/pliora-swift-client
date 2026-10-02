# PersonalPrescriptionListItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentLabel** | **String** | Rótulo autorado no convite, preservado verbatim; ausente quando o convite não trouxe nome. | [optional]
**states** | Set<PrescriptionListState> | Estados de plano em que o item casa; a página filtrada por &#x60;state&#x60; só devolve itens que o contêm. |
**validity** | [**PrescriptionValidity**](PrescriptionValidity.md) |  | [optional]
**currentVersion** | [**PrescriptionVersionSummary**](PrescriptionVersionSummary.md) |  | [optional]
**activation** | [**PrescriptionActivationSummary**](PrescriptionActivationSummary.md) |  | [optional]
**openDraft** | [**PrescriptionDraftSummary**](PrescriptionDraftSummary.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
