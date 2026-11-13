# StudentObservationSharingRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**subject** | [**StudentObservationSubject**](StudentObservationSubject.md) |  |
**sharedWithPersonal** | **Bool** | &#x60;true&#x60; marca &#x60;Mostrar ao personal&#x60;; &#x60;false&#x60; desmarca. |
**supportTextVersion** | **String** | A versão, no catálogo do app, do texto de apoio que estava sob o interruptor quando o aluno o tocou (&#x60;Seu personal só vê esta observação se você marcar. Para dor ou desconforto, use Relatar desconforto.&#x60;). O servidor a grava com o estado e o instante, como prova da escolha, e não a publica. |
**changedAt** | **Date** | O instante do toque, no aparelho. O registro interno guarda também o instante do servidor. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
