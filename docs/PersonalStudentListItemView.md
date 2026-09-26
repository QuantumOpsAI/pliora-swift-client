# PersonalStudentListItemView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identidade pública opaca do aluno do vínculo; nunca nome, e-mail ou contato. |
**studentLabel** | **String** | Rótulo autorado no convite, preservado verbatim UTF-8; ausente quando o convite não trouxe nome. Nunca traduzido e nunca derivado do perfil atual do aluno. | [optional]
**status** | [**RelationshipStatus**](RelationshipStatus.md) |  |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAt** | **Date** | Instante server-owned do encerramento. Presente exatamente em &#x60;ENDED&#x60; e ausente nos demais estados; a ausência é ausência, nunca data zero. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
