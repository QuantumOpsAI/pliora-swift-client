# NewsletterDocumentPresentation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**documentVersion** | **String** | Versão ASCII do documento aprovado, resolvida pelo catálogo do servidor. |
**documentDigest** | **String** | SHA-256, em hexadecimal minúsculo, dos bytes UTF-8 exatos de documentText. |
**documentText** | **String** | Texto simples aprovado pelo catálogo, servido e versionado pelo servidor, exibido verbatim; até 64 KiB em UTF-8 (o limite em bytes é do runtime; o schema limita caracteres). O contrato não fixa o texto. |
**presentationRef** | **String** | 32 bytes aleatórios em base64url sem padding: exatamente 43 caracteres, com o último restrito aos que codificam 32 bytes (pliora-docs architecture/admin-operations/contracts.md §8.1). Opaco; não identifica pessoa, lead, conta nem e-mail. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
