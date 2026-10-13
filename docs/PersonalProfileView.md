# PersonalProfileView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**revision** | **String** | Validador opaco da revisão do Perfil, idêntico ao &#x60;ETag&#x60; desta leitura e ao valor exigido em &#x60;If-Match&#x60; pelos quatro commands de edição. |
**displayName** | **String** | Nome autorado pela própria pessoa, preservado verbatim UTF-8. **Ausente enquanto o passo &#x60;PROFILE&#x60; não foi respondido** — e só nesse caso. Nunca vem vazio e nunca vem &#x60;null&#x60;: ausência é ausência, e o servidor não substitui o nome por e-mail, por identificador nem por rótulo derivado. Presente, é sempre de 1 a 120 caracteres. | [optional]
**avatar** | [**AvatarView**](AvatarView.md) |  |
**email** | **String** | Endereço verificado exibível da própria conta, **somente leitura**. Presente exatamente com &#x60;emailKind &#x3D; EMAIL&#x60;; com &#x60;HIDDEN_EMAIL&#x60; a chave é omitida estruturalmente, nunca &#x60;null&#x60;, endereço mascarado, nome ou placeholder. O tipo pertence à conta, não ao provider da sessão. Nenhum request de edição de Perfil publicado neste contrato transporta e-mail. | [optional]
**emailKind** | [**IdentityEmailKind**](IdentityEmailKind.md) | Classificação canônica da conta usada também por &#x60;GET /identity/me&#x60;. Sessão GOOGLE ou EMAIL não torna exibível o endereço de uma conta HIDDEN_EMAIL. |
**sessionProvider** | [**SessionIdentityProvider**](SessionIdentityProvider.md) |  |
**professionalRegistration** | [**ProfessionalRegistrationView**](ProfessionalRegistrationView.md) |  | [optional]
**professionalRegistrationStatus** | [**ProfessionalRegistrationStatus**](ProfessionalRegistrationStatus.md) |  |
**city** | **String** | Cidade autorada pela própria pessoa; ausente quando não informada. | [optional]
**canInvite** | **Bool** | Elegibilidade para convidar alunos, calculada exclusivamente pelo servidor. Falsa sempre que o registro profissional está ausente. |
**canImportGooglePhoto** | **Bool** | Capacidade de **oferta** da fonte Google na edição da foto de perfil, calculada exclusivamente pelo servidor para a própria conta — publicada aqui e só aqui, porque a decisão de oferecer a fonte é owner-only e nunca alcança o &#x60;AvatarView&#x60; compartilhado com alunos. Verdadeiro exige, ao mesmo tempo: &#x60;sessionProvider&#x60; corrente &#x60;GOOGLE&#x60;, referência de foto Google verificada resolvida do lado do servidor para a identidade desta conta, nenhum avatar &#x60;USER_UPLOAD&#x60; prevalente — prevalente é &#x60;USER_UPLOAD&#x60; em &#x60;READY&#x60; ou &#x60;PROCESSING&#x60;; um &#x60;REJECTED&#x60; nunca prevalece — e nenhuma operação de avatar em conflito, isto é, avatar em &#x60;PROCESSING&#x60; ou intenção de envio aceita e ainda não expirada. &#x60;APPLE&#x60; e &#x60;EMAIL&#x60; respondem &#x60;false&#x60; por política de UX — mesmo com identidade Google vinculada, a disponibilidade é do método da sessão, não do conjunto de provedores da conta. É elegibilidade de tentativa, **não** promessa de sucesso remoto: &#x60;POST /personal/profile/avatar/import-google&#x60; revalida autorização, referência e precedência no comando, e race e precedência continuam erros tipados de lá; a indisponibilidade do provedor permanece local ao comando. Nenhuma busca a provedor acontece nesta leitura. O campo nunca expõe URL de provedor, identidade externa, bucket, credencial ou dado de vinculação; campo ausente ou falha de decodificação da resposta valem oferta indisponível no cliente, nunca autorização. |
**specialties** | Set<PersonalSpecialty> | Declarações de atuação; lista vazia quando o passo foi pulado. Nunca é capability. |
**otherSpecialty** | **String** | Texto autorado que acompanha &#x60;OTHER&#x60;; ausente quando &#x60;OTHER&#x60; não foi declarado. | [optional]
**workStyle** | [**PersonalWorkStyleView**](PersonalWorkStyleView.md) |  |
**preferences** | [**PersonalPreferencesView**](PersonalPreferencesView.md) |  |
**relationshipSummary** | [**PersonalRelationshipSummary**](PersonalRelationshipSummary.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
