# WorkoutControlAmendLastSetPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amendmentId** | **UUID** | Identidade gerada no cliente como UUIDv7 RFC9562, adotada sem reemissão; permanece opaca ao cliente. Wire canônico lowercase; não aceitar grafia alternativa para a mesma chave. |
**setExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**expectedSetRevision** | **String** | Revisão opaca definida pelo servidor. O cliente compara somente por igualdade, nunca infere ordem e nunca a cria; &#x60;expectedRevision&#x60; e &#x60;canonicalRevision&#x60; apenas ecoam um valor lido do servidor. |
**replacement** | [**WorkoutControlValues**](WorkoutControlValues.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
