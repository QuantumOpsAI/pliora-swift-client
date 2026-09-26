# SessionResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accessToken** | **String** |  |
**refreshToken** | **String** |  |
**tokenType** | **String** |  |
**expiresIn** | **Int** |  |
**refreshExpiresIn** | **Int** |  |
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**identityId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**onboardingRequired** | **Bool** | Estado durável da jornada da conta. Não é derivado de a identidade ter sido criada ou reencontrada nesta autenticação; só muda após uma transição de onboarding real. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
