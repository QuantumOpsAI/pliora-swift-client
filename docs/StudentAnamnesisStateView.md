# StudentAnamnesisStateView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**state** | [**StudentAnamnesisState**](StudentAnamnesisState.md) |  |
**completed** | **Bool** | Verdadeiro somente quando existe ao menos uma versão concluída; rascunho não conta. |
**completedVersions** | [StudentAnamnesisVersionRef] | Versões concluídas, da mais recente para a mais antiga; nenhuma é reescrita. |
**latestCompletedVersion** | [**StudentAnamnesisVersionView**](StudentAnamnesisVersionView.md) |  | [optional]
**draft** | [**StudentAnamnesisDraftView**](StudentAnamnesisDraftView.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
