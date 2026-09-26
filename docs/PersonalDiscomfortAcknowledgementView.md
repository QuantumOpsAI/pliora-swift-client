# PersonalDiscomfortAcknowledgementView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**discomfortReportId** | **String** | Relato individual reconhecido. O reconhecimento é por relato e nunca por aluno: um relato novo volta a aparecer mesmo que o anterior já tenha sido reconhecido. |
**acknowledgedAt** | **Date** | Data do reconhecimento original, do servidor. Repetir o ato não a move. |
**acknowledgedByPersonalId** | **String** | Autoria do reconhecimento. A unicidade é o par relato + personal, e é o que torna a operação idempotente. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
