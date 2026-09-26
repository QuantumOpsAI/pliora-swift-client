# RelationshipSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**counterpartAccountId** | **String** | Identificador público opaco da outra parte do vínculo, do ponto de vista do escopo que recebe a entrada: o aluno para o escopo do personal e o personal para o escopo do aluno. Nunca é nome, e-mail ou contato. |
**status** | [**RelationshipStatus**](RelationshipStatus.md) |  |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAt** | **Date** | Instante server-owned do encerramento; nulo enquanto o vínculo não terminou. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
