#1. What are the names of the players whose salary is greater than 100,000?
select player_name from players
where salary > 100000;

#2. What is the team name of the player with player_id = 3?
select p.player_name, p.team_id,t.team_name from players p
inner join teams t
on t.team_id=p.team_id
where p.player_id=3;

#3. What is the total number of players in each team?

select t.team_name, count(p.player_name) as total_players from players p
inner join teams t
on t.team_id=p.team_id
group by t.team_name;


#5. What are the player names and their roles in the team with team_id = 1?

select p.player_id , p.player_name , t.team_name,p.role 
from players p
inner join teams t
on t.team_id=p.team_id
where p.team_id=1;

#6. What are the team names and the number of matches they have won?
select t.team_name,count(m.winner_id)
from teams t
inner join matches m
on t.team_id=m.winner_id
group by t.team_name;

#7. What is the average salary of players in the teams with country 'USA'?

select avg(p.salary) as avg_salary_of_usa_player
from players p
inner join teams t
on t.team_id=p.team_id
where t.country="USA";

#8. Which team won the most matches?
select t.team_name,count(m.winner_id)
from teams t
inner join matches m
on t.team_id=m.winner_id
group by t.team_name
order by count(m.winner_id) desc
limit 1;


#9. What are the team names and the number of players in each team whose salary is greater than 100,000?

select p.player_name,t.team_name from players p
inner join teams t
on t.team_id=p.team_id
where p.salary>=100000;

#10. What is the date and the score of the match with match_id = 3?

select match_date, score_team1, score_team2,(score_team1 + score_team2) as total_score
from matches
where match_id=3;