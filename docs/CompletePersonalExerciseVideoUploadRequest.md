# CompletePersonalExerciseVideoUploadRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**contentLength** | **Int** | Tamanho exato em bytes efetivamente entregues, no máximo 100 MB. |
**checksumSha256** | **String** | SHA-256 do conteúdo entregue, em minúsculas hexadecimais. Divergir do que o servidor calcula, ou do declarado na intenção, responde &#x60;422 EXERCISE_VIDEO_UPLOAD_MISMATCH&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
