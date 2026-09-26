# StudentTodayPrescribedWorkoutView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão publicada e imutável da prescrição exibida hoje. Publicar uma versão nova não reescreve esta, e a sessão iniciada fica ligada à versão que a originou. É a mesma identidade usada por &#x60;GET /student/workouts/{workoutId}/summary&#x60; e pelo início de sessão. |
**versionLabel** | **String** | Rótulo humano-legível e estável da versão da prescrição {ex. \&quot;v3\&quot;}, exibido ao lado da autoria. É código de máquina: nunca é traduzido, reescrito nem localizado, e o cliente não extrai ordem nem significado dele. |
**name** | **String** | Nome do treino prescrito {ex. \&quot;Treino A\&quot;}. Dado do domínio preservado verbatim UTF-8 e invariante de locale. |
**focus** | **String** | Foco declarado do treino {ex. \&quot;Peito e tríceps\&quot;}. Conteúdo autorado preservado verbatim e invariante de locale. Nulo somente para versão publicada antes de o foco autorado existir; novas publicações continuam recusadas sem foco. O cliente compõe a linha exibida; o separador visual é copy do cliente. |
**authoredBy** | [**StudentTodayPersonalRef**](StudentTodayPersonalRef.md) | Autoria da prescrição — quem prescreveu este treino. Pode divergir de &#x60;relationship.personal&#x60; quando o treino vigente foi prescrito por um personal anterior; a autoria é preservada e nunca reatribuída ao personal atual. |
**exerciseCount** | **Int** | Quantidade de exercícios prescritos, contada pelo servidor. |
**setCount** | **Int** | Quantidade de séries prescritas, contada pelo servidor. |
**estimatedDurationMinutes** | [**DurationMinutesRange**](DurationMinutesRange.md) | Estimativa de duração calculada pelo servidor, reutilizando o mesmo componente do resumo de treino. O cliente não recalcula a estimativa. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
