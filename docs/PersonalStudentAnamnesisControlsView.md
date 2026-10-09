# PersonalStudentAnamnesisControlsView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**revision** | **String** | Revisão opaca da escolha da exigência; &#x60;If-Match&#x60; a ecoa ao mudá-la. A solicitação de preenchimento não a altera. |
**requireCurrentCompletion** | **Bool** | &#x60;true&#x60; somente depois de o personal escolher, explicitamente, exigir a conclusão da ficha deste vínculo para novas liberações; sem escolha é &#x60;false&#x60;, e o sistema nunca a liga sozinho. Ligada com a ficha incompleta, publicar, atribuir, ativar e trocar a programação são recusados com &#x60;ANAMNESIS_NOT_COMPLETED&#x60;; nada já liberado é retirado, suspenso ou bloqueado, e iniciar ou retomar treino nunca é recusado por ela. |
**requirementChangedAt** | **Date** | Instante do servidor da última escolha explícita do personal sobre a exigência, ausente enquanto ele nunca escolheu. | [optional]
**completionRequest** | [**PersonalAnamnesisCompletionRequestView**](PersonalAnamnesisCompletionRequestView.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
