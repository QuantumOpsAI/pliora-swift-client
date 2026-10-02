# StudentTodaySequencePlanView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**planName** | **String** | Nome do plano, autorado pelo personal e preservado verbatim. |
**prescriptionVersionId** | **String** | Versão publicada que a ativação serve; é a que &#x60;startStudentWorkoutSession&#x60; recebe, qualquer que seja o treino escolhido. |
**nextWorkoutId** | **String** | O próximo treino da sequência; pertence a &#x60;workouts&#x60;. Ausente somente quando &#x60;workouts&#x60; está vazio. | [optional]
**workouts** | [StudentSequenceWorkoutView] | Os treinos da sequência, na ordem dela. Vazio quando a sequência não tem treino nenhum — o plano publicado sem treino alcançado pela ativação —, e vazio não esconde erro de leitura. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
