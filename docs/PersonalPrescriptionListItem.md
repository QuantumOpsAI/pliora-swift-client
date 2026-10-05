# PersonalPrescriptionListItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentLabel** | **String** | Rótulo autorado no convite, preservado verbatim; ausente quando o convite não trouxe nome. | [optional]
**studentName** | **String** | O nome que o aluno informou no próprio Perfil, **como ele escreveu**, de 1 a 60 caracteres (code points Unicode), preservado byte a byte: o mesmo &#x60;studentName&#x60; da carteira (&#x60;PersonalStudentListItemView&#x60;), que o servidor junta ao item. **Obrigatório e nunca nulo**: a lista só traz vínculos &#x60;ACTIVE&#x60;, e o onboarding do aluno exige o nome antes do aceite do vínculo (&#x60;DEC-PHOME-6&#x60;). Não é o &#x60;studentLabel&#x60; nem o &#x60;studentDisplayName&#x60; dos convites (metadado privado do personal): outro dono, outro campo. A tela mostra este nome, com &#x60;studentLabel&#x60; como linha secundária quando os dois existem e diferem; nunca o traduz, nunca o trunca sem reticências e nunca o usa como chave. |
**states** | Set<PrescriptionListState> | Estados de plano em que o item casa; a página filtrada por &#x60;state&#x60; só devolve itens que o contêm. |
**validity** | [**PrescriptionValidity**](PrescriptionValidity.md) |  | [optional]
**currentVersion** | [**PrescriptionVersionSummary**](PrescriptionVersionSummary.md) |  | [optional]
**activation** | [**PrescriptionActivationSummary**](PrescriptionActivationSummary.md) |  | [optional]
**openDraft** | [**PrescriptionDraftSummary**](PrescriptionDraftSummary.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
