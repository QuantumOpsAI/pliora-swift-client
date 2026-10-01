# ExerciseMediaAsset

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**assetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**mediaVersion** | **String** | Versão opaca do asset; comparar apenas por igualdade. |
**availability** | **String** | Estado explícito; nunca deve ser inferido da presença de URL. |
**mediaType** | **String** |  |
**usage** | **String** |  |
**offlinePolicy** | **String** | STREAM_ONLY proíbe persistência offline; TEMPORARY_CACHE_ALLOWED permite cache somente até offlineValidUntil; OFFLINE_DOWNLOAD_ALLOWED permite download verificável por sha256/byteSize dentro dos direitos vigentes. |
**url** | **String** | Referência renovável de entrega; nula quando availability não é AVAILABLE. |
**contentType** | **String** |  | [optional]
**durationSeconds** | **Int** |  | [optional]
**sha256** | **String** |  | [optional]
**byteSize** | **Int64** |  | [optional]
**expiresAt** | **Date** | Expiração da URL de entrega, independente do direito offline. | [optional]
**offlineValidUntil** | **Date** | Limite de retenção offline; nulo para STREAM_ONLY. | [optional]
**angle** | **String** | Ângulo de câmera do asset, quando a origem o informa. Código de máquina de vocabulário **aberto**, emitido pelo servidor: não é enum, o app mostra com o seu catálogo de textos os valores que conhece e com um rótulo genérico os demais, e só o compara por igualdade. É o valor que a preferência de vídeo guarda. | [optional]
**demonstrator** | **String** | Quem demonstra o exercício no asset, quando a origem o informa. Código de máquina de vocabulário **aberto**, com a mesma regra de &#x60;ExerciseMediaAngle&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
