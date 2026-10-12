# PersonalAttentionEligibilityParameters

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonCode** | **String** |  |
**blockingReasons** | Set<StudentPrescriptionEligibilityBlockingReason> | Razões de bloqueio vigentes no instante &#x60;asOf&#x60;, acumuláveis e nomeadas. |
**blockedSince** | **Date** | Instante em que o bloqueio passou a vigorar — a mais antiga das razões vigentes, porque o item é único e persiste enquanto qualquer uma delas vigorar. Com &#x60;SHARING_GRANT_REQUIRED&#x60; é o instante da revogação do aceite. |
**analysisCase** | [**PersonalAttentionAnalysisCaseProjection**](PersonalAttentionAnalysisCaseProjection.md) | O caso de análise deste vínculo, presente se e somente se &#x60;ANAMNESIS_ANALYSIS_PENDING&#x60; vigora em &#x60;blockingReasons&#x60; — a razão existe **porque** o caso existe. Nenhum sinal do caso viaja sob &#x60;SHARING_GRANT_REQUIRED&#x60;, que segue razão única quando presente. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
