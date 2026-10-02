# ExerciseCatalogDetail

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**catalogRef** | **String** | Referência opaca de um exercício do catálogo que ainda pode não ter identidade no Pliora, emitida pelo servidor. **Não é o identificador da origem e não é derivável dele pelo cliente**: não tem formato, ordem nem significado, e só se compara por igualdade. Não é identidade durável — o servidor pode deixar de reconhecê-la —, e por isso o app a troca por &#x60;exerciseId&#x60; em &#x60;resolveExerciseReferences&#x60; ao confirmar a seleção e nunca a guarda nem a grava na prescrição. | [optional]
**name** | **String** |  |
**origin** | [**ExerciseOrigin**](ExerciseOrigin.md) |  |
**favorite** | **Bool** | Se o exercício é favorito do personal autenticado. |
**primaryMuscles** | **[String]** | Lista de textos de atributo. O servidor a entrega **sem repetição e na ordem da origem**, e o app a exibe nessa ordem (por isso o schema não declara &#x60;uniqueItems&#x60;: os clientes gerados a tratariam como conjunto, de ordem instável). Lista ausente significa que a origem não a informa; o contrato não usa lista vazia para isso. | [optional]
**secondaryMuscles** | **[String]** | Lista de textos de atributo. O servidor a entrega **sem repetição e na ordem da origem**, e o app a exibe nessa ordem (por isso o schema não declara &#x60;uniqueItems&#x60;: os clientes gerados a tratariam como conjunto, de ordem instável). Lista ausente significa que a origem não a informa; o contrato não usa lista vazia para isso. | [optional]
**equipment** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]
**difficulty** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]
**mechanic** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]
**force** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]
**grips** | **[String]** | Lista de textos de atributo. O servidor a entrega **sem repetição e na ordem da origem**, e o app a exibe nessa ordem (por isso o schema não declara &#x60;uniqueItems&#x60;: os clientes gerados a tratariam como conjunto, de ordem instável). Lista ausente significa que a origem não a informa; o contrato não usa lista vazia para isso. | [optional]
**steps** | **[String]** | Passos de execução, em ordem. O app os numera; o texto não traz numeração. |
**media** | [ExerciseMediaAsset] | Assets de mídia disponíveis, com a mesma forma que o aluno recebe. &#x60;angle&#x60; e &#x60;demonstrator&#x60; distinguem os assets de um mesmo exercício quando houver mais de um. |
**similarQuery** | [**ExerciseSimilarQuery**](ExerciseSimilarQuery.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
