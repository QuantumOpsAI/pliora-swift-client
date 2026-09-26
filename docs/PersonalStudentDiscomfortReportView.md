# PersonalStudentDiscomfortReportView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**asOf** | **Date** | Instante do servidor em que esta leitura foi calculada, obrigatório. Nunca o relógio do dispositivo; o cliente apenas formata. |
**report** | [**PersonalAttentionDiscomfortParameters**](PersonalAttentionDiscomfortParameters.md) | O fato estruturado do relato, **exatamente** como a fila já o publica. O vocabulário é reusado sem alteração — &#x60;area&#x60;, &#x60;sensation&#x60; e &#x60;intensity&#x60; são os mesmos conjuntos de &#x60;ExecutionDiscomfortReportPayload&#x60; —, e o texto livre continua ausente por construção. |
**executionContext** | [**PersonalStudentDiscomfortExecutionContextView**](PersonalStudentDiscomfortExecutionContextView.md) | Contexto de execução daquele exercício naquela sessão, dentro do conteúdo mínimo do acompanhamento. **Ausente é ausente:** quando o bloco não está disponível ele não vem, e a sua ausência nunca é zero, nunca é série vazia apresentada como fato e nunca afirma que nada aconteceu. O fato do relato continua sendo entregue. | [optional]
**acknowledgement** | [**PersonalDiscomfortAcknowledgementView**](PersonalDiscomfortAcknowledgementView.md) | Estado de reconhecimento daquele relato por esta conta, reusando a projeção que o próprio ato publica — autoria e instante, sem conteúdo. &#x60;null&#x60; quando ninguém reconheceu ainda: é ausência de ato, nunca negação, nunca zero e nunca afirmação de que o relato foi avaliado, tratado ou resolvido. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
