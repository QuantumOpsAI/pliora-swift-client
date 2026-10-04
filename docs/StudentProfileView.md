# StudentProfileView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**revision** | **String** | Validador da revisão do perfil, opaco para o cliente: o mesmo valor do &#x60;ETag&#x60; da resposta e o que o &#x60;If-Match&#x60; e o &#x60;revision&#x60; de &#x60;saveStudentProfile&#x60; ecoam. |
**displayName** | **String** | O nome que o aluno informou, **como ele escreveu**, de 1 a 60 caracteres (code points Unicode), preservado byte a byte. Ausente enquanto o aluno não informou e depois de apagá-lo; nunca nulo. É o valor que &#x60;getStudentTodayHeader.displayName&#x60; mostra na saudação. A escrita é só do próprio aluno. Por decisão do owner (&#x60;DEC-HOME-5&#x60;) o personal com vínculo ativo ou pausado vê este nome pela carteira, como &#x60;studentName&#x60;, em operação própria: nenhuma leitura deste schema o entrega a outra pessoa. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
