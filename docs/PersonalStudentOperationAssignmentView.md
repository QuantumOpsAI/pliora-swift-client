# PersonalStudentOperationAssignmentView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**state** | [**PersonalStudentOperationAssignmentState**](PersonalStudentOperationAssignmentState.md) |  |
**current** | [**PersonalStudentScheduleDayPrescribed**](PersonalStudentScheduleDayPrescribed.md) | Referência da atribuição desta leitura, vigente ou, sem vigente, a próxima — atribuição, treino, com nome e foco, e a versão de prescrição fixada nela —, reusando a mesma referência prescrita que a semana do aluno publica, para que as duas leituras nunca divirjam. Ela nunca transporta conteúdo de série, carga ou repetição. Presente exatamente quando &#x60;state&#x60; é &#x60;ASSIGNED_PUBLISHED&#x60;. | [optional]
**startsOn** | **Date** | Data civil da atribuição em &#x60;current&#x60; quando ela é a **próxima**: presente **exatamente** quando não há nenhuma atribuição publicada com data até hoje, no fuso do vínculo, em &#x60;asOf&#x60;, e &#x60;current&#x60; é a atribuição de menor data depois de hoje; ausente quando &#x60;current&#x60; é a vigente e sempre ausente com &#x60;NO_ASSIGNMENT&#x60;. O cliente não compara datas: mostra a segunda linha \&quot;Começa em &lt;data&gt;\&quot; quando este campo chega, formatando a data civil sem hora e sem conversão de fuso, e deixa de mostrá-la na leitura em que ele some. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
