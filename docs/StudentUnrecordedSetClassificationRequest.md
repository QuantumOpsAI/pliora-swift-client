# StudentUnrecordedSetClassificationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**classificationId** | **String** | Identidade da classificação, criada no aparelho e adotada pelo servidor. |
**items** | [StudentUnrecordedSetClassificationItem] | Uma entrada por série prescrita classificada; cada &#x60;prescribedSetId&#x60; aparece uma vez. &#x60;Deixar sem registro&#x60; não é enviado: a série fica sem fato. |
**observation** | **String** | Observação opcional da classificação (&#x60;REAL-05&#x60;, §7.10), texto curto do aluno, presa a ela (&#x60;GAP_CLASSIFICATION&#x60;). Nasce sem ser mostrada ao personal. | [optional]
**classifiedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
