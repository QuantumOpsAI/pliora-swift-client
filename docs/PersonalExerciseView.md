# PersonalExerciseView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | [**PersonalExerciseStatus**](PersonalExerciseStatus.md) |  |
**name** | **String** | Nome do exercício, como o personal o escreveu: texto autoral preservado, sem tradução nem reescrita, e que não segue &#x60;Accept-Language&#x60;. |
**primaryMuscle** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. |
**secondaryMuscles** | **[String]** | Lista de textos de atributo. O servidor a entrega **sem repetição e na ordem da origem**, e o app a exibe nessa ordem (por isso o schema não declara &#x60;uniqueItems&#x60;: os clientes gerados a tratariam como conjunto, de ordem instável). Lista ausente significa que a origem não a informa; o contrato não usa lista vazia para isso. | [optional]
**equipment** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]
**difficulty** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]
**mechanic** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]
**force** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]
**steps** | **[String]** | Passos de execução, em ordem, até 12 de 500 caracteres. O app os numera; o texto não traz numeração. Lista vazia é \&quot;sem instruções escritas\&quot;. O schema não declara &#x60;uniqueItems&#x60;: a lista é ordenada e os clientes gerados a tratariam como conjunto, de ordem instável. |
**revision** | **String** | Revisão do exercício, opaca; o mesmo valor do &#x60;ETag&#x60; e o que &#x60;If-Match&#x60; ecoa. |
**video** | [**PersonalExerciseVideoView**](PersonalExerciseVideoView.md) |  |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
