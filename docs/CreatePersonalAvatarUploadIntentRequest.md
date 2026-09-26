# CreatePersonalAvatarUploadIntentRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**contentType** | [**AvatarUploadContentType**](AvatarUploadContentType.md) |  |
**sizeBytes** | **Int** | Tamanho exato em bytes, no máximo 10 MB (10485760). Um valor acima do limite responde &#x60;413 AVATAR_TOO_LARGE&#x60; sem abrir intenção. |
**checksumSha256** | **String** | SHA-256 do conteúdo em minúsculas hexadecimais. É reconferido na confirmação; divergência responde &#x60;422 AVATAR_CHECKSUM_MISMATCH&#x60; e nada é publicado. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
