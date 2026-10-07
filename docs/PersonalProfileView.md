# PersonalProfileView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**revision** | **String** | Validador opaco da revisão do Perfil, idêntico ao &#x60;ETag&#x60; desta leitura e ao valor exigido em &#x60;If-Match&#x60; pelos quatro commands de edição. |
**displayName** | **String** | Nome autorado pela própria pessoa, preservado verbatim UTF-8. **Ausente enquanto o passo &#x60;PROFILE&#x60; não foi respondido** — e só nesse caso. Nunca vem vazio e nunca vem &#x60;null&#x60;: ausência é ausência, e o servidor não substitui o nome por e-mail, por identificador nem por rótulo derivado. Presente, é sempre de 1 a 120 caracteres. | [optional]
**avatar** | [**AvatarView**](AvatarView.md) |  |
**email** | **String** | E-mail de acesso verificado da conta, **somente leitura**: nenhum request de edição publicado neste contrato transporta e-mail, e este campo nunca sai do escopo da própria pessoa. |
**sessionProvider** | [**SessionIdentityProvider**](SessionIdentityProvider.md) |  |
**professionalRegistration** | [**ProfessionalRegistrationView**](ProfessionalRegistrationView.md) |  | [optional]
**professionalRegistrationStatus** | [**ProfessionalRegistrationStatus**](ProfessionalRegistrationStatus.md) |  |
**city** | **String** | Cidade autorada pela própria pessoa; ausente quando não informada. | [optional]
**canInvite** | **Bool** | Elegibilidade para convidar alunos, calculada exclusivamente pelo servidor. Falsa sempre que o registro profissional está ausente. |
**specialties** | Set<PersonalSpecialty> | Declarações de atuação; lista vazia quando o passo foi pulado. Nunca é capability. |
**otherSpecialty** | **String** | Texto autorado que acompanha &#x60;OTHER&#x60;; ausente quando &#x60;OTHER&#x60; não foi declarado. | [optional]
**workStyle** | [**PersonalWorkStyleView**](PersonalWorkStyleView.md) |  |
**preferences** | [**PersonalPreferencesView**](PersonalPreferencesView.md) |  |
**relationshipSummary** | [**PersonalRelationshipSummary**](PersonalRelationshipSummary.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
