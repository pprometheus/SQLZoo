
-- 1
SELECT name 
FROM world
WHERE population > ( SELECT population 
                     FROM world 
                     WHERE name = 'Russia')




-- 2
SELECT name 
FROM world
WHERE continent = 'Europe' AND
                   gdp/population > ( SELECT gdp/population 
                     FROM world 
                     WHERE name = 'United Kingdom')


-- 3
SELECT name,continent 
FROM world
WHERE continent IN (SELECT continent 
                    FROM world 
                    WHERE name IN ('Argentina','Australia'))

ORDER BY name

-- 4
SELECT name, population
FROM world
WHERE population >
      (SELECT population FROM world WHERE name = 'United Kingdom') AND population <
      (SELECT population FROM world WHERE name = 'Germany')

-- 5
SELECT name, CONCAT(ROUND( population/ (SELECT population FROM world WHERE name ='Germany') * 100,0),"%") AS percentage
FROM world
WHERE continent = 'Europe'

-- 6
SELECT name 
FROM world 
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp>0)

-- 7
SELECT c.continent,c.name,c.area
FROM world c
WHERE c.area >= ALL (SELECT area 
                from world 
                 where continent = c.continent)

-- 8
SELECT continent, name
FROM world c
WHERE name = (SELECT  name FROM world where continent = c.continent order by NAME LIMIT 1) 

ORDER BY continent

-- 9
