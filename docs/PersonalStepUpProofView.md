# PersonalStepUpProofView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**proof** | **String** | Prova opaca de **uso único** emitida por &#x60;verifyPersonalStepUpChallenge&#x60;, vinculada pelo servidor à intenção inteira — conta + sessão + finalidade + alvo + versão + revisão + fingerprint — e com validade curta do relógio do servidor, nunca indefinida. O cliente a devolve **intacta** no campo &#x60;stepUpProof&#x60; do corpo do comando do ato (o contrato de decisão da análise, pliora-contracts#316, consumirá este schema por referência): não a interpreta, não a registra em log e nunca a transporta para outra finalidade — prova de um ato não serve a outro nem a revisão posterior. Não é JWT, não é token de sessão e não é flag &#x60;verified&#x3D;true&#x60;: não carrega claim, dado de saúde nem autorização presumida. |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
