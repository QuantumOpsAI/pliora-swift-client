# StudentRelationshipReplacementInput

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**confirmed** | **Bool** | Somente &#x60;true&#x60; é representável: uma troca recusada não vira &#x60;false&#x60;, vira ausência do aceite. **É só isso que este &#x60;const&#x60; faz** — ele impede que uma recusa vire um &#x60;false&#x60; silencioso, e **não** é o que impede a troca acidental. Quem impede a troca acidental é o par &#x60;403 ACTIVE_RELATIONSHIP_CONFIRMATION_REQUIRED&#x60; e &#x60;409 ACTIVE_RELATIONSHIP_CHANGED&#x60;, com o compare-and-set de &#x60;relationshipId&#x60;. O vínculo anterior só termina dentro do commit do novo. |
**relationshipId** | **String** | O vínculo ativo que o contexto publicou. Se o vínculo ativo deixou de ser este, a resposta é &#x60;409 ACTIVE_RELATIONSHIP_CHANGED&#x60; e nada é alterado. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
