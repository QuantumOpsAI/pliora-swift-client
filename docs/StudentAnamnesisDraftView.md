# StudentAnamnesisDraftView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**revision** | **String** | Revisão opaca do rascunho e **única** precondição desta superfície: é ela que o &#x60;ETag&#x60; da leitura publica e que &#x60;If-Match&#x60; ecoa ao salvar seção e ao concluir. |
**updatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**sections** | [StudentAnamnesisSection] | Seções já preenchidas, tipadas; uma seção ausente permanece ausente e nunca vira valor vazio. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
