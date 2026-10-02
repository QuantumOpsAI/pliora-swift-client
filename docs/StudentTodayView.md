# StudentTodayView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**date** | **Date** | Data civil de \&quot;hoje\&quot; resolvida pelo servidor no timezone do aluno. O cliente não recalcula a data a partir do relógio local do device. |
**timeZone** | **String** | Timezone IANA em que o servidor resolveu &#x60;date&#x60; e a noção de \&quot;hoje\&quot;. O cliente não reinterpreta a data noutro timezone. |
**greeting** | **String** | Saudação completa, sem conteúdo autorado {ex. \&quot;Bom dia!\&quot;}. Copy do servidor, sujeita à negociação de &#x60;Accept-Language&#x60;. A UI posiciona &#x60;displayName&#x60; como componente separado e **nunca** o interpola nesta mensagem nem a usa como chave de catálogo. |
**displayName** | **String** | Nome de exibição autorado pela própria pessoa usuária, preservado byte a byte em UTF-8 e renderizado separadamente da saudação localizada. Nulo enquanto não existir esse dado autorado; convite, e-mail e atributos do provedor não são fallback. Idêntico em qualquer locale. |
**status** | [**StudentTodayStatus**](StudentTodayStatus.md) |  |
**relationship** | [**StudentTodayRelationshipView**](StudentTodayRelationshipView.md) |  |
**prescribedWorkout** | [**StudentTodayPrescribedWorkoutView**](StudentTodayPrescribedWorkoutView.md) | Treino prescrito para hoje; nulo quando &#x60;status&#x60; é &#x60;NO_WORKOUT_ASSIGNED&#x60; ou &#x60;REST_DAY&#x60;. |
**openSession** | [**StudentTodayOpenSessionView**](StudentTodayOpenSessionView.md) | Sessão já iniciada e ainda não encerrada; presente se e somente se &#x60;status&#x60; é &#x60;SESSION_IN_PROGRESS&#x60;. É o que permite à tela levar para a **retomada** em vez de oferecer um novo início. |
**lastSession** | [**StudentTodayLastSessionView**](StudentTodayLastSessionView.md) | Última sessão concluída do aluno, de qualquer dia anterior; nula quando ainda não há sessão concluída. Fato registrado, nunca reescrito por prescrição publicada depois. |
**sequencePlan** | [**StudentTodaySequencePlanView**](StudentTodaySequencePlanView.md) | O plano em sequência livre, **somente** quando a ativação vigente é &#x60;SEQUENCE&#x60;; com ele o estado nunca é &#x60;REST_DAY&#x60;. É o mesmo objeto de &#x60;getStudentTodayWorkout&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
