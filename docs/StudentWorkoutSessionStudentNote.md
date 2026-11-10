# StudentWorkoutSessionStudentNote

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**subject** | [**StudentObservationSubject**](StudentObservationSubject.md) |  |
**exerciseExecutionId** | **String** | O exercício a que o fato pertence. Ausente na observação da classificação em conjunto (&#x60;GAP_CLASSIFICATION&#x60;), que vale para a sessão. | [optional]
**note** | **String** | Observação do aluno, como ele a escreveu. |
**sharedWithPersonal** | **Bool** | &#x60;true&#x60; quando o aluno marcou &#x60;Mostrar ao personal&#x60; nesta observação e não desmarcou depois (&#x60;setStudentObservationSharing&#x60;). Nasce &#x60;false&#x60;: o interruptor fica desmarcado. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
