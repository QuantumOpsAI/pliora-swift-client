# StudentAnamnesisBodyDataSection

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sectionKey** | **String** |  |
**choice** | **String** | &#x60;PROVIDED&#x60; declara ao menos um número com &#x60;declaredOn&#x60; e &#x60;timeZone&#x60;; &#x60;SKIPPED&#x60; declara a escolha de não informar e proíbe os demais campos. Seção ausente continua ausente — não existe \&quot;não decidiu\&quot; gravável. |
**weightKg** | **Double** | Peso declarado em kg — decimal positivo até 999.99 e duas casas. Ausente é \&quot;não informado\&quot;, nunca zero; três casas, zero, negativo, NaN e Infinity são &#x60;422&#x60;. | [optional]
**heightCm** | **Double** | Altura declarada em cm — decimal positivo até 399.99 e duas casas, nas mesmas regras de &#x60;weightKg&#x60;. | [optional]
**declaredOn** | **Date** | Data civil ISO em que o aluno declara os números, válida e nunca futura na zona enviada — o servidor valida contra o próprio relógio e guarda data e zona originais. | [optional]
**timeZone** | **String** | Zona IANA em que &#x60;declaredOn&#x60; é lida e validada. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
