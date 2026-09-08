# Cuidados Veterinários

## 📌 Apresentação do Projeto

O projeto **Cuidados Veterinários** consiste no desenvolvimento de um banco de dados relacional para auxiliar no gerenciamento das informações de uma clínica veterinária.

O sistema foi desenvolvido para organizar e armazenar informações sobre tutores, animais, veterinários, consultas, tratamentos, medicamentos e vacinas. Com isso, a clínica poderá manter seus dados organizados, facilitando o controle dos atendimentos e do histórico dos animais.

## 🎯 Objetivo Geral

Desenvolver um banco de dados relacional utilizando **PostgreSQL** para gerenciar as informações de uma clínica veterinária, permitindo o cadastro e o controle de animais, seus respectivos tutores, veterinários, consultas, tratamentos, medicamentos e vacinações.

## 👥 Público-Alvo

O sistema é destinado principalmente a:

- Clínicas veterinárias;
- Médicos veterinários;
- Atendentes e funcionários de clínicas;
- Administradores de estabelecimentos veterinários.

## 🗃️ Modelo de Dados Relacional

O banco de dados será composto pelas seguintes entidades:

- **Tutores:** armazena os dados dos responsáveis pelos animais.
- **Animais:** armazena os dados dos animais atendidos pela clínica.
- **Veterinários:** armazena os dados dos profissionais responsáveis pelos atendimentos.
- **Especialidades:** registra as especialidades dos veterinários.
- **Consultas:** registra os atendimentos realizados pelos veterinários.
- **Tratamentos:** armazena os tratamentos indicados para os animais.
- **Medicamentos:** registra os medicamentos utilizados pela clínica.
- **Prescrições:** relaciona os medicamentos aos tratamentos.
- **Vacinas:** armazena as vacinas disponíveis na clínica.
- **Vacinações:** registra as vacinas aplicadas nos animais.

### Diagrama do Banco de Dados

```mermaid
erDiagram

    TUTORES ||--o{ ANIMAIS : possui
    ANIMAIS ||--o{ CONSULTAS : realiza
    VETERINARIOS ||--o{ CONSULTAS : realiza
    ESPECIALIDADES ||--o{ VETERINARIOS : possui

    CONSULTAS ||--o{ TRATAMENTOS : gera
    TRATAMENTOS ||--o{ PRESCRICOES : possui
    MEDICAMENTOS ||--o{ PRESCRICOES : utilizado_em

    ANIMAIS ||--o{ VACINACOES : recebe
    VACINAS ||--o{ VACINACOES : aplicada_em

    TUTORES {
        INTEGER id_tutor PK
        VARCHAR nome
        VARCHAR cpf UK
        VARCHAR telefone
        VARCHAR email UK
    }

    ANIMAIS {
        INTEGER id_animal PK
        INTEGER id_tutor FK
        VARCHAR nome
        VARCHAR especie
        VARCHAR raca
        DATE data_nascimento
        CHAR sexo
    }

    ESPECIALIDADES {
        INTEGER id_especialidade PK
        VARCHAR nome UK
        TEXT descricao
    }

    VETERINARIOS {
        INTEGER id_veterinario PK
        INTEGER id_especialidade FK
        VARCHAR nome
        VARCHAR crmv UK
        VARCHAR telefone
        VARCHAR email UK
    }

    CONSULTAS {
        INTEGER id_consulta PK
        INTEGER id_animal FK
        INTEGER id_veterinario FK
        TIMESTAMP data_hora
        TEXT motivo
        TEXT observacoes
    }

    TRATAMENTOS {
        INTEGER id_tratamento PK
        INTEGER id_consulta FK
        VARCHAR descricao
        DATE data_inicio
        DATE data_fim
    }

    MEDICAMENTOS {
        INTEGER id_medicamento PK
        VARCHAR nome UK
        VARCHAR fabricante
        VARCHAR dosagem
    }

    PRESCRICOES {
        INTEGER id_prescricao PK
        INTEGER id_tratamento FK
        INTEGER id_medicamento FK
        VARCHAR dosagem
        VARCHAR frequencia
        INTEGER duracao_dias
    }

    VACINAS {
        INTEGER id_vacina PK
        VARCHAR nome UK
        TEXT descricao
        INTEGER intervalo_dias
    }

    VACINACOES {
        INTEGER id_vacinacao PK
        INTEGER id_animal FK
        INTEGER id_vacina FK
        DATE data_aplicacao
        DATE proxima_dose
    }
