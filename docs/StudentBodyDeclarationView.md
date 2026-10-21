# StudentBodyDeclarationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**anamnesisVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**versionNumber** | **Int** |  |
**recordId** | **String** | Registro da ficha do vínculo em que a declaração nasceu. |
**author** | **String** | Conta aluna autora da declaração — imutável, definida pelo servidor. |
**origin** | **String** | Origem fechada da coleção declarada; medições profissionais têm coleção e origem próprias e nunca se misturam aqui. |
**declaredOn** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**timeZone** | **String** | Identificador de timezone IANA, por exemplo &#x60;America/Sao_Paulo&#x60;. |
**weightKg** | **Double** | Peso declarado, quando informado — ausente é \&quot;não informado\&quot;, nunca zero. | [optional]
**heightCm** | **Double** | Altura declarada, quando informada — ausente é \&quot;não informada\&quot;, nunca zero. | [optional]
**completedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
