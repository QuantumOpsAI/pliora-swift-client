# SessionResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accessToken** | **String** |  |
**refreshToken** | **String** |  |
**tokenType** | **String** |  |
**issuedAt** | **Date** | Instante em que o servidor emitiu este envelope, sempre em UTC. É a âncora única dos prazos: &#x60;expiresIn&#x60; e &#x60;refreshExpiresIn&#x60; são durações contadas **a partir de &#x60;issuedAt&#x60;**, nunca da recepção — o vencimento de cada credencial é &#x60;issuedAt&#x60; + a duração correspondente. Não existe par redundante de &#x60;expiresAt&#x60;: as três datas não são prazos independentes. Uma resposta recuperada por replay idempotente traz o &#x60;issuedAt&#x60; ORIGINAL da execução, e por isso não prolonga access, refresh, inatividade nem o máximo absoluto da família. |
**expiresIn** | **Int** | Duração do access token em segundos, contada de &#x60;issuedAt&#x60;: o vencimento é &#x60;issuedAt + expiresIn&#x60;, nunca a recepção mais esta duração. |
**refreshExpiresIn** | **Int** | Duração do refresh token em segundos, contada de &#x60;issuedAt&#x60;: o vencimento por inatividade é &#x60;issuedAt + refreshExpiresIn&#x60;, nunca a recepção mais esta duração. |
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**identityId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**onboardingRequired** | **Bool** | Estado durável da jornada da conta. Não é derivado de a identidade ter sido criada ou reencontrada nesta autenticação; só muda após uma transição de onboarding real. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
