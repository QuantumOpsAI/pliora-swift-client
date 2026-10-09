# PersonalStudentAnamnesisView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipId** | **String** | Vínculo ativo que autoriza esta leitura, e dono da ficha cujo preenchimento &#x60;anamnesis.currentFormState&#x60; descreve. As escritas do personal sobre a ficha o repetem no corpo. |
**anamnesis** | [**PersonalStudentOperationAnamnesisView**](PersonalStudentOperationAnamnesisView.md) |  |
**authorizedVersions** | Set<PersonalAuthorizedAnamnesisVersionRef> | Conjunto autorizado, em ordem do servidor: primeiro as versões deste vínculo, da mais recente para a mais antiga, depois as anteriores autorizadas, da mais recente para a mais antiga. Vazio é **ausência confirmada de versão autorizada neste vínculo** — nunca falha de leitura, nunca \&quot;o aluno nunca concluiu\&quot;. A autorização é aplicada **antes** de selecionar, contar e ordenar. |
**latestCurrentVersion** | [**StudentAnamnesisVersionView**](StudentAnamnesisVersionView.md) |  | [optional]
**readiness** | [**StudentReadinessView**](StudentReadinessView.md) |  | [optional]
**prescriptionEligibility** | [**StudentPrescriptionEligibilityView**](StudentPrescriptionEligibilityView.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
