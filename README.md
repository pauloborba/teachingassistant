# 🎓 Teaching Assistant

Projeto utilizado na disciplina de **Engenharia de Software e Sistemas (ESS)** do CIn-UFPE.

Este repositório é um fork do projeto original `pauloborba/teachingassistant` e será utilizado pelo grupo para implementar novas funcionalidades relacionadas ao módulo de **Notificações**.

---

## 🔔 Feature principal: Notificações

O objetivo desta etapa do projeto é ampliar o sistema com funcionalidades de notificação relacionadas ao acompanhamento acadêmico de alunos, professores e monitores.

As funcionalidades foram divididas entre os integrantes da equipe para evitar sobreposição de responsabilidades e permitir o desenvolvimento paralelo das features.

## 👥 Divisão da equipe

| Integrante | Funcionalidade |
|---|---|
| **Luiz** | 📩 Envio de e-mail com atualização de notas do aluno |
| **João** | 📊 Destaque de diferenças de desempenho entre alunos |
| **Luany** | 🎯 Envio de e-mail com resultado do aluno na disciplina |
| **Marco** | ⏰ Notificação ao professor sobre pendências no cadastro de notas |
| **Victória** | 🤝 Notificação por e-mail de alocação entre monitor e aluno |

---

## 🎯 Objetivo do módulo

O módulo de notificações deverá apoiar o acompanhamento das principais situações acadêmicas do sistema, como:

- 📚 atualização e lançamento de notas;
- 📊 acompanhamento de desempenho;
- 🎓 resultado em disciplinas;
- ⏰ pendências de cadastro;
- 🤝 alocação entre alunos e monitores.

As regras específicas de cada funcionalidade serão definidas por meio dos cenários de GUI e de serviço desenvolvidos por cada integrante.

---

## 🧪 Especificação dos cenários

Os comportamentos das novas funcionalidades serão especificados utilizando cenários no padrão adotado na disciplina:

Scenario: Nome do cenário
    Given ...
    When ...
    Then ...
Os cenários deverão ser concretos, verificáveis, declarativos e focados no comportamento da feature correspondente.


## 📁 Estrutura do projeto

teachingassistant/
├── gui/                # 🖥️ Interface do sistema
├── server/             # ⚙️ Serviços e regras de negócio
├── tests-acceptance/   # 🧪 Cenários e testes de aceitação
└── README.md           # 📖 Documentação geral

## 🌿 Organização do desenvolvimento

Cada integrante deverá trabalhar em sua própria feature, preferencialmente utilizando uma branch separada.
Exemplo:
master
│
├── feature/atualizacao-notas
├── feature/comparacao-desempenho
├── feature/resultado-disciplina
├── feature/notificacao-notas-pendentes
└── feature/alocacao-monitor-aluno

## 🧩 Repositórios

Projeto original
pauloborba/teachingassistant
Fork utilizado pela equipe
mavff/teachingassistant

## 📌 Status atual

- ✅ fork criado;
- ✅ repositório clonado;
- ✅ divisão das features definida;
- 🔄 cenários em especificação;
- 🎨 sketches de GUI em desenvolvimento;
- 🧪 acceptance tests a serem adicionados;
- ⚙️ implementação a iniciar.