# StudentAnamnesisConsentView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**consentType** | **String** |  |
**decision** | **String** |  |
**documentVersion** | **String** | Versão imutável apresentada e aceita. |
**documentLocale** | [**Locale**](Locale.md) |  |
**documentText** | **String** | O texto exato aceito, preservado como foi apresentado, no locale de &#x60;documentLocale&#x60; — nunca traduzido nem trocado pelo texto vigente do catálogo. |
**documentSha256** | **String** | SHA-256 dos bytes UTF-8 de &#x60;documentText&#x60;, gravado no commit do aceite. |
**acceptedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
