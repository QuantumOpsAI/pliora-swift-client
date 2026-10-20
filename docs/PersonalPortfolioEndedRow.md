# PersonalPortfolioEndedRow

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identificador opaco do aluno; nunca nome, e-mail, telefone ou contato. |
**relationshipStatus** | **String** |  |
**studentName** | [**Null**](Null.md) | Sempre ausente ou nulo: o nome é do aluno e não acompanha o vínculo encerrado. | [optional]
**studentLabel** | **String** | Rótulo autorado no convite, preservado como estava quando a relação existia. | [optional]
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAt** | **Date** | Instante server-owned do encerramento — a referência de encerramento já autorizada. |
**operationalPriority** | **String** |  |
**indicators** | [PersonalPortfolioIndicator] | Sempre contém &#x60;ENDED&#x60; e nunca indicador de atividade operacional. |
**destination** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
