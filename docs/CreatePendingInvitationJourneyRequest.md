# CreatePendingInvitationJourneyRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**platform** | [**InvitationJourneyPlatform**](InvitationJourneyPlatform.md) |  |
**emailDiscoveryProofId** | **String** | Prova de endereço devolvida por &#x60;verifyInvitationEmailDiscoveryChallenge&#x60; em &#x60;discoveryProofId&#x60;. Opcional. De uso único, presa à conta e válida por 30 minutos; esta operação a consome e grava a prova de posse somente do convite do path. Exige &#x60;Idempotency-Key&#x60;. | [optional]
**appInstallationId** | **String** | Identificador opaco opcional; nunca IDFA, AAID, e-mail ou fingerprint. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
