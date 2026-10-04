# SaveStudentProfileRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**revision** | **String** | Revisão lida pelo cliente; se diverge da corrente, a escrita é recusada com &#x60;409 REVISION_CONFLICT&#x60;. |
**displayName** | **String** | De 1 a 60 caracteres (code points Unicode), gravado byte a byte, sem apará-lo nem normalizá-lo e sem validar se é um \&quot;nome real\&quot;; &#x60;null&#x60; apaga o nome. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
