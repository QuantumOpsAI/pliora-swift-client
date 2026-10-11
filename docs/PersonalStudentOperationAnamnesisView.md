# PersonalStudentOperationAnamnesisView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accessDeniedCode** | **String** | Variante **acesso negado**, só na linha operacional: o aceite do termo deste vínculo foi revogado e a base de autorização se perdeu. Presente, o bloco não carrega mais nada — nem preenchimento, referência, número, data ou contagem —, o aluno continua na lista e a elegibilidade é &#x60;BLOCKED&#x60; só com &#x60;SHARING_GRANT_REQUIRED&#x60;. Ausente, as duas dimensões são obrigatórias. | [optional]
**currentFormState** | [**StudentAnamnesisState**](StudentAnamnesisState.md) | Preenchimento da ficha **deste vínculo**. Antes da primeira conclusão dela o personal conhece somente este estado; uma ficha de outro vínculo nunca o torna &#x60;COMPLETED&#x60;. | [optional]
**latestCurrentVersion** | [**StudentAnamnesisVersionRef**](StudentAnamnesisVersionRef.md) | Referência à versão concluída mais recente **da ficha deste vínculo** — identidade, número local e data —, sem conteúdo. Presente exatamente quando &#x60;currentFormState&#x60; é &#x60;COMPLETED&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
