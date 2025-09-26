# Software para Sistemas Ubíquos

## Links relevantes

- Consulte o [plano](docs/plano.pdf).
- Conceitos básicos de [hemograma](https://drive.google.com/file/d/11Mu27n1Av6A4__0fBmQ-vCtoo64JtKyJ/view?usp=sharing).
- Um [hemograma](https://fhir.saude.go.gov.br/r4/exame/) pela SES-GO (FHIR 4.0.1).
- Uso obrigatório do Github para registro de atividades, inclusive presenças. 

## Referências

- [Requisitos](./docs/requisitos.md)
- [Software design](./docs/design.md)

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

