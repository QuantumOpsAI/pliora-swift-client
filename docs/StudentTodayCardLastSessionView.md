# StudentTodayCardLastSessionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutName** | **String** | Nome do treino executado {ex. \&quot;Treino C\&quot;}, como estava na versão que originou a sessão. Conteúdo do domínio preservado verbatim. |
**workoutFocus** | **String** | Foco do treino executado {ex. \&quot;Pernas\&quot;}. Conteúdo autorado preservado verbatim e invariante de locale. Nulo somente quando a sessão referencia uma versão publicada antes de o foco autorado existir. |
**versionLabel** | **String** | Rótulo da versão da prescrição que originou a sessão, preservado como estava no momento da execução. Código de máquina, nunca localizado. |
**completedAt** | **Date** | Instante do servidor em que a sessão foi concluída. |
**durationSeconds** | **Int** | Duração da sessão em segundos, entre os instantes de servidor do início e da conclusão. |
**completedSetCount** | **Int** | Séries feitas na sessão. |
**totalSetCount** | **Int** | Séries prescritas do treino da sessão. |
**recordCount** | **Int** | Quantos recordes a sessão bateu: o tamanho de &#x60;records&#x60; em &#x60;getStudentWorkoutSessionResult&#x60;, pela mesma projeção. **Nulo** quando a projeção não pôde ser lida nesta resposta, e então a linha do último treino não desenha os recordes: nulo nunca é lido como zero. A linha abre o resultado da sessão. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
