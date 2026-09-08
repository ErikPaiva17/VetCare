# Cuidados Veterinários

## 📌 Apresentação do Projeto

O projeto **Cuidados Veterinários** consiste no desenvolvimento de um banco de dados relacional para auxiliar no gerenciamento das informações de uma clínica veterinária.

O sistema foi desenvolvido para organizar informações sobre tutores, animais, veterinários, atendimentos, tratamentos, medicamentos, vacinas, atendentes e produtos, permitindo um melhor controle dos atendimentos e do histórico dos animais.

---

## 🎯 Objetivo Geral

Desenvolver um banco de dados relacional utilizando **PostgreSQL** para gerenciar as informações de uma clínica veterinária, permitindo o cadastro e o controle de animais, seus respectivos tutores, veterinários, atendimentos, tratamentos, medicamentos, vacinações, atendentes e produtos.

---

## 👥 Público-Alvo

O sistema é destinado principalmente a:

- Clínicas veterinárias;
- Médicos veterinários;
- Atendentes e funcionários de clínicas;
- Administradores de estabelecimentos veterinários.

---

## 🗃️ Modelo de Dados Relacional

O banco de dados é composto pelas seguintes entidades:

- **Tutores:** armazena os dados dos responsáveis pelos animais.
- **Animais:** armazena os dados dos animais atendidos pela clínica.
- **Veterinários:** armazena os dados dos profissionais responsáveis pelos atendimentos.
- **Consultas:** registra os atendimentos realizados para os animais.
- **Tratamentos:** armazena os tratamentos indicados durante os atendimentos.
- **Medicamentos:** registra os medicamentos utilizados nos tratamentos.
- **Tratamentos_Medicamentos:** relaciona os tratamentos aos medicamentos utilizados.
- **Vacinas:** armazena as vacinas utilizadas pela clínica.
- **Animais_Vacinas:** registra as vacinas aplicadas em cada animal.
- **Atendentes:** armazena os dados dos funcionários responsáveis pelo atendimento.
- **Produtos:** registra os produtos comercializados ou utilizados pela clínica.
- **Atendimento_Itens:** relaciona os atendimentos aos produtos e serviços utilizados, armazenando seus respectivos valores.

---

## 🔗 Relacionamentos

Os principais relacionamentos do banco de dados são:

- Um **tutor** pode possuir vários **animais**.
- Um **animal** pode possuir várias **consultas**.
- Um **veterinário** pode realizar várias **consultas**.
- Uma **consulta** pode possuir vários **tratamentos**.
- Um **tratamento** pode utilizar vários **medicamentos**.
- Um **medicamento** pode ser utilizado em vários **tratamentos**.
- Um **animal** pode receber várias **vacinas**.
- Uma **vacina** pode ser aplicada em vários **animais**.
- Um **atendente** pode participar de vários **atendimentos**.
- Um **atendimento** pode possuir vários itens de produtos ou serviços.
- Um **produto** pode aparecer em vários itens de atendimento.
- Um atendente também pode ser cadastrado como **tutor/cliente** da clínica.

---

## 📊 Diagrama do Banco de Dados

```mermaid
erDiagram

    TUTORES ||--o{ ANIMAIS : possui
    ANIMAIS ||--o{ CONSULTAS : recebe
    VETERINARIOS ||--o{ CONSULTAS : realiza
    CONSULTAS ||--o{ TRATAMENTOS : possui
    TRATAMENTOS ||--o{ TRATAMENTOS_MEDICAMENTOS : utiliza
    MEDICAMENTOS ||--o{ TRATAMENTOS_MEDICAMENTOS : participa
    ANIMAIS ||--o{ ANIMAIS_VACINAS : recebe
    VACINAS ||--o{ ANIMAIS_VACINAS : aplicada
    ATENDENTES ||--o{ ATENDIMENTO_ITENS : registra
    PRODUTOS ||--o{ ATENDIMENTO_ITENS : utilizado

    TUTORES {
        SERIAL id_tutor PK
        VARCHAR nome
        VARCHAR cpf UK
        VARCHAR telefone
        VARCHAR email UK
    }

    ANIMAIS {
        SERIAL id_animal PK
        VARCHAR nome
        VARCHAR especie
        VARCHAR raca
        VARCHAR sexo
        DATE data_nascimento
        INTEGER id_tutor FK
    }

    VETERINARIOS {
        SERIAL id_veterinario PK
        VARCHAR nome
        VARCHAR crmv UK
        VARCHAR telefone
        VARCHAR email UK
        VARCHAR especialidade
    }

    CONSULTAS {
        SERIAL id_consulta PK
        DATE data_consulta
        TIME horario
        VARCHAR motivo
        VARCHAR diagnostico
        INTEGER id_animal FK
        INTEGER id_veterinario FK
    }

    TRATAMENTOS {
        SERIAL id_tratamento PK
        VARCHAR descricao
        DATE data_inicio
        DATE data_fim
        VARCHAR observacoes
        INTEGER id_consulta FK
    }

    MEDICAMENTOS {
        SERIAL id_medicamento PK
        VARCHAR nome
        VARCHAR principio_ativo
        VARCHAR fabricante
        VARCHAR dosagem
        VARCHAR observacoes
    }

    TRATAMENTOS_MEDICAMENTOS {
        INTEGER id_tratamento PK, FK
        INTEGER id_medicamento PK, FK
        VARCHAR dosagem
        VARCHAR frequencia
        INTEGER duracao_dias
    }

    VACINAS {
        SERIAL id_vacina PK
        VARCHAR nome
        VARCHAR fabricante
        VARCHAR descricao
        INTEGER doses
    }

    ANIMAIS_VACINAS {
        INTEGER id_animal PK, FK
        INTEGER id_vacina PK, FK
        DATE data_aplicacao
        DATE proxima_dose
    }

    ATENDENTES {
        SERIAL id_atendente PK
        VARCHAR nome
        VARCHAR cpf UK
        VARCHAR telefone
        VARCHAR email UK
    }

    PRODUTOS {
        SERIAL id_produto PK
        VARCHAR tipo
        VARCHAR marca
        VARCHAR descricao
        NUMERIC valor_compra
    }

    ATENDIMENTO_ITENS {
        INTEGER id_atendimento PK, FK
        INTEGER id_produto PK, FK
        VARCHAR tipo
        NUMERIC valor
        INTEGER quantidade
    }
