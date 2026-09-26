# PrescriptionAssignmentAssignPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**assignmentId** | **String** | Identidade da atribuição, criada no device e igual ao &#x60;aggregateId&#x60; do envelope. |
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão publicada referenciada por identidade; o conteúdo nunca é copiado para o dia. |
**workoutId** | **String** | Treino dentro da versão publicada. |
**localDate** | **Date** | Data civil do aluno a que o treino é atribuído. O servidor é a autoridade do timezone do vínculo e da noção de \&quot;hoje\&quot;; o device não desloca a data. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
