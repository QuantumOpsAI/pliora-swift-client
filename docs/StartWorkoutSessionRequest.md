# StartWorkoutSessionRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identidade da sessão, **gerada pelo cliente** antes de qualquer chamada, para que uma sessão iniciada offline mantenha a mesma identidade ao ser sincronizada. Deve ser globalmente única e nunca reutilizada; UUIDv7 é o gerador recomendado, alinhado ao envelope de sync e à baseline dos apps. O valor é opaco: o servidor não atribui semântica a ele e o cliente não infere ordem a partir dele. |
**workoutId** | **String** | Treino prescrito que a sessão vai executar, como lido na Home ou no resumo. |
**prescriptionVersionId** | **String** | Versão publicada da prescrição que o cliente leu ao iniciar. A sessão é fixada nela e não migra para uma versão publicada depois. Uma versão que não está atribuída ao aluno é recusada com &#x60;PRESCRIPTION_VERSION_NOT_ASSIGNED&#x60;, nunca substituída em silêncio. |
**startedAt** | **Date** | Instante real do início, declarado pelo device com offset explícito. É armazenado como declarado: um início offline de ontem permanece de ontem. Um instante muito à frente do relógio do servidor é recusado com &#x60;CLOCK_SKEW&#x60;. |
**source** | [**WorkoutSessionStartSource**](WorkoutSessionStartSource.md) | Ponto de entrada aprovado de onde o CTA \&quot;Iniciar treino\&quot; foi acionado. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
