# BodyDocumentPresentation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**presentationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**documentRef** | **String** | Referência imutável e opaca do documento específico apresentado. |
**documentVersion** | **String** | Versão imutável do documento efetivamente apresentado. |
**documentLocale** | [**Locale**](Locale.md) |  |
**documentText** | **String** | O texto exato apresentado, preservado como servido, no locale de &#x60;documentLocale&#x60; — nunca traduzido nem trocado pelo texto vigente do catálogo. Documento sintético; texto jurídico real continua bloqueado. |
**documentSha256** | **String** | SHA-256 dos bytes UTF-8 de &#x60;documentText&#x60;, emitido pelo servidor. |
**expiresAt** | **Date** | Validade absoluta da apresentação — 15 minutos da emissão, nunca prorrogada. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
