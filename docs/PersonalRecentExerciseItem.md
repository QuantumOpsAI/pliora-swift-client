# PersonalRecentExerciseItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**origin** | [**ExerciseOrigin**](ExerciseOrigin.md) |  |
**label** | **String** |  |
**favorite** | **Bool** | Se o exercício é favorito do personal autenticado. |
**lastPrescribedAt** | **Date** | Instante da publicação mais recente do personal que usou este exercício. |
**primaryMuscles** | **[String]** | Lista de textos de atributo. O servidor a entrega **sem repetição e na ordem da origem**, e o app a exibe nessa ordem (por isso o schema não declara &#x60;uniqueItems&#x60;: os clientes gerados a tratariam como conjunto, de ordem instável). Lista ausente significa que a origem não a informa; o contrato não usa lista vazia para isso. | [optional]
**equipment** | **String** | Texto de um atributo do exercício como a origem o entrega, no idioma que ela serve (&#x60;Content-Language&#x60;). Preservado como veio: o app não traduz, não reescreve e não o compara com rótulo de filtro — a relação com o filtro é o &#x60;similarQuery&#x60; do detalhe. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
