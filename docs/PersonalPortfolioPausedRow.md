# PersonalPortfolioPausedRow

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identificador opaco do aluno; nunca nome, e-mail, telefone ou contato. |
**relationshipStatus** | **String** |  |
**studentName** | **String** | O nome que o aluno informou no próprio Perfil, **como ele escreveu** — permitido pela leitura relacional em &#x60;PAUSED&#x60; e nunca nulo. |
**studentLabel** | **String** | Rótulo autorado no convite, nunca lido do perfil atual do aluno. | [optional]
**pausedBy** | [**RelationshipPausedBy**](RelationshipPausedBy.md) | Autoria da pausa por papel, como a carteira relacional publica — nunca nome, e-mail, data ou motivo. |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**operationalPriority** | **String** |  |
**indicators** | [PersonalPortfolioIndicator] | Sempre contém &#x60;PAUSED&#x60; e nunca indicador de atividade operacional. |
**destination** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
