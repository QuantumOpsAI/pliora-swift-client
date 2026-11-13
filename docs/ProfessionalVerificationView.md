# ProfessionalVerificationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**state** | [**ProfessionalVerificationStatus**](ProfessionalVerificationStatus.md) |  |
**evidenceRevision** | **Int** | Revisão da evidência enviada, monotônica por conta: zero enquanto nenhuma cópia foi recebida. A equipe decide sempre sobre a revisão mais recente. |
**lastEvidenceSubmittedAt** | **Date** | Instante do servidor do último envio aceito; ausente com &#x60;evidenceRevision&#x60; zero. | [optional]
**decisionReason** | **String** | Motivo da decisão da equipe, presente **somente** em &#x60;PENDENTE_CORRECAO&#x60; e &#x60;SUSPENSO&#x60;, já redigido para exibição ao personal — nunca código interno, parecer jurídico nem identidade do operador. | [optional]
**verifiedAt** | **Date** | Instante em que o estado &#x60;VERIFICADO&#x60; vigente foi decidido; ausente nos demais estados. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
