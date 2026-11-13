# StartWorkoutSessionRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identidade da sessão, **gerada pelo cliente** antes de qualquer chamada, para que uma sessão iniciada offline mantenha a mesma identidade ao ser sincronizada. Deve ser globalmente única e nunca reutilizada; UUIDv7 é o gerador recomendado, alinhado ao envelope de sync e à baseline dos apps. O valor é opaco: o servidor não atribui semântica a ele e o cliente não infere ordem a partir dele. |
**workoutId** | **String** | Treino prescrito que a sessão vai executar, como lido na Home ou no resumo. Em plano por dias da semana, qualquer treino da versão em vigor, em qualquer dia; em plano em sequência livre, qualquer treino da sequência vigente, e não só o próximo. |
**prescriptionVersionId** | **String** | Versão publicada da prescrição que o cliente leu ao iniciar. A sessão é fixada nela e não migra para uma versão publicada depois. Uma versão que não está atribuída ao aluno é recusada com &#x60;PRESCRIPTION_VERSION_NOT_ASSIGNED&#x60;, nunca substituída em silêncio. |
**startedAt** | **Date** | Instante do início declarado pelo aparelho, com offset explícito. É aceito e guardado para auditoria, mas não é o instante da sessão: o servidor usa o próprio relógio ao confirmar o início, e é dele que sai o dia civil. Um instante à frente do relógio do servidor além da tolerância é recusado com &#x60;CLOCK_SKEW&#x60;. |
**source** | [**WorkoutSessionStartSource**](WorkoutSessionStartSource.md) | Ponto de entrada aprovado de onde o CTA \&quot;Iniciar treino\&quot; foi acionado. |
**expectedPlacement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação que a tela mostrou ao aluno antes do início: o &#x60;placementToday&#x60; do resumo ou o &#x60;placement&#x60; da oferta da Hoje. Opcional. Quando vem e difere da que o casamento calcula no início, o início é recusado com &#x60;409 PLACEMENT_CHANGED&#x60;, com a colocação atual; ausente, o servidor não compara. Em sequência livre a colocação calculada é sempre &#x60;ON_SCHEDULE&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
