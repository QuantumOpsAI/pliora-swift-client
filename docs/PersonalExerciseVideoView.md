# PersonalExerciseVideoView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**state** | [**PersonalExerciseVideoState**](PersonalExerciseVideoState.md) |  |
**assetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**mediaVersion** | **String** | Versão opaca da mídia, parte da identidade do vídeo junto com &#x60;assetId&#x60;. Muda a cada troca. O cliente compara por igualdade; não interpreta, não ordena aritmeticamente e não a fabrica. | [optional]
**rejectionReason** | [**PersonalExerciseVideoRejectionReason**](PersonalExerciseVideoRejectionReason.md) |  | [optional]
**rightsDeclaredAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]
**durationSeconds** | **Int** | Duração medida pelo servidor, em segundos arredondados para cima; só em &#x60;READY&#x60;. | [optional]
**variants** | [PersonalExerciseVideoVariantView] | Derivados temporários de leitura, no máximo um por &#x60;kind&#x60;. Vazia fora de &#x60;READY&#x60;. |
**revision** | **String** | Revisão do vídeo, opaca; o mesmo valor do &#x60;ETag&#x60; das leituras e confirmações do vídeo. |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
