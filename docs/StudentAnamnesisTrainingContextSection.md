# StudentAnamnesisTrainingContextSection

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sectionKey** | **String** |  |
**previousExperience** | [**StudentTrainingExperience**](StudentTrainingExperience.md) |  |
**availableDaysPerWeek** | **Int** |  |
**sessionDuration** | [**DurationMinutesRange**](DurationMinutesRange.md) |  |
**trainingLocation** | [**StudentTrainingLocation**](StudentTrainingLocation.md) |  |
**otherTrainingLocation** | **String** | Texto após trim, sem Markdown ou HTML; exigido com &#x60;trainingLocation: OTHER&#x60; e proibido sem ele — a regra é do schema, não da prosa. | [optional]
**availableEquipment** | Set<StudentAvailableEquipment> | Contexto de disponibilidade declarado pelo aluno, relativo ao &#x60;trainingLocation&#x60; — em academia, acesso ou restrição conhecida, nunca posse, e nenhum local presume disponibilidade não declarada. **Campo ausente é \&quot;não informado\&quot;** — a pergunta ficou sem resposta — e é distinto da **lista vazia presente**, que declara nenhum equipamento disponível — treinar só com o peso do corpo. A presença do campo é o que separa os dois fatos; por isso o catálogo não tem &#x60;NONE&#x60; nem &#x60;BODYWEIGHT_ONLY&#x60;, que confundiriam \&quot;não informou\&quot; com \&quot;não tem\&quot; e admitiriam a combinação contraditória &#x60;[NONE, DUMBBELLS]&#x60;. A lista não se confunde com o equipamento registrado na execução, não cria catálogo e não cria tenancy de academia. | [optional]
**preferredTimeOfDay** | [**StudentPreferredTimeOfDay**](StudentPreferredTimeOfDay.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
