# PrescriptionDraftExercise

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedVariantId** | **String** | Variante prescrita pelo personal, recuperável de forma inequívoca. A variante executada pelo aluno é outro fato e nunca sobrescreve esta. |
**displayName** | **String** | Rótulo do exercício **na prescrição**, autorado pelo personal e preservado verbatim UTF-8, obrigatório. Nasce preenchido pelo app com o nome exibido na busca no momento da inclusão e o personal pode ajustá-lo. É **o nome que a versão publicada, o bundle do aluno e o histórico exibem**: nenhuma prescrição depende de o exercício continuar no catálogo, nem de o texto da origem do catálogo continuar disponível. **Obrigatório em todo exercício prescrito, qualquer que seja a origem dele**, porque o conteúdo do rascunho não carrega essa origem: de um exercício do catálogo é o **único nome que o servidor guarda** — o catálogo não é guardado —, e nada do texto da origem trafega aqui; de um exercício próprio o app o preenche com o nome autorado do exercício, e o servidor nunca o completa nem o reescreve. |
**derivedFromPrescribedExerciseId** | **String** | Exercício prescrito da versão de origem do qual este foi copiado, **gravado pelo servidor** quando o rascunho é &#x60;REVISION&#x60;, para que a revisão diga o que foi alterado, o que entrou e o que saiu. Ausente em exercício que o personal criou neste rascunho e em rascunho que não é revisão. O cliente nunca o declara: reenviá-lo na edição é inócuo. | [optional]
**position** | **Int** |  |
**orderPolicy** | [**PrescribedOrderPolicy**](PrescribedOrderPolicy.md) |  |
**blockKey** | **String** | Quando consta em &#x60;blocks[]&#x60; do treino, é o **bloco combinado** do exercício, que então é &#x60;LOCKED&#x60;, não declara &#x60;restRange&#x60; e é contíguo aos demais do bloco. Quando **não** consta, é o agrupamento que restringe a ordem, como antes — obrigatório na prática para &#x60;FLEXIBLE_WITHIN_GROUP&#x60; —, que **não é exposto ao personal**. Identificador de máquina, nunca copy de tela. | [optional]
**cadence** | [**PrescribedCadence**](PrescribedCadence.md) | Cadência prescrita do exercício; ausente quando o personal não a definiu, nunca &#x60;0-0-0-0&#x60;. | [optional]
**technique** | [**PrescribedTechnique**](PrescribedTechnique.md) | Etiqueta informativa da técnica (pirâmide); ausente quando não há. | [optional]
**dependsOnPrescribedExerciseId** | **String** | Exercício que precisa estar concluído antes deste, quando o personal declara dependência. | [optional]
**notes** | **String** | Nota do personal para o exercício. Conteúdo autorado, preservado verbatim UTF-8, nunca traduzido, normalizado, reescrito ou truncado em silêncio. | [optional]
**restRange** | [**PrescribedRestRange**](PrescribedRestRange.md) |  | [optional]
**sets** | [PrescriptionDraftSet] | Séries prescritas; um rascunho ainda incompleto pode ter a lista vazia, e a publicação é que exige ao menos uma. A **primeira** série, a de menor &#x60;setIndex&#x60;, nunca é &#x60;DROP_SET&#x60;: a publicação recusa o contrário com &#x60;422 DRAFT_INCOMPLETE&#x60; e &#x60;fieldErrors&#x60; de código &#x60;DROP_SET_FIRST&#x60; apontando o &#x60;setType&#x60; dela. |
**alternatives** | [PrescriptionDraftAlternative] |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
