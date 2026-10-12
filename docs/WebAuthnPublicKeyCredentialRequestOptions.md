# WebAuthnPublicKeyCredentialRequestOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**challenge** | **String** | String base64url opaca do envelope WebAuthn — &#x60;challenge&#x60;, identificadores de credencial, &#x60;clientDataJSON&#x60;, &#x60;authenticatorData&#x60;, &#x60;attestationObject&#x60;, &#x60;signature&#x60; e &#x60;userHandle&#x60;. O cliente transporta sem interpretar e nunca a registra em log. |
**rpId** | **String** | Relying Party ID efetivo — configuração de runtime do servidor; o cliente nunca o envia nem presume. |
**timeout** | **Int** | Prazo da cerimônia em milissegundos, sugestão ao cliente; a validade real é o &#x60;expiresAt&#x60; do desafio, do relógio do servidor. |
**userVerification** | **String** | Verificação do usuário é política fechada desta superfície: presença sem verificação não satisfaz o step-up. |
**allowCredentials** | [WebAuthnCredentialDescriptor] | Handles opacos das credenciais desta conta aptas ao desafio; nunca vazio — a conta sem passkey nem chega a emitir desafio. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
