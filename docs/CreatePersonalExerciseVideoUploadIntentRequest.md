# CreatePersonalExerciseVideoUploadIntentRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**contentType** | [**PersonalExerciseVideoUploadContentType**](PersonalExerciseVideoUploadContentType.md) |  |
**contentLength** | **Int** | Tamanho exato do corpo do PUT, em bytes, no máximo 100 MB (104857600). Um valor acima do limite responde &#x60;413 EXERCISE_VIDEO_TOO_LARGE&#x60; sem abrir intenção. |
**checksumSha256** | **String** | SHA-256 do conteúdo em minúsculas hexadecimais. É reconferido na confirmação; divergência responde &#x60;422 EXERCISE_VIDEO_UPLOAD_MISMATCH&#x60; e nada é publicado. |
**durationSeconds** | **Int** | Duração do vídeo normalizado, em segundos arredondados para cima, no máximo 60. Acima disso é &#x60;422 EXERCISE_VIDEO_TOO_LONG&#x60; sem abrir intenção. O servidor mede a duração real depois do envio, e uma duração medida acima de 60 s é &#x60;REJECTED&#x60;. |
**rightsDeclared** | **Bool** | A declaração do personal de que tem direito de usar a imagem de quem aparece no vídeo, **a cada envio**. Somente &#x60;true&#x60; é representável: sem a declaração a intenção é recusada (&#x60;422 EXERCISE_VIDEO_RIGHTS_NOT_DECLARED&#x60;) e nada é aberto. A caixa nasce desmarcada no app, e a declaração de um envio não vale para o seguinte. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
