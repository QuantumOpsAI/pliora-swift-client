# PersonalStudentAnamnesisView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipId** | **String** | Vínculo ativo que autoriza esta leitura, e dono da ficha cujo preenchimento &#x60;anamnesis.currentFormState&#x60; descreve. As escritas do personal sobre a ficha o repetem no corpo. |
**anamnesis** | [**PersonalStudentOperationAnamnesisView**](PersonalStudentOperationAnamnesisView.md) |  |
**authorizedVersions** | Set<PersonalAuthorizedAnamnesisVersionRef> | As versões concluídas **da ficha deste vínculo**, da mais recente para a mais antiga — o único conjunto que existe: não há versões de outras fichas para autorizar (&#x60;DEC-PHOME-20&#x60;). Vazio é **ausência confirmada de versão concluída nesta ficha** — nunca falha de leitura. A autorização é aplicada **antes** de selecionar, contar e ordenar. |
**latestCurrentVersion** | [**StudentAnamnesisVersionView**](StudentAnamnesisVersionView.md) |  | [optional]
**readiness** | [**StudentReadinessView**](StudentReadinessView.md) |  | [optional]
**prescriptionEligibility** | [**StudentPrescriptionEligibilityView**](StudentPrescriptionEligibilityView.md) |  |
**analysisCase** | [**PersonalStudentAnamnesisAnalysisCase**](PersonalStudentAnamnesisAnalysisCase.md) | Caso de análise por exceção **deste vínculo** (&#x60;DEC-PHOME-19&#x60; §5), presente enquanto ele existe e não foi retirado — inclui o caso já decidido que segue vigente. É a mesma projeção dos outcomes dos comandos de análise, nunca uma cópia paralela, e carrega a &#x60;revision&#x60; que &#x60;If-Match&#x60; ecoa nos comandos. Ausente é **não há caso a mostrar** — nunca caso de outro vínculo nem caso retirado. Não confunde com &#x60;readiness&#x60;: o caso é processo de análise, não declaração de aptidão. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
