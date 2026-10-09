# StudentAnamnesisStateView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Vínculo dono desta ficha: o vínculo atual do aluno, o mesmo identificador antes e depois de uma pausa. As duas escritas da ficha o repetem no corpo, e uma ficha de outro vínculo nunca é escrita por engano. |
**state** | [**StudentAnamnesisState**](StudentAnamnesisState.md) |  |
**completed** | **Bool** | Verdadeiro somente quando **esta ficha** tem ao menos uma versão concluída; rascunho não conta, e versão de outro vínculo também não. |
**completedVersions** | [StudentAnamnesisVersionRef] | Versões concluídas desta ficha, da mais recente para a mais antiga; nenhuma é reescrita, e nenhuma versão de outra ficha aparece aqui. |
**latestCompletedVersion** | [**StudentAnamnesisVersionView**](StudentAnamnesisVersionView.md) |  | [optional]
**draft** | [**StudentAnamnesisDraftView**](StudentAnamnesisDraftView.md) |  |
**completionRequestedAt** | **Date** | Instante do servidor em que o personal do vínculo **solicitou dentro do app** o preenchimento desta ficha, presente somente enquanto a solicitação está pendente. A conclusão da ficha a satisfaz, e o campo some. É o único lugar em que o aluno a encontra: não há push, badge, mensagem, prazo nem texto do personal. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
