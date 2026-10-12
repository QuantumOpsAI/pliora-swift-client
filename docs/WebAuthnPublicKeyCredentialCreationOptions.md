# WebAuthnPublicKeyCredentialCreationOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**rp** | [**WebAuthnCredentialRp**](WebAuthnCredentialRp.md) |  |
**user** | [**WebAuthnCredentialUser**](WebAuthnCredentialUser.md) |  |
**challenge** | **String** | String base64url opaca do envelope WebAuthn — &#x60;challenge&#x60;, identificadores de credencial, &#x60;clientDataJSON&#x60;, &#x60;authenticatorData&#x60;, &#x60;attestationObject&#x60;, &#x60;signature&#x60; e &#x60;userHandle&#x60;. O cliente transporta sem interpretar e nunca a registra em log. |
**pubKeyCredParams** | [WebAuthnPublicKeyCredentialCreationOptionsPubKeyCredParamsInner] |  |
**timeout** | **Int** | Prazo da cerimônia em milissegundos, sugestão ao cliente; a validade real é o &#x60;expiresAt&#x60; do desafio, do relógio do servidor. |
**attestation** | **String** | Atestação de autenticador não é pedida nem aceita como fator: posse, presença e &#x60;userVerification&#x60; bastam, e nenhum certificado de fabricante circula nesta superfície. |
**authenticatorSelection** | [**WebAuthnPublicKeyCredentialCreationOptionsAuthenticatorSelection**](WebAuthnPublicKeyCredentialCreationOptionsAuthenticatorSelection.md) |  |
**excludeCredentials** | [WebAuthnCredentialDescriptor] | Handles opacos das credenciais já registradas nesta conta — evita segundo cadastro do mesmo autenticador, sem expor dado de pessoa. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
