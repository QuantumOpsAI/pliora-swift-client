# StudentPersonalContactsView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipStatus** | **String** | Relação atual derivada no servidor, não parâmetro do cliente; ENDED nunca autoriza. |
**displayName** | **String** | Nome profissional autorado vigente quando presente no perfil; ausência é omissão, nunca null ou nome importado. | [optional]
**contacts** | Set<StudentProfessionalContactView> |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
