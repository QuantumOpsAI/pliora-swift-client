# WebAuthnCredentialDescriptor

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | Único tipo de credencial desta superfície. |
**id** | **String** | String base64url opaca do envelope WebAuthn — &#x60;challenge&#x60;, identificadores de credencial, &#x60;clientDataJSON&#x60;, &#x60;authenticatorData&#x60;, &#x60;attestationObject&#x60;, &#x60;signature&#x60; e &#x60;userHandle&#x60;. O cliente transporta sem interpretar e nunca a registra em log. |
**transports** | **[String]** | Dica de transporte declarada no cadastro; dado do autenticador, nunca da pessoa. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
