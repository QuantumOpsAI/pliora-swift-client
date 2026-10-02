# InvitationEmailDiscoveryVerificationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**verifiedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**discoveryProofId** | **String** | Prova de endereço: de uso único, presa à conta e válida por 30 minutos. Não autoriza aceite; o cliente a ecoa em &#x60;emailDiscoveryProofId&#x60; ao criar a jornada de um dos &#x60;items&#x60;. |
**discoveryProofExpiresAt** | **Date** | Fim da validade da prova de endereço, servido pelo servidor. |
**items** | [StudentInvitationView] | Convites pendentes do endereço provado, na mesma projeção mínima de &#x60;GET /student-invitations/pending&#x60;. Lista vazia é resposta válida. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
