# StudentInvitationAcceptanceContextRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **String** | Bearer secret opaco do convite; nunca deve ser enviado em path, query, logs ou analytics. Apresentá-lo aqui não consome o convite. |
**invitationId** | **String** | Conferência cruzada **opcional**. Quando presente tem de ser o convite daquele token; divergir responde &#x60;404 INVITATION_NOT_FOUND&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
