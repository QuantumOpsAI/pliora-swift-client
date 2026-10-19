# PersonalStudentComparableExerciseKey

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseLabel** | **String** | Rótulo do exercício na prescrição — o &#x60;displayName&#x60; que o personal deu —, preservado verbatim. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. |
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantLabel** | **String** | Rótulo da variante, preservado verbatim; para exercício do catálogo, que tem uma variante só, é o &#x60;displayName&#x60; da prescrição. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. |
**equipmentContextKey** | **String** | Terceiro membro da chave. Numa referência é o contexto que o vínculo registra para aquela chave — publicado como gravado, inclusive um valor-padrão interno como &#x60;CATALOG_DEFAULT&#x60; ou &#x60;PERSONAL_DEFAULT&#x60;, que no fio é código de máquina comum; ausente quando a chave não registra contexto. No &#x60;comparableKey&#x60; do relatório é o **eco da chave consultada**: presente exatamente quando o cliente o enviou, ausente quando a consulta veio sem contexto — mesmo quando o servidor resolveu o único contexto do par, a resolução não vaza para o eco. Código de máquina estável, **nunca nome de aparelho exibível**, que o cliente devolve verbatim e nunca interpreta. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
