# StudentAnamnesisSection

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sectionKey** | **String** |  |
**primaryGoal** | [**StudentTrainingGoal**](StudentTrainingGoal.md) |  |
**otherGoal** | **String** | Texto após trim, sem Markdown ou HTML; exigido com &#x60;primaryGoal: OTHER&#x60; e proibido sem ele — a regra é do schema, não da prosa. | [optional]
**secondaryGoals** | Set<StudentTrainingGoal> | Objetivos secundários, do mesmo catálogo do principal: um ou dois valores distintos e nunca iguais a &#x60;primaryGoal&#x60;. **Campo ausente é a única forma de declarar nenhum secundário** — por isso &#x60;minItems: 1&#x60;: a lista vazia seria a mesma declaração dita duas vezes. | [optional]
**otherSecondaryGoal** | **String** | Texto após trim, sem Markdown ou HTML; exigido quando &#x60;secondaryGoals&#x60; contém &#x60;OTHER&#x60; e proibido sem ele — a regra é do schema, não da prosa. É dado distinto de &#x60;otherGoal&#x60;: a descrição do \&quot;Outro\&quot; principal e a do \&quot;Outro\&quot; secundário nunca se preenchem nem se exibem uma no lugar da outra. | [optional]
**expectedTimeframe** | [**StudentGoalTimeframe**](StudentGoalTimeframe.md) |  |
**instrumentVersion** | **String** | Versão do instrumento aplicada; o contrato publica chaves, não a redação licenciada. |
**answers** | Set<StudentReadinessScreeningAnswer> |  |
**followUps** | [StudentReadinessFollowUp] |  |
**injuriesAndSurgeries** | [StudentAnamnesisHistoryEntry] |  |
**currentLimitations** | [StudentAnamnesisBodyRegionLimitation] |  |
**reportedConditions** | [StudentAnamnesisHistoryEntry] |  |
**medicationsInUse** | [StudentAnamnesisMedicationEntry] |  |
**previousExperience** | [**StudentTrainingExperience**](StudentTrainingExperience.md) |  |
**availableDaysPerWeek** | **Int** |  |
**sessionDuration** | [**DurationMinutesRange**](DurationMinutesRange.md) |  |
**trainingLocation** | [**StudentTrainingLocation**](StudentTrainingLocation.md) |  |
**otherTrainingLocation** | **String** | Texto após trim, sem Markdown ou HTML; exigido com &#x60;trainingLocation: OTHER&#x60; e proibido sem ele — a regra é do schema, não da prosa. | [optional]
**availableEquipment** | Set<StudentAvailableEquipment> | Contexto de disponibilidade declarado pelo aluno, relativo ao &#x60;trainingLocation&#x60; — em academia, acesso ou restrição conhecida, nunca posse, e nenhum local presume disponibilidade não declarada. **Campo ausente é \&quot;não informado\&quot;** — a pergunta ficou sem resposta — e é distinto da **lista vazia presente**, que declara nenhum equipamento disponível — treinar só com o peso do corpo. A presença do campo é o que separa os dois fatos; por isso o catálogo não tem &#x60;NONE&#x60; nem &#x60;BODYWEIGHT_ONLY&#x60;, que confundiriam \&quot;não informou\&quot; com \&quot;não tem\&quot; e admitiriam a combinação contraditória &#x60;[NONE, DUMBBELLS]&#x60;. A lista não se confunde com o equipamento registrado na execução, não cria catálogo e não cria tenancy de academia. | [optional]
**preferredTimeOfDay** | [**StudentPreferredTimeOfDay**](StudentPreferredTimeOfDay.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
