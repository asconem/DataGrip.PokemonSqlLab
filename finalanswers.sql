PART 2:
What are all the types of pokemon that a pokemon can have?
SELECT * FROM types;

What is the name of the pokemon with id 45?
SELECT * FROM pokemons WHERE id = '45';

How many pokemon are there?
SELECT COUNT (*) FROM pokemons;

How many types are there?
SELECT DISTINCT COUNT (*) FROM types;

How many pokemon have a secondary type?
SELECT COUNT (*) FROM pokemons WHERE secondary_type IS NOT NULL;

--------------------------------------------------------------
PART 3:
What is each pokemon's primary type?
SELECT pokemons.name, types.name FROM pokemons JOIN types ON pokemons.primary_type = types.id;

What is Rufflet's secondary type?
pokemons.name, types.name FROM pokemons JOIN types ON pokemons.secondary_type = types.id WHERE pokemons.name = 'Rufflet';

What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT pokemons.name, pokemon_trainer.trainerID FROM pokemons JOIN pokemon_trainer ON pokemons.id = pokemon_trainer.pokemon_id WHERE pokemon_trainer.trainerID = '303';

How many pokemon have a secondary type Poison?
SELECT pokemons.name, types.name FROM pokemons JOIN types ON pokemons.secondary_type = types.id WHERE types.name  = 'Poison';

What are all the primary types and how many pokemon have that type?
SELECT COUNT (pokemons.name), types.name FROM pokemons JOIN types ON pokemons.primary_type = types.id GROUP BY types.name ORDER BY count DESC;

How many pokemon at level 100 does each trainer with at least one level 100 pokemone have?
SELECT COUNT (pokemon_trainer.pokemon_id) FROM pokemon_trainer  WHERE pokelevel >= 100 GROUP BY trainerID;

How many pokemon only belong to one trainer and no other?
SELECT DISTINCT pokemon_id,
COUNT(*) FROM pokemon_trainer
GROUP BY pokemon_id HAVING count(*) = 1;
-----------------------------------------------------
PART 4

SELECT (hp+attack+defense+speed) /4 AS Strength,
pokemons.name AS Pokemon_Name,
trainers.trainername AS Trainer_Name,
pokemon_trainer.pokelevel AS Level,
t.name as Primary_Type,
st.name AS Secondary_Type
FROM pokemon_trainer
JOIN pokemons ON pokemon_trainer.pokemon_id=pokemons.id
JOIN trainers ON pokemon_trainer.trainerid=trainers.trainerid
RIGHT JOIN types as t ON pokemons.primary_type=t.id
LEFT JOIN types as st ON pokemons.secondary_type=st.id
ORDER BY Strength DESC;

I decided to take the average of four categories (hp, attack, defense, and speed) and derive the average from thos categories.
I decided to label this metric as "Strength."
I declined to include special attack or special defense in this metric because those are one-off attacks or defense maneuvers.
I don't believe they represent the true underlying measurement of a pokemon's non-special-case abilities.
