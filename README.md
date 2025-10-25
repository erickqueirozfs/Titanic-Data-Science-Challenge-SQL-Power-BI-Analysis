# 🚢 Titanic Data Science Challenge – SQL & Power BI Analysis

## Sobre o Projeto

Este repositório apresenta uma série de desafios analíticos realizados com o dataset clássico do Titanic. O foco está em mostrar como aplicar conceitos de banco de dados relacional e ciência de dados para explorar, entender e visualizar dados reais de maneira didática e profissional.

**Ferramentas utilizadas:**
- MySQL (importação, análise e queries SQL)
- Power BI Desktop (visualização e dashboards)
- Python/Power Query (tratamento e enriquecimento de dados)
- Dataset: [Titanic - Kaggle](https://www.kaggle.com/c/titanic/data)

***

## Estrutura do Repositório

```
/dados/                  # Contém o CSV do Titanic para importação
/scripts_sql/            # Queries e scripts SQL do desafio
/powerbi/                # PBIX e imagens dos dashboards
README.md                # Este arquivo, apresentando o projeto
```

***

## Desafios Analíticos Propostos

> Cada desafio possui um script SQL e visualização recomendada (imagem ou link .PBIX):

1. **Análise Básica de Sobrevivência**
   - Quantidade de sobreviventes e não sobreviventes
   - Percentual geral de sobrevivência

2. **Sobrevivência por Gênero**
   - Taxa e comparação por sexo (male, female)

3. **Sobrevivência por Classe Social**
   - Comparação entre primeira, segunda e terceira classe

4. **Faixas Etárias**
   - Sobrevivência por faixa de idade (0–10, 11–20, etc.)

5. **Preço da Passagem**
   - Impacto da tarifa (Fare) em faixas: <10, 10–50, >50

6. **Porto de Embarque**
   - Taxa de sobrevivência por Embarked: C, Q, S

7. **Familiares a Bordo**
   - Relação entre presença de familiares e sobrevivência

8. **Extração e Análise de Títulos**
   - Análise por títulos (Mr, Mrs, Miss, etc) extraídos do Name

9. **Dados Faltantes**
   - Quantificação e sugestão de tratamento para valores nulos

10. **Combinações Avançadas**
    - Taxa de sobrevivência por sexo e classe social combinados

Imagens e scripts exemplares estão disponíveis nas pastas correspondentes.

***

## Exemplos de Visualização

### Painel Power BI

![Dashboard Titanic – Power BI](powerbi/titanic_dashboardões resumo
- Gráficos de sobrevivência por sexo, classe, idade
- Tabelas dinâmicas e filtros interativos

***

## Como Reproduzir a Análise

1. Clone o repositório e baixe os dados do [Kaggle Titanic](https://www.kaggle.com/c/titanic/data).
2. Crie a tabela MySQL e importe o CSV com o script fornecido.
3. Execute os scripts SQL disponíveis em `/scripts_sql/` para obter os relatórios de cada desafio.
4. Importe os dados no Power BI Desktop, conecte ao MySQL ou ao CSV, e utilize as queries para criar os visuais recomendados.
5. Use o arquivo PBIX exemplo ou as imagens para referência.

***

## Principais Resultados e Insights

- O gênero e a classe social foram fatores determinantes para a sobrevivência.
- Crianças e pessoas com tarifas mais altas tiveram maior taxa de sobrevivência.
- A presença de familiares e o porto de embarque também influenciaram os resultados, com nuances identificadas nos dashboards.

***

## Autor

**Erick Queiroz**  
Pessoa apaixonado pela tecnologia  
Programador Python  
Contato: [LinkedIn](https://www.linkedin.com/in/erick-queiroz-fernandes-910b36254)

***

## Licença

Este projeto está sob a licença MIT – fique à vontade para usar ou adaptar!
