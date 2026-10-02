# PrescriptionVersionSummary

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescriptionVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**versionNumber** | **Int** | Número da versão, único por prescrição e atribuído pelo servidor na publicação. |
**name** | **String** | Nome da prescrição nesta versão, autorado pelo personal e preservado verbatim. |
**state** | **String** | Uma versão publicada é vigente (&#x60;PUBLISHED&#x60;) ou foi substituída (&#x60;SUPERSEDED&#x60;); rascunho nunca aparece num resumo de versão. |
**originKind** | [**PrescriptionOriginKind**](PrescriptionOriginKind.md) |  |
**publishedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**supersededAt** | **Date** | Instante em que outra versão a sucedeu; nulo enquanto é a vigente. |
**workoutCount** | **Int** |  |
**exerciseCount** | **Int** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
