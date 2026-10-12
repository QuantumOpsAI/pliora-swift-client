# WebAuthnCredentialUser

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | String base64url opaca do envelope WebAuthn — &#x60;challenge&#x60;, identificadores de credencial, &#x60;clientDataJSON&#x60;, &#x60;authenticatorData&#x60;, &#x60;attestationObject&#x60;, &#x60;signature&#x60; e &#x60;userHandle&#x60;. O cliente transporta sem interpretar e nunca a registra em log. |
**name** | **String** | Handle opaco da conta para a cerimônia — o servidor emite um identificador não correlacionável a e-mail, nome ou dado pessoal. |
**displayName** | **String** | Rótulo não identificante exibido pelo autenticador; o servidor nunca publica nome civil, e-mail ou dado do caso neste campo. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
