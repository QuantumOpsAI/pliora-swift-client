# PersonalExerciseVideoUploadIntentView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uploadId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**method** | **String** | Método HTTP da entrega dos bytes; o ciclo publica somente PUT. |
**url** | **String** | Destino temporário e opaco de um PUT. Expira em &#x60;expiresAt&#x60; e nunca identifica o vídeo. |
**headers** | [PersonalExerciseVideoUploadHeader] | Cabeçalhos obrigatórios do PUT, na forma nome/valor. A lista é completa: o cliente envia exatamente estes e não inventa outros. |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**contentLength** | **Int** | O tamanho declarado no pedido, que o servidor reconfere na confirmação. |
**maxSizeBytes** | **Int** | Limite de bytes aceito, ecoado do contrato (104857600). É o limite do produto, não uma configuração de provedor, e o armazenamento não o impõe no envio. |
**rightsDeclaredAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
