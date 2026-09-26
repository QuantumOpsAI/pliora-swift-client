# ExecutionSubstitutionRegisterPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**substitutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**executedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**executedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**equipmentInstanceId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**deferralId** | **String** | Adiamento que esta substituição resolve, quando o exercício vinha adiado. | [optional]
**type** | [**SubstitutionType**](SubstitutionType.md) |  |
**reason** | [**SubstitutionReason**](SubstitutionReason.md) |  |
**authorizationSource** | [**SubstitutionAuthorizationSource**](SubstitutionAuthorizationSource.md) |  |
**scope** | [**SubstitutionScope**](SubstitutionScope.md) |  |
**registeredAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
