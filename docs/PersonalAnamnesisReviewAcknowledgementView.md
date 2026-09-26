# PersonalAnamnesisReviewAcknowledgementView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**anamnesisVersionId** | **String** | Versão concluída individual cuja revisão foi reconhecida. O ato é por versão e nunca por aluno: uma conclusão posterior cria outra versão e volta a produzir item, mesmo que a anterior já tenha sido reconhecida. |
**acknowledgedAt** | **Date** | Data do reconhecimento original, do servidor. Repetir o ato não a move. |
**acknowledgedByPersonalId** | **String** | Autoria do reconhecimento. A unicidade é o par versão + personal, e é o que torna a operação idempotente. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
