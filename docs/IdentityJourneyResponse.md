# IdentityJourneyResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**continuation** | **String** |  |
**nextStep** | **String** | Próxima etapa decidida pelo servidor. &#x60;ENTRY_JOURNEY_CHOICE_REQUIRED&#x60; publica o momento em que a pessoa escolhe, com o mesmo peso, entre a jornada de aluno daquele convite e a jornada profissional; a escolha não é persistida como papel e a entrada seguinte com convite válido volta a perguntar. **Não existe passo de confirmação de convite nem de divergência de e-mail.** Sob &#x60;DEC-CONV-2&#x60;, a conta cujo e-mail diverge do destino do convite resolve a divergência por prova de posse do endereço convidado, que o contexto de aceite publica em &#x60;emailOwnership.status &#x3D; PROOF_REQUIRED&#x60;; nunca por uma tela de \&quot;confirmar que sou eu\&quot; depois do login. |
**invitationContext** | **String** | Ausência, preservação de um convite ou preservação de mais de um. Preservado significa que o convite permanece utilizável e não foi consumido por esta etapa; multiplicidade não elege convite nem cria relação. |
**session** | [**SessionResponse**](SessionResponse.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
