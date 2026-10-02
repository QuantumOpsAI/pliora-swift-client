# PrescriptionDraftAlternative

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**alternativeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**alternativeType** | [**PrescribedAlternativeType**](PrescribedAlternativeType.md) |  |
**displayName** | **String** | Rótulo da alternativa na prescrição, autorado pelo personal e preservado verbatim UTF-8, **obrigatório**. Nasce preenchido pelo app com o nome exibido na busca no momento em que o personal autoriza a alternativa, e é o nome que a tela de troca do aluno mostra e que o histórico guarda. O catálogo não é guardado: para uma alternativa que vem dele, este é o **único nome que o servidor tem**, e nada do texto da origem do catálogo trafega aqui. É obrigatório em toda alternativa, qualquer que seja a origem do exercício, porque o conteúdo da alternativa não carrega essa origem; de um exercício próprio o app o preenche com o nome autorado do exercício, e o servidor nunca o completa nem o reescreve. |
**variantId** | **String** | Variante autorizada; em &#x60;ALTERNATIVE_EXERCISE&#x60; é a variante do exercício alternativo. |
**exerciseId** | **String** | Exercício alternativo; presente somente quando &#x60;alternativeType&#x60; é &#x60;ALTERNATIVE_EXERCISE&#x60;. | [optional]
**priority** | **Int** |  | [optional]
**authorizationScope** | [**PrescribedAuthorizationScope**](PrescribedAuthorizationScope.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
