# FieldError

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**field** | **String** | Caminho do campo no comando recebido. |
**code** | **String** | Código estável da violação pertencente a um conjunto aberto. Clientes podem registrá-lo e correlacioná-lo, mas não selecionam copy a partir dele: valores novos podem aparecer sem uma nova versão do contrato. A mensagem exibível é &#x60;message&#x60;; quando ela não vier, o cliente usa sua copy genérica para o campo. |
**message** | **String** | Mensagem segura e localizada pelo servidor para exibição verbatim. Quando ausente, o cliente usa copy genérica própria para o campo e nunca tenta traduzir &#x60;code&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
