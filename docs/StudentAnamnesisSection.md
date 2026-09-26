# StudentAnamnesisSection

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sectionKey** | **String** |  |
**primaryGoal** | [**StudentTrainingGoal**](StudentTrainingGoal.md) |  |
**otherGoal** | **String** | Texto após trim, sem Markdown ou HTML; exigido com &#x60;primaryGoal: OTHER&#x60; e proibido sem ele — a regra é do schema, não da prosa. | [optional]
**expectedTimeframe** | [**StudentGoalTimeframe**](StudentGoalTimeframe.md) |  |
**instrumentVersion** | **String** | Versão do instrumento aplicada; o contrato publica chaves, não a redação licenciada. |
**answers** | Set<StudentReadinessScreeningAnswer> |  |
**followUps** | [StudentReadinessFollowUp] |  |
**dateOfBirth** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**injuriesAndSurgeries** | [StudentAnamnesisHistoryEntry] |  |
**currentLimitations** | [StudentAnamnesisBodyRegionLimitation] |  |
**reportedConditions** | [StudentAnamnesisHistoryEntry] |  |
**medicationsInUse** | [StudentAnamnesisMedicationEntry] |  |
**previousExperience** | [**StudentTrainingExperience**](StudentTrainingExperience.md) |  |
**availableDaysPerWeek** | **Int** |  |
**sessionDuration** | [**DurationMinutesRange**](DurationMinutesRange.md) |  |
**trainingLocation** | [**StudentTrainingLocation**](StudentTrainingLocation.md) |  |
**otherTrainingLocation** | **String** | Texto após trim, sem Markdown ou HTML; exigido com &#x60;trainingLocation: OTHER&#x60; e proibido sem ele — a regra é do schema, não da prosa. | [optional]
**availableEquipment** | Set<StudentAvailableEquipment> | Contexto de disponibilidade declarado pelo aluno. **Lista vazia declara ausência de equipamento** — treinar só com o peso do corpo —, pela mesma regra das listas do histórico; por isso o catálogo não tem &#x60;NONE&#x60; nem &#x60;BODYWEIGHT_ONLY&#x60;, que seriam a mesma declaração dita duas vezes e admitiriam a combinação contraditória &#x60;[NONE, DUMBBELLS]&#x60;. A lista não se confunde com o equipamento registrado na execução, não cria catálogo e não cria tenancy de academia. |
**preferredTimeOfDay** | [**StudentPreferredTimeOfDay**](StudentPreferredTimeOfDay.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
