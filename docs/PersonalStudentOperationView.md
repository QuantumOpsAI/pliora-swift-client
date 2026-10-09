# PersonalStudentOperationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**item** | [**PersonalStudentOperationItemView**](PersonalStudentOperationItemView.md) | Linha operacional do vínculo, na mesma forma de &#x60;PersonalStudentOperationItemView&#x60; usada pela aba Alunos. |
**asOf** | **Date** | Instante do servidor em que a linha foi calculada. |
**origin** | [**SyncItemOrigin**](SyncItemOrigin.md) | Selo de origem reusado sem variação. Nesta leitura é sempre &#x60;PROJECTION&#x60;; como o item é derivado, o corte &#x60;asOf&#x60; é obrigatório. |
**blockedSince** | **Date** | Instante da mais antiga das razões de bloqueio ainda vigentes, igual ao &#x60;blockedSince&#x60; da fila, sem exigir que exista item aberto. É fato do bloqueio e nunca o instante da consulta. Com &#x60;SHARING_GRANT_REQUIRED&#x60; é o instante da revogação do aceite. Obrigatório quando &#x60;item.prescriptionEligibility.status&#x60; é &#x60;BLOCKED&#x60;; ausente quando &#x60;ELIGIBLE&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
