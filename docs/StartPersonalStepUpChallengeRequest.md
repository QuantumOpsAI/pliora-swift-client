# StartPersonalStepUpChallengeRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**purpose** | [**StepUpPurpose**](StepUpPurpose.md) |  |
**targetRef** | **String** | Referência **opaca** do alvo/caso que o ato protege — o caso de análise que o comando final endereça. Montagem fixa, pela convenção de vínculo do step-up: &#x60;\&quot;opq_case_\&quot; + analysis.caseId&#x60;, com &#x60;analysis.caseId&#x60; lido de &#x60;GET /personal/students/{studentId}/anamnesis/analysis&#x60; — o &#x60;caseId&#x60; cru, sem o prefixo, ainda emite desafio e prova e só é recusado no commit do ato com &#x60;STEP_UP_PROOF_MISMATCH&#x60;. Ex.: &#x60;caseId&#x60; &#x60;01K00000000000000000CA01&#x60; vira &#x60;opq_case_01K00000000000000000CA01&#x60;. Opaco de propósito: nem pergunta, nem condição, nem resposta nem justificativa viajam neste campo nem neste corpo. |
**targetVersion** | **Int** | Versão esperada do alvo — a versão concluída que a decisão endereça: &#x60;analysis.targetAnamnesisVersion.versionNumber&#x60; da mesma leitura de &#x60;GET /personal/students/{studentId}/anamnesis/analysis&#x60;. Divergência no commit do ato é conflito recuperável, nunca last-write-wins. |
**targetRevision** | **String** | Revisão esperada do alvo — &#x60;analysis.revision&#x60; da mesma leitura, a revisão publicada do caso que o &#x60;If-Match&#x60; do commit ecoa: o compare-and-set que a prova carrega. Prova emitida sobre uma revisão não serve a outra. |
**mutationIntentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**device** | [**DeviceContext**](DeviceContext.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
