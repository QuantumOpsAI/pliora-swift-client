# PersonalStudentExerciseSessionHistoryPage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**asOf** | **Date** | Instante do servidor em que esta página foi calculada, obrigatório em toda leitura. Nunca o relógio do dispositivo. |
**comparableKey** | [**PersonalStudentComparableExerciseKey**](PersonalStudentComparableExerciseKey.md) |  |
**comparisonStatus** | [**ComparisonStatus**](ComparisonStatus.md) | Estado da comparabilidade, sempre explícito, reusando o enum já publicado — o **enum**, não a leitura de sync em que ele aparece hoje. &#x60;NOT_COMPARABLE&#x60; e &#x60;NO_COMPARABLE_EXECUTION&#x60; são estados nomeados, e nunca uma série que junte chaves diferentes. |
**sessions** | [PersonalStudentExerciseSessionHistoryEntry] | Sessões da chave comparável, da mais recente para a mais antiga. Todas pertencem à mesma chave: a série nunca mistura variantes ou contextos de equipamento diferentes. |
**projections** | [PersonalStudentExerciseProjection] | Projeções determinísticas e reconstruíveis daquela chave comparável no mesmo &#x60;asOf&#x60;. O servidor calcula cada uma e declara a sua janela; o cliente não infere projeções a partir das páginas nem soma contagens entre elas. |
**nextCursor** | **String** | Cursor opaco da próxima página, **nulo na última**. Nunca é offset, índice ou dado a ser interpretado pelo cliente. O formato é base64url — **sem espaço, sem pontuação e limitado** —, e isso é restrição de contrato, não detalhe de implementação: nesta superfície não pode existir folha de texto capaz de carregar frase, e um cursor que aceitasse espaço seria exatamente essa folha. &#x60;scripts/check-personal-attention-destinations.mjs&#x60; reprova **por forma, não por nome**, toda folha de texto que consiga carregar prosa. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
