# Desafio de Projeto: Star Schema - Análise de Professores

Este projeto consiste na criação de um **Modelo Dimensional (Star Schema)** focado na análise de dados de professores de uma instituição de ensino. O objetivo principal foi isolar os dados pertinentes ao corpo docente e estruturar o ambiente para futuras consultas analíticas (Data Warehouse).

## 📌 Contexto do Desafio
A partir de um modelo relacional bruto e com base nas diretrizes do desafio, foram aplicadas as seguintes regras de negócio e modelagem:
- **Foco Absoluto no Professor:** Dados de alunos foram totalmente desconsiderados.
- **Criação da Dimensão Tempo:** Uma tabela dimensional de datas foi estruturada do zero para viabilizar análises temporais (ano, semestre, mês), visto que o modelo original carecia dessa informação.
- **Uso de Chaves Substitutas (Surrogate Keys):** Todas as dimensões utilizam chaves `sk_` auto-incrementadas para proteger o histórico dos dados frente a alterações nos sistemas de origem.

## 📐 Estrutura do Modelo (Esquema em Estrela)

Aqui está o diagrama gerado através do MySQL Workbench:

![Diagrama do Star Schema](<img width="897" height="568" alt="Star Schema" src="https://github.com/user-attachments/assets/b48f947b-1af7-4daf-859b-dba8f6a76888" />
)

*(Substitua o texto "NOME_DA_SUA_IMAGEM.png" acima pelo nome exato do arquivo de imagem que você subiu, por exemplo: image_2rS_zG.png)*

### Tabelas Criadas:
- **Fato_Lecionada:** Tabela central que consolida as chaves das dimensões e armazena as métricas numéricas `Carga_Horaria_Ministrada` e `Quantidade_Turmas`.
- **Dim_Professor:** Atributos dos docentes (Nome, Titulação).
- **Dim_Departamento:** Dados organizacionais (Nome do departamento, Campus).
- **Dim_Disciplina:** Informações sobre as matérias ofertadas.
- **Dim_Curso:** Cursos vinculados às disciplinas lecionadas.
- **Dim_Tempo:** Inteligência de tempo para cruzamento cronológico.

## 🛠️ Tecnologias Utilizadas
- **MySQL Workbench** (Modelagem Visual EER)
- **MySQL Server** (Banco de Dados Local)

