# InvitationJourneyView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**journeyId** | **String** | Identidade pública opaca da jornada; não autoriza operação isoladamente. |
**journeyToken** | **String** | Segredo curto, retornado uma vez, protegido em storage seguro e nunca colocado em URL. |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**invitation** | [**StudentInvitationView**](StudentInvitationView.md) |  |
**nextAction** | [**InvitationJourneyNextAction**](InvitationJourneyNextAction.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
