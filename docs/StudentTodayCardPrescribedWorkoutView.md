# StudentTodayCardPrescribedWorkoutView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão publicada e imutável da prescrição exibida hoje. Publicar uma versão nova não reescreve esta, e a sessão iniciada fica ligada à versão que a originou. É a mesma identidade usada por &#x60;GET /student/workouts/{workoutId}/summary&#x60; e pelo início de sessão. |
**versionLabel** | **String** | Rótulo humano-legível e estável da versão da prescrição {ex. \&quot;v3\&quot;}. É código de máquina: nunca é traduzido, reescrito nem localizado, e o cliente não extrai ordem nem significado dele. |
**name** | **String** | Nome do treino prescrito {ex. \&quot;Treino A\&quot;}. Dado do domínio preservado verbatim UTF-8 e invariante de locale. |
**focus** | **String** | Foco declarado do treino {ex. \&quot;Peito e tríceps\&quot;}. Conteúdo autorado preservado verbatim e invariante de locale. Nulo somente para versão publicada antes de o foco autorado existir. O cliente compõe a linha exibida; o separador visual é copy do cliente. |
**authoredBy** | [**StudentTodayPersonalRef**](StudentTodayPersonalRef.md) | Autoria da prescrição — quem prescreveu este treino na versão publicada. A troca de personal cria relação nova, e o cartão só mostra treino da relação corrente; a autoria é preservada verbatim e nunca reatribuída. |
**exerciseCount** | **Int** | Quantidade de exercícios prescritos, contada pelo servidor. |
**setCount** | **Int** | Quantidade de séries prescritas, contada pelo servidor. |
**estimatedDurationMinutes** | [**DurationMinutesRange**](DurationMinutesRange.md) | Estimativa de duração calculada pelo servidor, o mesmo componente do resumo de treino. O cliente não recalcula a estimativa. |
**coachNotes** | **String** | Observação do personal para este treino, na versão publicada que o cartão mostra, preservada verbatim UTF-8 — a mesma de &#x60;WorkoutSummaryView.coachNotes&#x60;. **Ausente** quando não há observação. O cartão transporta no máximo 500 caracteres: uma observação maior chega com os primeiros 500, e o resumo antes de iniciar mostra o texto inteiro. O corte em linhas é do cliente. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
