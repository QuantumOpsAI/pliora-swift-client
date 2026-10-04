# StudentTodayHeaderView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**date** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**timeZone** | **String** | Identificador de timezone IANA, por exemplo &#x60;America/Sao_Paulo&#x60;. |
**greeting** | **String** | Saudação do período do dia, copy do servidor negociada por &#x60;Accept-Language&#x60; e calculada **no fuso do vínculo** (&#x60;timeZone&#x60;): &#x60;Bom dia&#x60; de 00:00 a 11:59, &#x60;Boa tarde&#x60; de 12:00 a 17:59 e &#x60;Boa noite&#x60; de 18:00 a 23:59 — &#x60;Good morning&#x60;, &#x60;Good afternoon&#x60; e &#x60;Good evening&#x60;. Vem **sem pontuação**: o cliente compõe a linha com &#x60;displayName&#x60; como componente separado e põe os separadores do locale; nunca interpola o nome nesta mensagem nem a usa como chave de catálogo. |
**displayName** | **String** | O nome que o aluno informou no próprio perfil (&#x60;getStudentProfile&#x60;, &#x60;saveStudentProfile&#x60;), como ele escreveu, de 1 a 60 caracteres. O nome é obrigatório no onboarding (&#x60;DEC-PHOME-6&#x60;) e todo aluno com vínculo &#x60;ACTIVE&#x60; ou &#x60;PAUSED&#x60; o tem: nulo é só caso defensivo do schema. Nunca é derivado do rótulo privado do convite, do e-mail ou de atributos do provedor. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
