# WorkoutControlActionRequestOneOf7

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**operationId** | **UUID** | Identidade gerada no cliente como UUIDv7 RFC9562, adotada sem reemissão; permanece opaca ao cliente. Wire canônico lowercase; não aceitar grafia alternativa para a mesma chave. |
**action** | **String** |  |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**phaseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**occurrence** | [**WorkoutControlOccurrenceRef**](WorkoutControlOccurrenceRef.md) |  |
**payload** | **AnyCodable** | Objeto vazio. RESUME exige READY/ACTIVE_SET/RESTING pausado; continua o mesmo intervalo do checkpoint e conta como atividade após commit. Não confundir com retomada de sessão INTERRUPTED no telefone. Tick/ACK/limite de exclusão não são atividade ou retomada. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
