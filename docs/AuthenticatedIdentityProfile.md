# AuthenticatedIdentityProfile

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**displayName** | **String** | Nome autorado pelo próprio profissional; ausente quando ainda não informado. | [optional]
**email** | **String** | E-mail verificado da conta autenticada. Presente **somente** quando &#x60;emailKind &#x3D; EMAIL&#x60;, e então sempre presente. Com &#x60;HIDDEN_EMAIL&#x60; a chave é omitida — ausência estrutural, nunca &#x60;null&#x60; —, porque o e-mail verificado é o relay da Apple e não pode ser exibido como e-mail pessoal. | [optional]
**emailKind** | [**IdentityEmailKind**](IdentityEmailKind.md) | &#x60;EMAIL&#x60; quando o e-mail verificado da conta é exibível e vem em &#x60;email&#x60;; &#x60;HIDDEN_EMAIL&#x60; quando é o relay da Apple, e então &#x60;email&#x60; não vem. |
**provider** | **String** | Origem da identidade usada pela sessão atual; EMAIL representa Cognito OTP. |
**linkedProviders** | **Set<String>** | Todas as formas de entrar que a conta já aceita, sem repetição e nunca vazia. O servidor sempre inclui a forma da sessão atual (&#x60;provider&#x60;); isso é obrigação do servidor, que o schema não expressa. Mesmo vocabulário de &#x60;provider&#x60; e de &#x60;AccountUnifiedView.linkedProviders&#x60;, onde &#x60;EMAIL&#x60; representa o OTP via Cognito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
