# AccountUnifiedView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**outcome** | **String** | &#x60;PROVIDER_LINKED&#x60;: o provedor passou a valer para esta conta e **nenhuma outra foi tocada**. &#x60;ACCOUNTS_UNIFIED&#x60;: a identidade externa migrou de uma segunda conta, cujas sessões foram revogadas e cujo registro foi arquivado na mesma transação. |
**linkedProviders** | **[String]** | Provedores que a conta passa a aceitar, no mesmo vocabulário de &#x60;AuthenticatedIdentityProfile.provider&#x60;, onde &#x60;EMAIL&#x60; representa o OTP via Cognito. |
**unifiedAt** | **Date** | Instante em que a unificação foi concluída, presente **somente** em &#x60;ACCOUNTS_UNIFIED&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
