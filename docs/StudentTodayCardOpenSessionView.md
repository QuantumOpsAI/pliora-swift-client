# StudentTodayCardOpenSessionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | A identidade da sessão, a mesma que o início adotou. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão fixada da prescrição; imutável pelo resto da vida da sessão. |
**status** | [**StudentTodayCardSessionStatus**](StudentTodayCardSessionStatus.md) |  |
**startedAt** | **Date** | Instante do servidor em que o início da sessão foi confirmado. |
**completedSetCount** | **Int** | Séries já registradas como feitas nesta sessão, contadas pelo servidor. |
**totalSetCount** | **Int** | Séries prescritas do treino da sessão, contadas pelo servidor; o cliente não recalcula nenhuma das duas contagens. |
**lastRecordedAt** | **Date** | Maior instante de servidor entre o início da sessão e qualquer fato aceito nela; é dele que se conta o prazo da interrupção. |
**restStartedAt** | **Date** | Início do descanso em curso. É o &#x60;completedAt&#x60; da **última série registrada** na sessão, quando ela é &#x60;COMPLETED&#x60; ou &#x60;PARTIAL&#x60; e ainda não tem descanso registrado (nenhum &#x60;REST_PERIOD&#x60; com &#x60;afterSetExecutionId&#x60; igual a ela) — o mesmo instante de que o pacote da sessão deriva o descanso em curso, para a barra e a tela de descanso concordarem. A emenda de uma série não muda o &#x60;completedAt&#x60; dela, e não cria nem desloca descanso. O fim do descanso só chega ao servidor quando o aparelho o registra (&#x60;recordStudentRestPeriod&#x60;); até lá ele segue correndo nesta leitura, como na tela de descanso. **Ausente**, e então &#x60;restDurationSeconds&#x60; também: com a sessão &#x60;INTERRUPTED&#x60;; sem série registrada; quando a última série registrada é &#x60;SKIPPED&#x60;, que vai direto à série seguinte e não volta à anterior para achar um descanso; quando a última série já tem descanso registrado; e quando a posição dela não tem tela de descanso — membro de bloco que não é o último da rodada, sem descanso entre estações. | [optional]
**restDurationSeconds** | **Int** | Alvo prescrito do descanso em curso, em segundos: o mesmo &#x60;restSeconds&#x60; que o pacote da sessão publica para aquela série (&#x60;PrescribedSetSyncView.restSeconds&#x60;), com a regra de bloco dele — o descanso entre estações depois de um membro que não é o último da rodada, e o do bloco depois do último. Só existe com &#x60;restStartedAt&#x60;. **Não inclui o ajuste** de &#x60;−15 s&#x60;/&#x60;+15 s&#x60; do aluno, que só existe no aparelho até o descanso ser registrado. **Ausente** quando não há descanso prescrito depois da série — depois da última rodada de um bloco, ou fora de bloco sem descanso —, e então a barra conta para cima, como a tela de descanso. A ausência nunca é zero: o campo nunca vale &#x60;0&#x60;, e o descanso prescrito de zero segundo também fica ausente, porque passado o alvo a barra já mostra o decorrido. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
