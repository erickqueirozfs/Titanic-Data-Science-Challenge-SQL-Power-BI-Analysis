CREATE DATABASE titanic_db;

USE titanic_db;

CREATE TABLE passengers (
    PassengerId INT PRIMARY KEY,
    Survived BOOLEAN,
    Pclass INT,
    Name VARCHAR(100),
    Sex ENUM('male', 'female'),
    Age FLOAT,
    SibSp INT,
    Parch INT,
    Ticket VARCHAR(30),
    Fare DECIMAL(10,4),
    Cabin VARCHAR(20),
    Embarked CHAR(1)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Titanic-Dataset.csv'
INTO TABLE passengers
FIELDS TERMINATED BY ','      
ENCLOSED BY '"'                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(PassengerId,Survived,Pclass,Name,Sex,@Age,SibSp,Parch,Ticket,Fare,Cabin,Embarked)
set Age=(if(@Age="",0,@Age));

-- Análise Básica de Sobrevivência
select
if (survived = 0, "Não sobreviventes", "Sobreviventes") as sobreviventes,
    count(survived) as quantidade,
    round(count(survived)*100/(select count(survived) from passengers), 2) as porcentagem
from passengers
group by survived;

-- Sobrevivência por Gênero
SELECT 
  Sex AS sexo,
  COUNT(*) AS total_passageiros,
  SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS sobreviventes,
  ROUND(AVG(Survived) * 100, 2) AS taxa_sobrevivencia
FROM passengers
GROUP BY Sex;

-- Sobrevivência por Classe Social
SELECT 
  Pclass AS class,
  COUNT(*) AS total_passageiros,
  SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS sobreviventes,
  ROUND(AVG(Survived) * 100, 2) AS taxa_sobrevivencia
FROM passengers
GROUP BY Pclass
ORDER BY Pclass ASC;

   
    
-- Desafio 4 – Faixas Etárias e Sobrevivência

SELECT 
  CASE
    WHEN Age = 0 THEN 'Idade não informada'
    WHEN Age < 10 THEN '0–9'
    WHEN Age < 20 THEN '10–19'
    WHEN Age < 40 THEN '21–39'
    WHEN Age < 60 THEN '40–59'
    ELSE '60+'
  END AS faixa_etaria,

  COUNT(*) AS pessoas,
  SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS sobreviventes,
  ROUND(AVG(Survived) * 100, 2) AS taxa_sobrevivencia
FROM passengers
GROUP BY 
  CASE
    WHEN Age = 0 THEN 'Idade não informada'
    WHEN Age < 10 THEN '0–9'
    WHEN Age < 20 THEN '10–19'
    WHEN Age < 40 THEN '21–39'
    WHEN Age < 60 THEN '40–59'
    ELSE '60+'
  END
ORDER BY faixa_etaria ASC;

-- Desafio 5 – Impacto do Preço da Passagem
SELECT
  CASE
    WHEN fare >= 0 AND fare < 10 THEN '0-10'
    WHEN fare >= 10 AND fare < 50 THEN '10-50'
    WHEN fare >= 50 THEN '+50'
    ELSE 'Sem valor'
  END AS faixa,
  COUNT(*) AS quantidade,
  round(AVG(Survived) * 100,2) AS taxa_sobrevivencia
FROM passengers
GROUP BY faixa
ORDER BY
  CASE
    WHEN faixa = '0-10' THEN 1
    WHEN faixa = '10-50' THEN 2
    WHEN faixa = '+50' THEN 3
    ELSE 4
  END;
-- Desafio 6 – Análise do Porto de Embarque
SELECT * 
FROM passengers
WHERE Embarked IS NULL OR sua_coluna = '';

SELECT 
  CASE
    WHEN Embarked = 'S' THEN 'Southampton (S)'
    WHEN Embarked = 'C' THEN 'Cherbourg (C)'
    WHEN Embarked = 'Q' THEN 'Queenstown (Q)'
    ELSE 'Não informado'
  END AS embarcacao,

  COUNT(*) AS total_embarcados,
  SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS sobreviventes,
  ROUND(AVG(Survived) * 100, 2) AS taxa_sobrevivencia

FROM passengers
GROUP BY 
  CASE
    WHEN Embarked = 'S' THEN 'Southampton (S)'
    WHEN Embarked = 'C' THEN 'Cherbourg (C)'
    WHEN Embarked = 'Q' THEN 'Queenstown (Q)'
    ELSE 'Não informado'
  END
ORDER BY embarcacao;

-- Desafio 7 – Analisando Familiares a Bordo

select count(passengerID) from passengers where (SibSp + Parch) > 0;
SELECT
    CASE
        WHEN (SibSp + Parch) = 0 THEN '0 (sozinho)'
        WHEN (SibSp + Parch) = 1 THEN '1 familiar'
        ELSE '2 ou mais'
    END AS grupo_familiares,
    COUNT(*) AS total_passageiros,
    SUM(Survived) AS total_sobreviventes,
    ROUND(SUM(Survived) / COUNT(*) * 100, 2) AS taxa_sobrevivencia_percentual
FROM passengers
GROUP BY grupo_familiares
ORDER BY grupo_familiares;

-- Desafio 8 – Extração e Análise de Títulos
SELECT 
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Name, ',', -1), '.', 1)) AS titulo,
  COUNT(*) AS total_pessoas,
  SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS sobreviventes,
  ROUND(AVG(Survived) * 100, 2) AS taxa_sobrevivencia
FROM passengers
GROUP BY titulo
ORDER BY taxa_sobrevivencia DESC;


-- desafio 9
select "Age", count(*) as Quantidade from passengers where Age=0
union
select "Cabin", count(*) as faltam_cabin from passengers where Cabin=""
union
select "Embarked", count(*) as faltam_embarked from passengers WHERE Embarked NOT IN ('S', 'Q', 'C');

-- Desafio 10 – Combinações Avançadas
SELECT 
  Sex AS sexo,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Name, ',', -1), '.', 1)) AS titulo,
  COUNT(*) AS total_pessoas,
  SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS sobreviventes,
  ROUND(AVG(Survived) * 100, 2) AS taxa_sobrevivencia
FROM passengers
GROUP BY sexo, titulo
ORDER BY taxa_sobrevivencia DESC;

