# StudentTodayCardSequencePlanView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**planName** | **String** | Nome do plano, autorado pelo personal e preservado verbatim. |
**prescriptionVersionId** | **String** | Versão publicada que a ativação serve; é a que &#x60;startStudentWorkoutSession&#x60; recebe, qualquer que seja o treino escolhido. |
**nextWorkoutId** | **String** | O próximo treino da sequência; pertence a &#x60;workouts&#x60;. Ausente somente quando &#x60;workouts&#x60; está vazio. | [optional]
**workouts** | [StudentSequenceWorkoutView] | Os treinos da sequência, na ordem dela. Vazio quando a sequência não tem treino nenhum — o plano publicado sem treino alcançado pela ativação —, e vazio não esconde erro de leitura. |
**extras** | [StudentScheduleExtraWorkoutView] | Os treinos extras da versão em vigor, na ordem do plano, na forma da agenda do aluno; vazia quando o plano não tem extra; nunca ausente. Nunca entram em &#x60;workouts&#x60; nem são &#x60;nextWorkoutId&#x60;: não fazem parte da sequência. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
