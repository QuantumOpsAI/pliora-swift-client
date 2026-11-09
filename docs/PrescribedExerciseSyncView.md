# PrescribedExerciseSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**displayName** | **String** | Rótulo do exercício na prescrição, o mesmo de &#x60;PrescriptionDraftExercise&#x60;, preservado verbatim. É o nome que o aluno vê e que o histórico guarda, independentemente de o exercício continuar na origem do catálogo. |
**position** | **Int** |  |
**orderPolicy** | **String** | Orientação de ordem que o personal publicou para o exercício (&#x60;PrescribedOrderPolicy&#x60;). Fora de bloco combinado, &#x60;LOCKED&#x60; é a marca **Manter nesta posição**, que o app mostra só nesse exercício como &#x60;O personal sugere manter nesta posição&#x60; e que nunca impede mover nem adiar; &#x60;FLEXIBLE&#x60; é sem marca. Em exercício com &#x60;blockKey&#x60; de bloco combinado o valor é sempre &#x60;LOCKED&#x60; e não é marca: o app não a mostra. &#x60;FLEXIBLE_WITHIN_GROUP&#x60; da escrita chega aqui como &#x60;FLEXIBLE&#x60;. |
**blockKey** | **String** | Bloco combinado do exercício quando consta em &#x60;blocks[]&#x60; do treino; fora disso, o agrupamento de ordem de antes. Identificador de máquina. | [optional]
**cadence** | [**PrescribedCadence**](PrescribedCadence.md) |  | [optional]
**technique** | [**PrescribedTechnique**](PrescribedTechnique.md) |  | [optional]
**loadBasis** | [**LoadBasis**](LoadBasis.md) | Leitura do peso do exercício, como o personal a publicou. &#x60;null&#x60; é &#x60;leitura não informada&#x60;, que só se compara com &#x60;null&#x60;. O cliente a mostra colada à carga de cada série (&#x60;20 kg cada halter&#x60;) e nunca a edita nem infere. | [optional]
**notes** | **String** | Observação do personal para este exercício, preservada verbatim UTF-8, nunca traduzida nem truncada. Ausente quando não há. | [optional]
**sets** | [PrescribedSetSyncView] |  |
**authorizedAlternativeIds** | **[String]** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
