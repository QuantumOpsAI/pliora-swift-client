# PersonalAttentionAnalysisCaseProjection

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**caseId** | **String** | Referência autorizada ao caso de análise vigente **deste vínculo** — o alvo da ação &#x60;Analisar esclarecimentos&#x60; do destino &#x60;STUDENT_PRESCRIPTION_ELIGIBILITY&#x60; (&#x60;DOC-PERSONAL-DESTINATIONS&#x60; §8.4). É a única identidade do caso que a fila publica, sempre do vínculo do item e nunca derivada de cache, do aluno ou de item presumido: referência que o servidor não emitiu não é navegável. |
**newResponseToAnalyze** | **Bool** | O estado estruturado **nova resposta para analisar** (&#x60;DOC-ANAMNESIS-BY-RELATIONSHIP&#x60; §5.3): presente — sempre &#x60;true&#x60; — somente quando a última contribuição ao caso é uma resposta do aluno ainda não analisada. Ausente enquanto o caso aguarda a resposta do aluno, foi aberto sem resposta nova ou a última contribuição já é ato do personal. Nunca carrega pergunta, resposta, motivo, contagem nem afirmação de entrega ou de leitura. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
