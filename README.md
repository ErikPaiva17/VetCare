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
    ANIMAIS ||--o{ CONSULTAS : recebe
    VETERINARIOS ||--o{ CONSULTAS : realiza
    CONSULTAS ||--o{ TRATAMENTOS : possui
    TRATAMENTOS ||--o{ TRATAMENTOS_MEDICAMENTOS : utiliza
    MEDICAMENTOS ||--o{ TRATAMENTOS_MEDICAMENTOS : participa
    ANIMAIS ||--o{ ANIMAIS_VACINAS : recebe
    VACINAS ||--o{ ANIMAIS_VACINAS : aplicada

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
        DATE data_aplicacao PK
        DATE proxima_dose
    }
