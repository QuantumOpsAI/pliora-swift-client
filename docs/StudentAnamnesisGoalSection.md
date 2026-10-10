# StudentAnamnesisGoalSection

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sectionKey** | **String** |  |
**primaryGoal** | [**StudentTrainingGoal**](StudentTrainingGoal.md) |  |
**otherGoal** | **String** | Texto após trim, sem Markdown ou HTML; exigido com &#x60;primaryGoal: OTHER&#x60; e proibido sem ele — a regra é do schema, não da prosa. | [optional]
**secondaryGoals** | Set<StudentTrainingGoal> | Objetivos secundários, do mesmo catálogo do principal: um ou dois valores distintos e nunca iguais a &#x60;primaryGoal&#x60;. **Campo ausente é a única forma de declarar nenhum secundário** — por isso &#x60;minItems: 1&#x60;: a lista vazia seria a mesma declaração dita duas vezes. | [optional]
**otherSecondaryGoal** | **String** | Texto após trim, sem Markdown ou HTML; exigido quando &#x60;secondaryGoals&#x60; contém &#x60;OTHER&#x60; e proibido sem ele — a regra é do schema, não da prosa. É dado distinto de &#x60;otherGoal&#x60;: a descrição do \&quot;Outro\&quot; principal e a do \&quot;Outro\&quot; secundário nunca se preenchem nem se exibem uma no lugar da outra. | [optional]
**expectedTimeframe** | [**StudentGoalTimeframe**](StudentGoalTimeframe.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
