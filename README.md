# Software para Sistemas Ubíquos

## Links relevantes

- Consulte o [plano](docs/plano.pdf).
- Conceitos básicos de [hemograma](https://drive.google.com/file/d/11Mu27n1Av6A4__0fBmQ-vCtoo64JtKyJ/view?usp=sharing).
- Um [hemograma](https://fhir.saude.go.gov.br/r4/exame/) pela SES-GO (FHIR 4.0.1).
- Uso obrigatório do Github para registro de atividades, inclusive presenças. 

## Ementa

Sistemas de informação que fazem uso de dispositivos (ubíquos) (16h): smartphones, sensores, internet das coisas (IoT), stream analytics e aspectos de segurança (vulnerabilidades, criptografia, certificados digitais). Definição de arquiteturas para soluções móveis (16): conectar serviços, possivelmente de grande volume, fluxo e em tempo real, com a necessidade de analisá-los. Desenvolvimento de código para smartphone, sensor ou outro dispositivo capaz de alimentar/receber informações de sistema de informação (32h).

## Objetivo geral

Estar apto a colaborar com o desenvolvimento de soluções no domínio
de sistemas ubíquos e pervasivos.

## Critérios de avaliação

A avaliação da disciplina será baseada na metodologia de aula invertida, onde os estudantes conduzem o desenvolvimento do trabalho prático e o professor atua como mediador. A nota final será composta por:

### 1. Desenvolvimento Incremental do Sistema (60%)

**1.1 Entrega dos Marcos Técnicos (40%)**
- **Marco 1 - Recepção FHIR (10%)**: implementação funcional do receptor de mensagens FHIR via [subscription](https://www.hl7.org/fhir/R4/subscription.html), com parsing de instâncias de recursos Observation. Você deve usar este mecanismo para que cada novo hemograma recebido pelo servidor FHIR seja "sinalizado" para o receptor que terá que realizar o parsing do JSON recebido (hemograma). Se você usar um Servidor FHIR para testes como o HAPI FHIR, por exemplo, a consulta [https://hapi.fhir.org/baseR4/Subscription?status=active&_summary=count](https://hapi.fhir.org/baseR4/Subscription?status=active&_summary=count) mostrará quantas "assinaturas" estarão ativas. Um servidor para testes facilita o aprendizado, mas bem provavelmente irão disponibilizar localmente uma instância do [Servidor HAPI FHIR](https://github.com/hapifhir/hapi-fhir-jpaserver-starter) ou outra.
- **Marco 2 - Análise Individual (10%)**: componente de análise individual de hemogramas com detecção de desvios nos parâmetros hematológicos. Por exemplo, abaixo segue uma tabela de referência simplificada. Sua equipe é estimulada a buscar parâmetros do estado de Goiás e do Brasil, ou até mesmo mundiais:

| Parâmetro | Unidade | Valor Mínimo | Valor Máximo |
| :--- | :--- | :--- | :--- |
| Leucócitos | /µL | 4.000 | 11.000 |
| Hemoglobina | g/dL | 12.0 | 17.5 |
| Plaquetas | /µL | 150.000 | 450.000 |
| Hematócrito | % | 36 | 52 |

*Qualquer valor fora desta faixa deve ser considerado um desvio e registrado pelo sistema.*
- **Marco 3 - Base Consolidada (10%)**: sistema de armazenamento local operacional com persistência dos hemogramas recebidos e eventuais outros dados para análise proposta.
- **Marco 4 - Análise Coletiva (10%)**: implementação da detecção de padrões coletivos em janelas deslizantes com os indicadores especificados

**1.2 Integração e Funcionalidades Avançadas (20%)**
- **API REST (5%)**: endpoints funcionais para consulta de alertas com documentação adequada
- **Aplicativo Móvel (10%)**: App Android funcional com recebimento de notificações e interface para consulta de alertas
- **Testes e Qualidade (5%)**: cobertura de testes automatizados e qualidade do código (seguindo boas práticas)

### 2. Processo de Desenvolvimento e Colaboração (25%)

**2.1 Gestão de Projeto (10%)**
- Uso adequado de controle de versão (Git) com commits organizados e mensagens descritivas
- Organização de backlog e sprints com divisão clara de responsabilidades entre membros da equipe
- Documentação técnica atualizada (README, arquitetura, APIs)

**2.2 Apresentações e Demonstrações (15%)**
- **Apresentações Intermediárias (10%)**: demonstrações funcionais nos marcos 1, 2, 3 e 4 (2,5% cada)
- **Apresentação Final (5%)**: demonstração completa do sistema integrado com cenários de uso realistas

### 3. Competências Técnicas e Conceituais (15%)

**3.1 Aplicação de Conceitos da Disciplina (10%)**
- Uso adequado de padrões de sistemas ubíquos: publish-subscribe, streaming, processamento em tempo real
- Implementação de aspectos não-funcionais: segurança (HTTPS com mTLS), performance, escalabilidade
- Aplicação correta do padrão HL7 FHIR e interoperabilidade

**3.2 Inovação e Solução de Problemas (5%)**
- Capacidade de resolver problemas técnicos encontrados durante o desenvolvimento
- Implementação de melhorias ou funcionalidades adicionais relevantes ao contexto de saúde pública

### Cronograma de Avaliações

As entregas e apresentações seguirão o cronograma a ser definido. As principais atividades avaliativas são:

- **Apresentação do Marco 1**: Demonstração do receptor FHIR.
- **Apresentação do Marco 2**: Demonstração da análise individual.
- **Apresentação do Marco 3**: Demonstração da base consolidada.
- **Apresentação do Marco 4**: Demonstração da análise coletiva.
- **Entrega Final**: Apresentação do sistema completo, incluindo API, App Móvel e documentação final.

### Critérios de Aprovação

- **Nota mínima**: 6,0 (sessenta por cento)
- **Frequência mínima**: 75%
- **Entrega obrigatória**: Todos os 4 marcos técnicos devem ser entregues (mesmo que parcialmente funcionais)
- **Trabalho em equipe**: Equipes de 3-5 estudantes, com avaliação individual baseada na contribuição identificada no Git

### Observações

- As apresentações serão avaliadas quanto à clareza técnica, funcionalidade demonstrada e capacidade de responder questionamentos
- O código será avaliado quanto à funcionalidade, organização, documentação e aderência aos requisitos técnicos
- Será valorizada a evolução e aprendizado demonstrado ao longo do semestre, não apenas o resultado final
- Feedbacks contínuos serão fornecidos após cada marco para orientar melhorias


# Trabalho prático - Sistema de Monitoramento de Hemogramas

## Contexto  

O sistema de saúde estadual possui um grande volume de hemogramas sendo recebidos diariamente por diversos laboratórios públicos e privados. Esses exames contêm informações valiosas que, se analisadas dinamicamente, podem antecipar a identificação de surtos, agravos coletivos e outras situações críticas de saúde pública.

A proposta consiste em desenvolver um sistema de software que processe automaticamente os hemogramas recebidos, identifique sinais relevantes e notifique, por meio de um aplicativo móvel, os gestores responsáveis pela vigilância em saúde.

## Objetivos  

O objetivo deste projeto é permitir que gestores de saúde pública recebam, em tempo real, alertas baseados em evidências laboratoriais populacionais, com base em hemogramas provenientes da rede estadual de laboratórios.

## Funcionalidades esperadas  

1. receber e processar hemogramas via mecanismo de subscription FHIR  
2. realizar análise individual de cada hemograma para identificar desvios em parâmetros hematológicos  
3. manter uma base consolidada local com hemogramas recebidos  
4. realizar análises populacionais em janelas de tempo deslizantes  
5. detectar padrões coletivos anômalos (ex: aumento expressivo de leucócitos em determinada região)  
6. emitir alertas para gestores de saúde quando padrões suspeitos forem detectados  
7. disponibilizar aplicativo móvel para notificação e consulta dos alertas  

## Arquitetura geral  

O sistema será composto por:  

- um receptor de mensagens FHIR via subscription, que receberá instâncias do recurso Observation  
- um componente de processamento analítico que irá atualizar a base consolidada e executar as análises  
- um gerador de notificações baseado em regras e em detecção de padrões  
- uma API REST para expor os alertas detectados  
- um aplicativo móvel para gestores de saúde, que consulta e recebe notificações  

## Detecção de padrões coletivos  

O sistema terá como objetivo principal identificar não apenas anomalias individuais em hemogramas, mas também padrões coletivos que possam indicar situações relevantes do ponto de vista da saúde pública. Para isso, será mantido um estado consolidado local, atualizado continuamente com os hemogramas recebidos.

A detecção de padrões coletivos seguirá os seguintes princípios e estratégias:

1. unidade de agregação:  
   - os dados serão agregados por região geográfica (exemplo: município, distrito sanitário, unidade de saúde ou código IBGE)  
   - será possível configurar qual nível geográfico deve ser considerado na agregação  

2. janela de tempo:  
   - os dados serão avaliados dentro de uma janela deslizante de tempo (por exemplo, últimas 24h ou últimos 3 dias)  
   - essa janela será usada para manter uma amostra recente da população monitorada  

3. indicadores computados:  
   - para cada região e janela de tempo, o sistema calculará:  
     - total de hemogramas recebidos  
     - número de hemogramas com alertas individuais (ex: leucócitos elevados)  
     - proporção de hemogramas com alertas em relação ao total  
     - média e desvio padrão dos valores de cada parâmetro (ex: leucócitos, plaquetas, hemoglobina)  
     - tendência temporal (se a média dos valores está aumentando ou diminuindo em relação à janela anterior)  

4. gatilhos para alertas coletivos:  
   - será disparado um alerta coletivo quando forem satisfeitas simultaneamente as seguintes condições:  
     - volume mínimo de dados: número mínimo de hemogramas na janela (por exemplo, pelo menos 30)  
     - proporção de alertas acima de limiar configurável (ex: mais de 40% com leucócitos alterados)  
     - tendência de aumento: o valor médio do parâmetro em questão aumentou significativamente (por exemplo, 20%) em comparação com a janela anterior  

5. frequência de avaliação:  
   - a detecção coletiva será feita periodicamente (ex: a cada 15 minutos), utilizando os dados recebidos até aquele momento  
   - a análise será incremental, utilizando uma estrutura de dados de janela deslizante eficiente para evitar reprocessamento completo  

6. resposta ao alerta coletivo:  
   - quando um padrão coletivo for detectado, o sistema:  
     - criará uma instância do recurso FHIR `Communication`, associada à região e janela de tempo  
     - enviará uma notificação ao aplicativo móvel com:  
       - região afetada  
       - parâmetro alterado (ex: leucócitos)  
       - valores médios e comparação com a janela anterior  
       - número total de hemogramas e proporção com alerta  
       - sugestão de ação (ex: investigação in loco, reforço da vigilância laboratorial etc.)  

7. persistência e auditoria:  
   - cada alerta coletivo será registrado com um identificador único, data/hora, dados estatísticos utilizados, e o conjunto de Observations (hemogramas) que contribuíram para o alerta  
   - esses dados serão mantidos como evidência e poderão ser auditados posteriormente  

8. tolerância a ruído:  
   - para evitar falsos positivos, será utilizado um limite mínimo de número de amostras e algoritmos de suavização (como médias móveis exponenciais)  
   - regiões com pouca amostragem poderão ser tratadas de forma distinta, com alertas de baixa confiabilidade ou exigência de confirmação manual  

## Requisitos técnicos  

- uso do padrão HL7 FHIR versão R4  
- uso do recurso Observation com perfil específico de hemograma  
- mecanismo de subscription FHIR (Rest-Hook ou Websocket)  
- armazenamento local dos dados recebidos (banco relacional ou NoSQL)  
- análise estatística básica (média, desvio, tendência)  
- desenvolvimento de API REST para consulta dos alertas  
- implementação de notificações push no aplicativo móvel (Android)  

## Restrições de projeto  

- o sistema não deverá armazenar dados pessoais identificáveis  
- a comunicação entre sistemas deverá ocorrer via HTTPS, com autenticação mTLS  
- o aplicativo móvel será voltado inicialmente para Android e destinado a uso interno por gestores de saúde  
- os alertas gerados não têm caráter diagnóstico, apenas sinalizam necessidade de investigação epidemiológica  

## Tecnologias sugeridas  

- linguagem Java ou Kotlin para backend  
- Spring Boot para construção da API REST e recebimento dos subscriptions  
- uso de MongoDB ou PostgreSQL com partição por data  
- FHIR client HAPI-FHIR para parse e manipulação dos recursos  
- Firebase Cloud Messaging para notificações push no app Android  
- Jetpack Compose ou Flutter para desenvolvimento do app  

## Justificativa pedagógica  

Este projeto oferece aos alunos de engenharia de software uma oportunidade de desenvolver um sistema completo, integrado com padrões internacionais de interoperabilidade (FHIR), incluindo:  

- recebimento assíncrono de dados via subscription  
- manipulação de dados clínicos estruturados  
- análise estatística em tempo real  
- projeto de APIs RESTful  
- integração com app móvel via notificações  

Além disso, o projeto conecta fortemente o desenvolvimento de software com o valor gerado para o negócio da saúde pública, promovendo uma compreensão concreta de como tecnologia pode auxiliar na vigilância e resposta rápida a eventos adversos populacionais.
