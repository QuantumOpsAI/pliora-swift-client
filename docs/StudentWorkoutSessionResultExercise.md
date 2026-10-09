# StudentWorkoutSessionResultExercise

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseId** | **String** | O exercício da variante executada — o prescrito, ou o da alternativa quando o aluno executou outro exercício —, na **mesma identidade** que &#x60;listStudentExerciseProgress&#x60; devolve em &#x60;exerciseId&#x60; e que &#x60;getStudentExerciseProgress&#x60; recebe no caminho: é com ele que o resumo abre a evolução do exercício. Esta leitura não traz o contexto de equipamento, que fecha com a variante o par da evolução; aberta daqui só com &#x60;exerciseId&#x60;, a evolução lê o par de execução mais recente do exercício, que pode não ser o desta sessão. A evolução segue a privacidade das leituras de progresso — só a conta dona dos fatos —, e exercício sem série executada em sessão alguma não tem evolução (&#x60;404 EXERCISE_PROGRESS_NOT_FOUND&#x60;). |
**displayName** | **String** | O rótulo do exercício, o &#x60;displayName&#x60; que o personal deu na prescrição, preservado verbatim e invariante de locale. |
**executedVariantId** | **String** | A variante realmente executada, que não se presume igual à prescrita. |
**executedVariantLabel** | **String** | O rótulo da variante executada, preservado verbatim. Para o exercício do catálogo, que tem uma variante só, é o &#x60;displayName&#x60; da prescrição. |
**status** | **String** | O estado da execução do exercício quando a sessão terminou, o mesmo vocabulário de &#x60;ExerciseExecutionSyncView.status&#x60;. |
**firstTime** | **Bool** | &#x60;true&#x60; quando a base de comparação da chave do exercício (variante + equipamento + unidade de carga) é vazia: é a primeira vez, que **não é recorde**, e nenhum recorde da sessão aponta para uma série deste exercício. |
**blockKey** | **String** | O bloco combinado do exercício, quando ele consta em &#x60;blocks[]&#x60;; ausente fora de bloco. | [optional]
**volume** | [WorkoutVolumePortion] | O volume do exercício, uma parcela por unidade gravada, com a mesma regra de &#x60;WorkoutVolumePortion&#x60;. Vazia quando nenhuma série tem as duas grandezas. |
**sets** | [StudentWorkoutSessionResultSet] | As séries do exercício, na ordem de &#x60;prescribed.setIndex&#x60;. Vazia quando o exercício não tem série registrada, como o pulado. |
**substitution** | [**StudentWorkoutSessionResultSubstitution**](StudentWorkoutSessionResultSubstitution.md) |  | [optional]
**deferral** | [**StudentWorkoutSessionResultDeferral**](StudentWorkoutSessionResultDeferral.md) |  | [optional]
**skip** | [**StudentWorkoutSessionResultSkip**](StudentWorkoutSessionResultSkip.md) |  | [optional]
**discomforts** | [StudentWorkoutSessionResultDiscomfort] | Os relatos de desconforto do exercício, só região e intensidade. Ausente quando não houve relato. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
