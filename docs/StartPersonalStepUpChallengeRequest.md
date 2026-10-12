# StartPersonalStepUpChallengeRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**purpose** | [**StepUpPurpose**](StepUpPurpose.md) |  |
**targetRef** | **String** | Referência **opaca** do alvo/caso que o ato protege — o caso de análise que o comando final endereça. Opaco de propósito: nem pergunta, nem condição, nem resposta nem justificativa viajam neste campo nem neste corpo. |
**targetVersion** | **Int** | Versão esperada do alvo — a versão concluída que a decisão endereça. Divergência no commit do ato é conflito recuperável, nunca last-write-wins. |
**targetRevision** | **String** | Revisão esperada do alvo — o compare-and-set que a prova carrega: prova emitida sobre uma revisão não serve a outra. |
**mutationIntentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**device** | [**DeviceContext**](DeviceContext.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
