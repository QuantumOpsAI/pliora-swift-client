# PersonalStudentPrescriptionView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentLabel** | **String** | Rótulo autorado no convite que originou o vínculo, preservado verbatim; ausente quando o convite não trouxe nome. Nunca lido do perfil atual do aluno. | [optional]
**studentName** | **String** | O nome que o aluno informou no próprio Perfil, **como ele escreveu**, de 1 a 60 caracteres (code points Unicode), preservado byte a byte: o mesmo &#x60;studentName&#x60; da carteira (&#x60;PersonalStudentListItemView&#x60;), que o servidor junta a esta leitura. **Obrigatório e nunca nulo**: esta leitura só responde para vínculo &#x60;ACTIVE&#x60; ou &#x60;PAUSED&#x60;, e o onboarding do aluno exige o nome antes do aceite do vínculo (&#x60;DEC-PHOME-6&#x60;). Não é o &#x60;studentLabel&#x60; nem o &#x60;studentDisplayName&#x60; dos convites (metadado privado do personal): outro dono, outro campo. A tela mostra este nome, com &#x60;studentLabel&#x60; como linha secundária quando os dois existem e diferem; nunca o traduz, nunca o trunca sem reticências e nunca o usa como chave. |
**prescriptionId** | **String** | Container lógico estável do plano do vínculo; ausente enquanto o aluno nunca teve plano nem rascunho. | [optional]
**asOf** | **Date** | Instante do servidor em que esta fotografia foi lida. |
**asOfDate** | **Date** | Dia civil de &#x60;asOf&#x60; no fuso do vínculo; é a referência de &#x60;activation.daysUntilEnd&#x60; e de &#x60;validity&#x60;, e o app não calcula \&quot;hoje\&quot; por conta própria. |
**eligibility** | [**StudentPrescriptionEligibilityView**](StudentPrescriptionEligibilityView.md) |  |
**validity** | [**PrescriptionValidity**](PrescriptionValidity.md) |  | [optional]
**currentVersion** | [**PrescriptionVersionSummary**](PrescriptionVersionSummary.md) |  | [optional]
**currentWorkouts** | [PrescriptionWorkoutSummary] | Treinos da versão vigente na ordem do plano, cada um com a contagem de exercícios. | [optional]
**activation** | [**PrescriptionActivationSummary**](PrescriptionActivationSummary.md) |  | [optional]
**openDraft** | [**PrescriptionDraftSummary**](PrescriptionDraftSummary.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
