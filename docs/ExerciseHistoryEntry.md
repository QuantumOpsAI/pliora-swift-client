# ExerciseHistoryEntry

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**performedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**setType** | [**PrescribedSetType**](PrescribedSetType.md) | Tipo da série prescrita que esta execução cumpriu; é o que decide se ela é comparável a outra. |
**loadPercent** | **Double** | Percentual da carga de referência com que a série foi prescrita; ausente quando a carga prescrita não era em percentual. | [optional]
**actual** | [**WorkoutSetValues**](WorkoutSetValues.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
