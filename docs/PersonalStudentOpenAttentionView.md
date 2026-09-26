# PersonalStudentOpenAttentionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**openItemCount** | **Int** | Quantidade de itens de atenção abertos para este vínculo no instante &#x60;asOf&#x60;. Conta **itens**, não pessoas e não severidade. Zero não afirma, não sugere e não insinua que o aluno esteja bem. |
**highestPrecedenceReasonCode** | [**PersonalAttentionReasonCode**](PersonalAttentionReasonCode.md) | Motivo do item de **maior precedência** aberto para este vínculo, reusando o enum já publicado pela fila, sem enum paralelo. Ele existe porque a aba Alunos apresenta o estado operacional a partir do item de maior precedência daquele aluno: derivá-lo no cliente exigiria percorrer a fila inteira — a chamada N+1 que esta operação remove — ou aplicar precedência no cliente, que esta fatia proíbe. Presente exatamente quando &#x60;openItemCount&#x60; é maior que zero, e nunca é rótulo do aluno. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
