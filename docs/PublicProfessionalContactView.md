# PublicProfessionalContactView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | [**ProfessionalContactKind**](ProfessionalContactKind.md) |  |
**contactId** | **String** | Identidade estável opaca do contato, emitida pelo servidor na criação. Não é AccountId nem confere autorização; alterar valor/audiência preserva a identidade, remoção não a reutiliza. |
**networkLabel** | **String** | Identificação simples da rede, autorada e preservada byte a byte após validação. Sem HTML, controles, rótulo de selo ou importação de Google/Apple; nenhuma lista de marcas é inferida. | [optional]
**profileUrl** | **String** | URL HTTPS canônica de perfil externo, host DNS ASCII (IDN em punycode), sem userinfo, IP literal, localhost ou barra invertida/whitespace/controles. A porta, se presente, deve estar entre1 e65535. Entrada já canônica: não trimar, retraduzir ou reescrever conteúdo salvo; host/scheme canônicos são requisito de validação, telefone usa seu próprio campo. Query/fragmento do perfil são preservados, não recebem dados da identidade/treino. Servidor não resolve DNS nem visita URL/preview; esta validação sintática não atesta domínio, posse ou destino remoto seguro em outro instante. | [optional]
**phoneNumber** | **String** | Número profissional canônico E.164, com + e código do país. Não deriva do login/IdP/aparelho. Espaços, extensão e formato local são inválidos; nenhuma mensagem é enviada por salvar ou ler. | [optional]
**audience** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
