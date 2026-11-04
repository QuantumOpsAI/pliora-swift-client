# PlatformContactRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Nome Unicode sem controles nem conteúdo apenas em branco; validação runtime obrigatória. |
**email** | **String** | Normalização VerifiedEmail no servidor; pontos e plus-tags são preservados. |
**phone** | **String** | E.164 ou null; obrigatório para grant WHATSAPP ou VOICE. |
**interest** | **String** | Interesse fechado; OTHER não libera texto livre. |
**originCode** | **String** | Deve pertencer ao catálogo publicado; formato sozinho não concede origem válida. |
**timezone** | **String** | Identificador IANA ou null; não inferir pelo IP, telefone ou navegador. |
**channelGrants** | [PlatformContactChannelGrant] | Seleções explícitas, no máximo uma por canal. A unicidade por channel, a versão aprovada do texto e a exigência de telefone para WHATSAPP/VOICE são validadas no runtime; uniqueItems não bastaria para essa unicidade. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
