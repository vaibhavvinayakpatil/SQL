#1. Write a query in SQL to find the number of venues for EURO cup 2016. (soccer_venue)
select count(*) as Number_of_venue from soccer_venue; 

#2.Write a query in SQL to find the number countries participated in the EURO cup 2016. (player_mast) 
select count(distinct(team_id)) as Participated_country from player_mast;  

#3. Write a query in SQL to find the number goals scored in EURO cup 2016 within normal play schedule.(goal_details)
select count(*) as Number_goal from goal_details 
where goal_schedule = 'NT';  
 
#4.Write a query in SQL to find the number of matches ended with a result. (match_mast) 
select count(*) as Macth_end_with_result from match_mast where results  = 'Win'; 

#5. Write a query in SQL to find the number of matches ended with draws. (match_mast)
select count(*) as number_of_draw_match from match_mast where results = 'Draw'; 

#6. Write a query in SQL to find the date when did Football EURO cup 2016 begin.(match_mast)  
# There are two type to solve this question 
select min(play_date) as First_match from match_mast; 
select play_date as first_match from match_mast order by play_date limit 1; 

#7. Write a query in SQL to find the number of self-goals scored in EURO cup 2016.( goal_details) 
select count(goal_id) as Count_of_own_goal from goal_details where goal_type = 'O';

#8. Write a query in SQL to count the number of matches ended with a results in group stage. (match_mast) 
select count(Match_no) as Number_of_macth_ended_in_Group_stage from match_mast where play_stage = 'G';   

#9. Write a query in SQL to find the number of matches got a result by penalty shootout. (Match_mast) 
#There exists two table which can be used to solve this question match_mast and Penalty_shootOut
select count(*) as Number_of_match_decided_by_Penalty from Match_mast where decided_by = 'P';
select count(distinct(match_no)) as Number_of_match_decided_by_Penalty from penalty_shootout; 

#10.Write a query in SQL to find the number of matches were decided on penalties in the Round of 16 (match_mast) 
select count(*)as No_Decided_by_Penalty_In_round_16 from match_mast where play_stage = 'R' and decided_by = 'P'; 

#11.Write a query in SQL to find the number of goal scored in every match within normal play schedule.(goal_details) 
select Match_no, count(distinct(goal_id)) as Number_of_goal_in_Normal_play from goal_details where goal_schedule = 'NT' group by match_no; 

#12.Write a query in SQL to find the match no, date of play, and goal scored for that match in which no stoppage time have been added in 1st half of play. (match_mast) 
select match_no, play_date, goal_score from match_mast where stop1_sec = '0'; 

#13. Write a query in SQL to find the number of matches ending with a goalless draw in group stage of play. (match_details) 
select count(*) as Number_of_draw_match from match_details where goal_score = '0';

#14. Write a query in SQL to find the number of matches ending with only one goal win except those matches which was decided by penalty shootout.(match_details) 
select count(id) as number_of_match_with_1_goal_and_without_penlaty from match_details where goal_score = '1'and  decided_by != 'P'; 

#15. Write a query in SQL to find the total number of players replaced in the tournament. (player_in_out) 
select count(*) as player from player_in_out where in_out = 'I';
 
#16.. Write a query in SQL to find the total number of palyers replaced within normal time of play.(player_in_out) 
select count(*) as replaced_player_in_normal_time from player_in_out where play_schedule = 'NT'; 

#17.Write a query in SQL to find the number of players replaced in the stoppage time. (player_in_out) 
select count(*) as player_change_in_stop_time from player_in_out where play_schedule = 'ST'; 

#18. Write a query in SQL to find the total number of players replaced in the first half of play. (player_in_out)
#add substring numbre of player replaced in first half is
select  count(*) as No_player from player_in_out where play_half = '1';  

#19.Write a query in SQL to find the total number of goalless draws have there in the entire tournament. (match_details) 
SELECT COUNT(Id) as No_of_goalless_match FROM match_details WHERE win_lose='D' AND goal_score=0; 

#20.Write a query in SQL to fine the total number of players replaced in the extra time of play. (player_in_out) 
SELECT	COUNT(*) as number_of_player FROM player_in_out WHERE play_schedule = 'ET'  AND in_out = 'I';

#21. Write a query in SQL to compute a list to show the number of substitute happened in various stage of play for the entire tournament. (player_in_out)
SELECT play_half, play_schedule, COUNT(*) as Number_of_player FROM player_in_out WHERE in_out = 'I' GROUP BY play_half, play_schedule ORDER BY play_half, play_schedule; 

#22. Write a query in SQL to find the number of shots taken in penalty shootout matches.(penalty_shootout)
SELECT COUNT(*) as 'Number of Penalty Kicks' FROM penalty_shootout; 

#23.Write a query in SQL to find the number of shots socred goal in penalty shootout matches. (penalty_shootout) 
SELECT COUNT(score_goal) as Number_of_goal FROM penalty_shootout WHERE score_goal = 'Y' ;

#24.Write a query in SQL to find the number of shots missed or saved in penalty shootout matches. (penalty_shootout) 
SELECT COUNT(*) 'Goal missed or saved by Penalty Kicks'FROM	penalty_shootout WHERE score_goal = 'N'; 

#25.Write a query in SQL to prepare a list of players with number of shots they taken in penalty shootout matches.   
SELECT a.country_name AS "Team",b.player_name, b.jersey_no, c.score_goal,c.kick_no
FROM penalty_shootout c INNER JOIN soccer_country a ON c.team_id = a.country_id
INNER JOIN player_mast b ON c.player_id = b.player_id;

#26.Write a query in SQL to find the number of penalty shots taken by the teams. (soccer_country, penalty_shootout) 
SELECT b.country_name, a.team_id, COUNT(a.kick_no) AS 'number of penalty shots taken by the teams'
FROM penalty_shootout a INNER JOIN soccer_country b ON a.team_id = b.country_id
GROUP BY a.team_id, b.country_name, b.country_id
ORDER BY b.country_id; 

#27.Write a query in SQL to find the number of booking happened in each half of play within normal play schedule. (player_booked)
SELECT play_half, COUNT(*) AS 'number of booking happened' FROM player_booked
WHERE play_schedule	='NT'GROUP BY play_half ORDER BY play_half;

#28.Write a query in SQL to find the number of booking happened in stoppage time. (player_booked)
SELECT COUNT(*) AS	'number of booking happened in stoppage time' FROM player_booked
WHERE play_schedule = 'ST' ;

#29.Write a query in SQL to find the number of booking happened in extra time. (player_booked)
SELECT COUNT(*) AS	'number of booking happened in stoppage time' FROM player_booked
WHERE play_schedule = 'ET';

#30.Write a query in SQL to find the name of the venue with city where the EURO cup 2016 final match was played. (soccer_venue, soccer_city, match_mast)
# Two ways by which we can solve this question
select  soccer_venue.venue_name,soccer_city.city from soccer_venue 
inner join soccer_city on soccer_city.city_id = soccer_venue.city_id 
where soccer_venue.venue_id = (select venue_id from match_mast where play_stage = 'F'); 

select  soccer_venue.venue_name,soccer_city.city from soccer_venue 
inner join soccer_city on soccer_city.city_id = soccer_venue.city_id 
inner join match_mast on soccer_venue.venue_id = match_mast.venue_id 
where match_mast.play_stage = 'F';

#31.Write a query in SQL to find the number of goal scored by each team in every match within normal play schedule. (match_details, soccer_country)
select soccer_country.country_name,sum(Match_details.goal_score) as Total_goal from soccer_country 
inner join match_details on soccer_country.country_id = match_details.Team_id 
where match_details.decided_by = 'N' group by soccer_country.country_name order by Total_goal; 

#32.Write a query in SQL to find the total number of goals scored by each player within normal play schedule and arrange the result set according to the heighest to lowest scorer also mention theire country.  (goal_details, player_mast, soccer_country)
select soccer_country.country_name, player_mast.player_name,count(goal_details.goal_id) as Total_goal from player_mast 
inner join goal_details on player_mast.player_id = goal_details.player_id 
inner join soccer_country on player_mast.team_id = soccer_country.country_id 
where goal_details.goal_schedule = 'NT' group by  player_mast.player_name,soccer_country.country_name order by Total_goal desc; 

#33.Write a query in SQL to find the highest individual scorer in EURO cup 2016.  (goal_details, player_mast) 
select  player_mast.player_name,count(goal_id) as No_of_goal from goal_details 
inner join player_mast on player_mast.player_id = goal_details.player_id
group by player_mast.player_name order by count(goal_id) desc limit 1;  

#34.Write a query in SQL to find the country where Football EURO cup 2016 held. (soccer_country, soccer_city, soccer_venue) 
select country_name as Host_nation from soccer_country where country_id = (select distinct country_id from soccer_city); 

#35.Write a query in SQL to find the player who socred first goal of EURO cup 2016.  (soccer_country, player_mast, goal_details) 
#The query will retrive data of first goal of tournament but due to lack of data it is empty.
select player_mast.player_name from player_mast 
inner join goal_details on player_mast.player_id = goal_details.player_id
where player_mast.player_id = (select player_id from goal_details where
 match_no = (select min(match_no) from goal_details) and goal_time = (select min(goal_time) from goal_details)); 
 
#36.Write a query in SQL to find the name and country of the referee who managed the opening match (soccer_country, match_mast, referee_mast)
select referee_mast.ass_ref_name, soccer_country.country_name from referee_mast 
inner join soccer_country on soccer_country.country_id = referee_mast.country_id 
inner join match_mast on match_mast.referee_id = referee_mast.ass_ref_id
where match_mast.match_no = 1;  

#37.Write a query in SQL to find the name and country of the referee who managed the final match. (soccer_country, match_mast, referee_mast)
select referee_mast.ass_ref_name, soccer_country.country_name from referee_mast 
inner join soccer_country on soccer_country.country_id = referee_mast.country_id 
inner join match_mast on match_mast.referee_id = referee_mast.ass_ref_id
where match_mast.play_stage = 'F';  

#38.Write a query in SQL to find the city where the opening match of EURO cup 2016 played.(soccer_venue, soccer_city, match_mast) 
select Soccer_city.city,Soccer_venue.venue_name from Soccer_city 
inner join soccer_venue on Soccer_city.city_id = Soccer_venue.city_id 
inner join match_mast on soccer_venue.venue_id = match_mast.venue_Id 
where match_mast.play_stage = 'F'; 

#39. Write a query in SQL to find the stadium hosted the final match of EURO cup 2016 along with the capacity,and audance for that match.  (soccer_venue, soccer_city, match_mast)
select soccer_venue.venue_name,soccer_venue.aud_capacity,match_mast.audence from soccer_venue 
inner join match_mast on soccer_venue.venue_id = match_mast.venue_id 
where match_mast.play_stage = 'F'; 

#40. Write a query in SQL to compute a report that contain the number of matches played in each venue along with their city.  (soccer_venue, soccer_city, match_mast)
select soccer_venue.venue_name,soccer_city.city,count(match_mast.match_no) as Number_of_match from soccer_venue 
inner join soccer_city on Soccer_city.city_id = Soccer_venue.city_id 
inner join match_mast on soccer_venue.venue_id = match_mast.venue_Id  
group by soccer_venue.venue_name,soccer_city.city
order by Number_of_match;

#41.Write a query in SQL to find the player who was the first player to be sent off at the tournament EURO cup 2016. (player_booked, player_mast, soccer_country)
select player_mast.player_name,soccer_country.country_name from player_mast
inner join soccer_country on soccer_country.country_id = player_mast.team_id 
inner join player_booked on player_booked.player_id = player_mast.player_id 
where player_booked.sent_off = 'Y'; 

#42.Write a query in SQL to find the teams that scored only one goal to the torunament.  (soccer_team, soccer_country)
select soccer_country.country_name as Team_score_only_goal from soccer_country 
inner join soccer_team on soccer_country.country_id = soccer_team.team_id 
where soccer_team.goal_agnst = 1; 

#43.Write a query in SQL to find the number of player not sent of when play schedule is normal by country. (soccer_country, player_booked) 
select soccer_country.country_name,count(player_booked.ID) as Number_player from soccer_country
inner join player_booked on soccer_country.country_id = player_booked.team_id 
where not player_booked.sent_off = 'Y' and player_booked.play_schedule = 'NT'
group by soccer_country.country_name;

#44. Write a query in SQL to find the venue with number of goals that has seen. (goal_details, match_mast, soccer_venue)
SELECT venue_name, count(venue_name) as Number_goal FROM goal_details
inner JOIN soccer_country ON goal_details.team_id=soccer_country.country_id
inner JOIN match_mast ON goal_details.match_no=match_mast.match_no
inner JOIN soccer_venue ON match_mast.venue_id=soccer_venue.venue_id
GROUP BY venue_name
ORDER BY COUNT(venue_name) DESC;

#45.Write a query in SQL to find the match where no stoppage time added in 1st half of play.(match_details, match_mast, soccer_country)
select soccer_country.country_name as Teams_without_stopage from match_details
inner join soccer_country on match_details.team_id = soccer_country.country_id 
inner join match_mast on match_mast.match_no = match_details.match_no
where match_mast.stop1_sec = 0;
 
 #46.Write a query in SQL to find the team(s) who conceded the most goals in EURO cup 2016. (soccer_team, soccer_country)
 select soccer_country.country_name as Team_conceded_most_goal from soccer_country 
 inner join soccer_team on soccer_country.country_id = soccer_team.team_id 
 where soccer_team.goal_for = (select max(soccer_team.goal_for) from soccer_team); 
 
 #47.Write a query in SQL to find the match where highest stoppege time added in 2nd half of play. (match_details, match_mast, soccer_country)
 select soccer_country.country_name as Team_names from soccer_country 
 inner join match_details on soccer_country.country_id = match_details.Team_id 
 inner join match_mast on match_mast.match_no = match_details.match_no 
 where match_mast.stop2_sec = (select max(match_mast.stop2_sec) from match_mast); 
 
 #48.Write a query in SQL to find the list of teams ending with a goalless draw in group stage of play. (match_details, soccer_country)
SELECT DISTINCT soccer_country.country_name AS Team_names
FROM soccer_country
INNER JOIN match_details ON soccer_country.country_id = match_details.team_id
WHERE match_details.goal_score = 0 and match_details.win_lose = 'D' ;

#49.Write a query in SQL to find the match no. and the teams played in that match where the 2nd highest stoppage time had been added in the 2nd half of play (match_mast, match_details, soccer_country)
 select match_details.match_no,soccer_country.country_name as Team_names from soccer_country 
 inner join match_details on soccer_country.country_id = match_details.Team_id 
 inner join match_mast on match_mast.match_no = match_details.match_no 
 where match_mast.stop2_sec = (select match_mast.stop2_sec from match_mast order by stop2_sec desc limit 1 offset 1);
 
#50.Write a query in SQL to find the player and his team and how many matches he kept goal for his team.  (player_mast, match_details, soccer_country)
select player_mast.player_name,count(match_details.player_gk) from player_mast 
inner join match_details on match_details.player_gk = player_mast.player_id 
group by player_mast.player_name; 

#51. Write a query in SQL to find the venue that has seen the most goals.  (goal_details, soccer_country, match_mast, soccer_venue)
SELECT soccer_venue.venue_name, SUM(match_details.goal_score) AS total_goals_scored FROM match_mast
INNER JOIN match_details ON match_mast.match_no = match_details.match_no
inner join soccer_venue on soccer_venue.venue_id = match_mast.venue_id
GROUP BY soccer_venue.venue_name
ORDER BY total_goals_scored DESC
LIMIT 1;

#52. Write a query in SQL to find country and oldest player to have appeared in a EURO cup 2016 match. (player_mast, soccer_country)
select player_mast.player_name,soccer_country.country_name from player_mast 
inner join soccer_country on player_mast.team_id = soccer_country.country_id 
where player_mast.dt_of_bir = (select max(player_mast.dt_of_bir) from player_mast);

#53.Write a query in SQL to find those two teams which scored three goals in a single game at this tournament.
select  distinct soccer_country.country_name from soccer_country 
inner join match_details on soccer_country.country_id = match_details.team_id 
where match_details.goal_score = 3 and match_details.win_lose = 'D';

#54. Write a query in SQL to find the teams with other information that finished bottom of their respective groups in three games.(soccer_team, soccer_country) 
select * from soccer_country 
inner join soccer_team on  soccer_country.country_id = soccer_team.team_id 
where soccer_team.group_position = (select max(group_position) from soccer_team) 
order by team_group;

#55. Write a query in SQL to find those three players with other information, who contracted to Lyon participated in the EURO cup 2016 Finals.(player_mast, soccer_country, match_details)
#answer may differ due to lack of data
select player_mast.player_name as contarcted_player from player_mast 
inner join soccer_country on player_mast.team_id = soccer_country.country_id 
inner join match_details on match_details.team_id = player_mast.team_id 
where  match_details.play_stage = 'F' and  player_mast.playing_club = 'Lyon' ;

#56.Write a query in SQL to find the final four teams in the tournament. (soccer_country, match_details)
select soccer_country.country_name as semifinalist from soccer_country 
inner join match_details on soccer_country.country_id = match_details.team_id 
where match_details.play_stage = 'S'; 

#57. Write a query in SQL to find the captains for the top four teams in the semifinals in the tournament. (soccer_country, match_captain, player_mast)
#answer may differ due to lack of data
select player_mast.player_name, soccer_country.country_name from soccer_country 
inner join match_captain on soccer_country.country_id = match_captain.team_id 
inner join player_mast on player_mast.player_id = match_captain.player_captain
where match_no IN(48,49); 

#58. Write a query in SQL to find the captains with other information for all the matches in the tournament.  (soccer_country, match_captain, player_mast
select  * from player_mast 
inner join match_captain on player_mast.player_id = match_captain.player_captain 
inner join soccer_country on soccer_country.country_id  = match_captain.team_id;

#59. Write a query in SQL to find the captain and goal keeper with other information for all the matches for all the team.  (soccer_country, match_captain, match_details, player_mast)
SELECT distinct a.match_no,c.player_name as "Captain", d.player_name as "Goal Keeper",e.country_name FROM match_captain a
inner join match_details b
inner JOIN soccer_country e ON b.team_id=e.country_id
inner JOIN player_mast c ON a.player_captain=c.player_id
inner JOIN player_mast d ON b.player_gk=d.player_id order by a.match_no;

#60.Write a query in SQL to find the player who was selected for the Man of the Match Award in the finals of EURO cup 2016.  (soccer_country, match_mast, player_mast)
#answer may differ due to lack of data
select player_mast.player_name from player_mast
inner join soccer_country on soccer_country.country_id = player_mast.team_id  
inner join match_mast on match_mast.plr_of_match = player_mast. player_id
where match_mast.play_stage = 'F'; 

#61. Write a query in SQL to find the substitute players who came into the field in the first half of play within normal play schedule.(player_in_out, player_mast, soccer_country)
select player_mast.player_name,soccer_country.country_name from player_mast 
inner join player_in_out on player_mast.player_id = player_in_out.player_id 
inner join soccer_country on soccer_country.country_id = player_mast.team_id 
where player_in_out.play_half = 1 and player_in_out.in_out = 'I' and player_in_out.play_schedule = 'NT';  

#62. Write a query in SQL to prepare a list for the player of the match against each match.  (match_mast, player_mast, soccer_country)
select player_mast.player_name,soccer_country.country_name from player_mast
inner join match_mast on player_mast.player_id = match_mast.plr_of_match 
inner join soccer_country on soccer_country.country_id = player_mast.team_id; 

#63. Write a query in SQL to find the player along with his country who taken the penalty shot number 26
select player_mast.player_name,soccer_country.country_name from player_mast 
inner join soccer_country on soccer_country.country_id = player_mast.team_id 
inner join penalty_shootout on penalty_shootout.player_id = player_mast.player_id
where penalty_shootout.kick_id = 26;

#64.Write a query in SQL to find the team against which the penalty shot number 26 had been taken.(penalty_shootout, soccer_country)
select distinct soccer_country.country_name, penalty_shootout.match_no from soccer_country 
inner join penalty_shootout on penalty_shootout.team_id = soccer_country.country_id 
where penalty_shootout.match_no = (select penalty_shootout.match_no from penalty_shootout where penalty_shootout.kick_id = 26) 
AND country_name<>(SELECT country_name FROM soccer_country WHERE country_id= (SELECT team_id FROM penalty_shootout WHERE kick_id=26)); 

#65.Write a query in SQL to find the captain who was also the goalkeeper 
select player_mast.player_name as Captain,soccer_country.country_name from player_mast
inner join soccer_country on soccer_country.country_id = player_mast.team_id  
inner join match_captain on match_captain.player_captain = player_mast.player_id 
where player_mast.posi_to_play = 'GK'; 

#66.Write a query in SQL to find the players along with their team booked number of times in the tournament. Show the result according to the team and number of times booked in descending order.
select  player_mast.player_name,soccer_country.country_name,count(player_booked.player_id) as Number_od_times_player_booked from player_mast
inner join soccer_country on soccer_country.country_id = player_mast.team_id 
inner join player_booked on player_booked.player_id  = player_mast.player_id
group by player_mast.player_name,soccer_country.country_name 
order by Number_od_times_player_booked;

#67. Write a query in SQL to find the players who booked most number of times.
SELECT pm.player_name,sc.country_name,COUNT(pb.player_id) AS Number_of_times_player_booked FROM player_mast pm
INNER JOIN soccer_country sc ON sc.country_id = pm.team_id
INNER JOIN player_booked pb ON pb.player_id = pm.player_id
GROUP BY pm.player_name, sc.country_name
HAVING COUNT(pb.player_id) = (SELECT MAX(count) FROM (SELECT COUNT(player_id) AS count FROM player_booked group by player_id) as Number)
ORDER BY Number_of_times_player_booked; 
 
#68.Write a query in SQL to find the number of players booked for each team.
select soccer_country.country_name,count(player_booked.team_id) as Number_of_player_booked from soccer_country 
inner join player_booked on soccer_country.country_id = player_booked.team_id 
group by soccer_country.country_name 
order by country_name;

#69.Write a query in SQL to find the most number of cards shown in the matches. 
select match_no,count(booking_time) as number_of_booking from player_booked 
group by match_no
having count(booking_time) = (select max(booking) from (select count(booking_time) as booking from player_booked group by match_no) as number);

#70.Write a query in SQL to list the name of assistant referees with their countries for each matches. 
SELECT match_details.match_no, asst_referee_mast.ass_ref_name, soccer_country.country_name FROM match_details
INNER JOIN soccer_country ON soccer_country.country_id = match_details.team_id
INNER JOIN asst_referee_mast ON match_details.ass_ref = asst_referee_mast.ass_ref_id;

#71.Write a query in SQL to find the assistant referees of each countries assists the number of matches. 
SELECT soccer_country.country_name, count( match_details.ass_ref) as Number_of_referee FROM match_details
INNER JOIN soccer_country ON soccer_country.country_id = match_details.team_id
INNER JOIN asst_referee_mast ON match_details.ass_ref = asst_referee_mast.ass_ref_id 
group by soccer_country.country_name
order by Number_of_referee desc; 

#72. Write a query in SQL to find the countries from where the assistant referees assist most of the matches.
SELECT soccer_country.country_name, count(match_details.ass_ref) as Number_of_referee FROM match_details
INNER JOIN soccer_country ON soccer_country.country_id = match_details.team_id
INNER JOIN asst_referee_mast ON match_details.ass_ref = asst_referee_mast.ass_ref_id 
GROUP BY soccer_country.country_name
HAVING count(match_details.ass_ref) = (SELECT MAX(details) FROM(SELECT count(match_details.ass_ref) as details FROM match_details INNER JOIN soccer_country ON soccer_country.country_id = match_details.team_id INNER JOIN asst_referee_mast ON match_details.ass_ref = asst_referee_mast.ass_ref_id 
GROUP BY soccer_country.country_name) as matches); 

#73. Write a query in SQL to list the name of referees with their countries for each match.  (match_mast, referee_mast, soccer_country)
select match_mast.match_no, referee_mast.referee_name,soccer_country_country_name from match_mast 
inner join referee_mast on referee_mast.referee_id  = match_mast.referee_id 
inner join soccer_country on soccer_country.country_id  = referee_mast.country_id
ORDER BY match_mast.match_no; 

#74.Write a query in SQL to find the referees of each country managed number of matches. 
select soccer_country.country_name,count(match_mast.referee_id) as Number_of_referee from match_mast
inner join referee_mast on referee_mast.referee_id  = match_mast.referee_id 
inner join soccer_country on soccer_country.country_id  = referee_mast.country_id
group by soccer_country.country_name
ORDER BY Number_of_referee ;

#75. Write a query in SQL to find the countries from where the referees managed most of the matches 
#two ways to solve this problem
select soccer_country.country_name,count(match_mast.referee_id) as Number_of_referee from match_mast
inner join referee_mast on referee_mast.referee_id  = match_mast.referee_id 
inner join soccer_country on soccer_country.country_id  = referee_mast.country_id
group by soccer_country.country_name
having count(match_mast.referee_id) = (select max(referee) from (select count(match_mast.referee_id) as Referee from match_mast
inner join referee_mast on referee_mast.referee_id  = match_mast.referee_id 
inner join soccer_country on soccer_country.country_id  = referee_mast.country_id group by soccer_country.country_name) as Number) 
ORDER BY Number_of_referee;

select soccer_country.country_name,count(match_mast.referee_id) as Number_of_referee from match_mast
inner join referee_mast on referee_mast.referee_id  = match_mast.referee_id 
inner join soccer_country on soccer_country.country_id  = referee_mast.country_id
group by soccer_country.country_name
ORDER BY Number_of_referee desc limit 1;

#76.Write a query in SQL to find the referees managed the number of matches.
select referee_mast.referee_name ,count(match_mast.referee_id) as Number_of_referee from match_mast
inner join referee_mast on referee_mast.referee_id  = match_mast.referee_id 
inner join soccer_country on soccer_country.country_id  = referee_mast.country_id
group by referee_mast.referee_name
ORDER BY Number_of_referee;

#77.Write a query in SQL to find those referees who managed most of the match.
select referee_mast.referee_name,count(match_mast.referee_id) as Worked_as_referee from match_mast
inner join referee_mast on match_mast.referee_id = referee_mast.referee_id 
inner join soccer_country on referee_mast.country_id = soccer_country.country_id 
group by referee_mast.referee_name 
having count(match_mast.referee_id) = (select max(referee) from (select count(match_mast.referee_id) as referee from match_mast 
inner join referee_mast on match_mast.referee_id = referee_mast.referee_id
inner join soccer_country on referee_mast.country_id = soccer_country.country_id group by referee_mast.referee_name) as Number);

#78.Write a query in SQL to find the referees managed the number of matches in each venue.
SELECT referee_mast.referee_name,soccer_country.country_name,soccer_venue.venue_name,count(match_mast.match_no) FROM match_mast 
JOIN referee_mast  ON match_mast.referee_id=referee_mast.referee_id
JOIN soccer_country  ON referee_mast.country_id=soccer_country.country_id
JOIN soccer_venue  ON  match_mast.venue_id=soccer_venue.venue_id
GROUP BY referee_mast.referee_name,country_name,venue_name
ORDER BY referee_name;

#79.Write a query in SQL to find the referees and number of booked he made.
SELECT c.referee_name,count(b.match_no)
FROM player_booked a
Inner JOIN match_mast b ON a.match_no=b.match_no
inner JOIN referee_mast c ON b.referee_id=c.referee_id
GROUP BY referee_name
ORDER BY count(b.match_no) DESC;

#80 Write a SQL query to find those referees who booked the most number of players. Return referee name, number of matches.
SELECT c.referee_name,count(b.match_no)FROM player_booked a
JOIN match_mast b ON a.match_no=b.match_no
JOIN referee_mast c ON b.referee_id=c.referee_id
GROUP BY referee_name
HAVING count(b.match_no)=(SELECT max(mm) FROM (SELECT count(b.match_no) mm FROM player_booked a
JOIN match_mast b ON a.match_no=b.match_no JOIN referee_mast c ON b.referee_id=c.referee_id GROUP BY referee_name) number);

#81. Write a query in SQL to find the player of each team who wear jersey number 10.
select player_mast.player_name from player_mast
inner join soccer_country on soccer_country.country_id = player_mast.team_id
where player_mast.jersey_no = 10; 

#82.Write a query in SQL to find the results of penalty shootout matches
select match_details.match_no,match_details.play_stage, soccer_country.country_name,match_details.penalty_score from  soccer_country
inner join match_details on   soccer_country.country_id = match_details.team_id 
where match_details.decided_by = 'P';

#83.Write a query in SQL to find the defender who scored goal for his team.  (goal_details, player_mast, soccer_country)
select player_mast.player_name from player_mast
inner join goal_details on goal_details.player_id = player_mast.player_id
inner join soccer_country on soccer_country.country_id = player_mast.team_id
where player_mast.posi_to_play = 'DF'
order by player_mast.player_name;

#84. Write a query in SQL to find the position of a player to play who scored own goal.(goal_details, player_mast, soccer_country)
SELECT player_name,jersey_no,country_name,age,posi_to_play,playing_club FROM goal_details a
JOIN player_mast b ON a.player_id=b.player_id
JOIN soccer_country c ON a.team_id=c.country_id
WHERE goal_type='O'
ORDER BY player_name;

#85. Write a query in SQL to find the goal scored by the players according to their playing position. (goal_details, player_mast, soccer_country)
select player_mast.posi_to_play, count(goal_details.player_id) as Number_goal_scored from player_mast
inner join goal_details on goal_details.player_id = player_mast.player_id
inner join soccer_country on soccer_country.country_id = player_mast.team_id
group by player_mast.posi_to_play;

#86. Write a query in SQL to find those players who came into the field in the most last time of play. 
select player_mast.player_name from player_mast
inner join player_in_out on player_in_out.player_id = player_mast.player_id
inner join soccer_country on soccer_country.country_id = player_mast.team_id
where player_in_out.in_out = 'I' and player_in_out.time_in_out = (select max(player_in_out.time_in_out) from  player_in_out); 

#87.Write a query in SQL to find the teams played the first match of EURO cup 2016. (match_details, soccer_country)
select country_name as First_match_played_between from soccer_country 
where country_id in (select team_id from match_details where match_no = 1); 

#88. Write a query in SQL to find the winner of EURO cup 2016. (soccer_country, match_details)
select country_name from soccer_country 
where country_id in (select team_id from match_details where play_stage = 'F');

#89.Write a query in SQL to find the match with match no, play stage, goal scored, and the audence which was the heighest audence match. (match_mast)
#two way to solve this problem
select match_no, play_stage, goal_score,audence from match_mast
where audence  = (select max(audence) from match_mast);

select match_no, play_stage, goal_score,audence from match_mast
order by audence desc limit 1;

#89.Write a query in SQL to find the match no in which Germany played against Poland (match_details, soccer_country)
select distinct A.match_no from match_details as A 
inner join match_details as B on A.match_no = B.match_no 
where (A.team_id = (select country_id from soccer_country where country_name = 'Germany')  and 
B.team_id = (select country_id from soccer_country where country_name = 'Poland'));

#90.Write a query in SQL to find the match no, play stage, date of match, number of gole scored, and the result of the match where Portugal played against Hungary. 
select A.match_no,A.play_stage,C.play_date,C.results,C.Goal_score from match_details as A 
inner join match_details as B on A.match_no = B.match_no 
inner join match_mast as C on A.match_no = C.match_no
where (A.team_id = (select country_id from soccer_country where country_name = 'Portugal')  and 
B.team_id = (select country_id from soccer_country where country_name = 'Hungary'));

#91.Write a query in SQL to display the list of players scored number of goals in every matches
select player_mast.player_name,count(goal_details.player_id) as Number_of_goal,soccer_country.country_name,goal_details.match_no from player_mast
inner join goal_details on goal_details.player_id = player_mast.player_id
inner join  soccer_country on  soccer_country.country_id = player_mast.team_id
group by goal_details.match_no,player_mast.player_name,soccer_country.country_name
order by goal_details.match_no;

#92.write a SQL query to find the highest audience match. Return country name of the teams.
#shows only single value due to lack of data and have two value
select distinct soccer_country.country_name from soccer_country 
inner join goal_details on soccer_country.country_id = goal_details.team_id
inner join match_mast on match_mast.match_no = goal_details.match_no 
where match_mast.match_no in (select match_mast.match_no from match_mast where match_mast.audence = (select max(match_mast.audence) from match_mast));

select distinct soccer_country.country_name from soccer_country 
inner join goal_details on soccer_country.country_id = goal_details.team_id
inner join match_mast on match_mast.match_no = goal_details.match_no 
where match_mast.audence = (select max(match_mast.audence) from match_mast);

#93.Write a query in SQL to find the 2nd highest stoppage time which had been added in 2nd half of play. 
#two ways to solve this query
select stop2_sec as 2nd_highest_stopage from match_mast
order by stop2_sec desc limit 1 offset 1;

select stop2_sec as 2nd_highest_stopage from match_mast where match_mast.stop2_sec = 
(select max(match_mast.stop2_sec) from match_mast where match_mast.stop2_sec <> (select max(match_mast.stop2_sec) from match_mast));

#94.Write a query in SQL to find the teams played the match where 2nd highest stoppage time had been added in 2nd half of play. (soccer_country, match_details, match_mast)
select soccer_country.country_name from soccer_country 
inner join match_details on soccer_country.country_id = match_details.team_id
where match_details.match_no = (select match_mast.match_no from match_mast where match_mast.stop2_sec = 
(select max(match_mast.stop2_sec) from match_mast where match_mast.stop2_sec <> (select max(match_mast.stop2_sec) from match_mast))); 

#95. Write a query in SQL to find the match no, date of play and the 2nd highest stoppage time which have been added in the 2nd half of play.(match_mast)
select match_no, play_date from match_mast
where stop2_sec = (select max(stop2_sec) from match_mast where stop2_sec <> (select max(stop2_sec) from match_mast)); 

#96.Write a query in SQL to find the club which supplied the most number of players to the 2016 EURO cup. (player_mast) 
select playing_club,count(playing_club) from player_mast
group by playing_club 
having count(playing_club) = (select max(club) from (select count(playing_club) as club from player_mast group by playing_club) as number) ;

#97. Write a query in SQL to find the player and his jersey number Who scored the first penalty of the tournament. (player_mast, goal_details)
select player_mast.player_name, player_mast.jersey_no from player_mast 
inner join goal_details on goal_details.player_id = player_mast.player_id
where goal_details.goal_id = (select min(goal_details.goal_id) from goal_details where Goal_details.goal_type = 'P');

SELECT player_mast.player_name, player_mast.jersey_no, goal_details. goal_id 
FROM player_mast
INNER JOIN goal_details ON goal_details.player_id = player_mast.player_id
WHERE goal_details.goal_type = 'P'   order by goal_id limit 1;

#98.Write a query in SQL to find the player who was the goalkeeper for Italy in penalty shootout against Germany in Football EURO cup 2016.
#answer may vary due to lack of data
select player_name from player_mast where player_id =  
(select player_gk from penalty_gk where team_id = 
(select team_id from penalty_gk where team_id in
(select country_id from soccer_country where country_name = 'Italy' or country_name = 'Germany') 
and
team_id = (select country_id from soccer_country where country_name = 'Italy')));

#99.Write a query in SQL to find the number of Germany scored at the tournament. (goal_details, soccer_country)
#There are two waysby which we solve this question 
select soccer_country.country_name,count(goal_details.team_id) as Total_goal from soccer_country
inner join goal_details on goal_details.team_id = soccer_country.country_id 
group by soccer_country.country_name 
having soccer_country.country_name = 'Germany';  

SELECT COUNT(player_id) as Goal_of_germany
FROM goal_details 
WHERE team_id=
(SELECT country_id FROM soccer_country WHERE country_name='Germany');

#100. Write a query in SQL to find the players along with their jersey no.,and playing club, who were the goalkeepers for the England squad for 2016 EURO cup
select player_name,jersey_no,playing_club from player_mast 
where team_id = (select country_id from soccer_country where country_name = 'England') and posi_to_play = 'GK';

#101.Write a query in SQL to find the players along with their jersey nor contract to Liverpool were in the Squad of England in 2016 EURO cup.  (player_mast, soccer_country)
select player_name,jersey_no,playing_club from player_mast 
where team_id = (select country_id from soccer_country where country_name = 'England') and playing_club = 'Liverpool';

#102. Write a query in SQL to find the player with other infromation Who scored the last goal in the 2nd semi final i.e. 50th match in EURO cub 2016.  (player_mast, goal_details, soccer_country)
select player_name from player_mast 
where player_id = (select player_id from goal_details where goal_time = (select max(goal_time) from goal_details where match_no = 50));

select player_name,goal_time,goal_half,country_name from player_mast 
inner join goal_details on goal_details.player_id = player_mast.player_id 
inner join soccer_country on soccer_country.country_id = player_mast.team_id 
where goal_details.goal_time = (select max(goal_details.goal_time) from goal_details where goal_details.match_no = 50);

#103.Write a query in SQL to find the player Who was the captain of the EURO cup 2016 winning team from Portugal. (player_mast, match_captain, match_details)
select player_name from player_mast 
where player_id = (select distinct player_captain from match_captain 
where team_id = ( select team_id from match_details where play_stage = 'F' and win_lose = 'W'));

#104.Write a query in SQL to find the number of players played for france in the final 
select count(player_id) +11 as number_of_player_played_for_france from player_in_out 
where match_no = (select match_no from match_mast where play_stage = 'F') and in_out = 'I' and 
team_id = (select country_id from soccer_country where country_name = 'France');

#105 Write a query in SQL to find the goalkeeper of the team Germany who didn't concede any goal in their group stage matches.  (player_mast, match_details, soccer_country)
select player_name from player_mast 
where player_id  = (select distinct player_gk from match_details where goal_score = 0 and 
team_id =(select country_id from soccer_country where country_name = 'Germany'));

#106. Write a query in SQL to find the runners-up in Football EURO cup 2016.  (match_details, soccer_country)
select country_name from soccer_country 
where country_id = (select team_id from match_details where play_stage = 'F' and win_lose = 'L');

#107.write a SQL query to find the maximum penalty shots taken by the teams. Return country name, maximum penalty shots.
select soccer_country.country_name,team_id,count(team_id) from penalty_shootout inner join soccer_country on penalty_shootout.team_id = soccer_country.country_id
group by team_id,soccer_country.country_name
having count(team_id) = (select max(team) from (select count(team_id) as team from penalty_shootout group by team_id) as number);

#108.Write a query in SQL to find the maximum number of penalty shots taken by the players.
select player_mast.player_name,count(penalty_shootout.player_id) from player_mast
inner join penalty_shootout on player_mast.player_id = penalty_shootout.player_id
group by player_mast.player_name
having count(penalty_shootout.player_id) = (select max(shots) from (select count(penalty_shootout.player_id) as shots 
from penalty_shootout group by penalty_shootout.player_id ) as number);

#109.write a SQL query to find the matches with the most penalty shots. 
select match_no from penalty_shootout 
group by match_no 
having count(penalty_shootout.player_id) = 
(select max(penalty) from (select count(penalty_shootout.player_id) as penalty from penalty_shootout group by match_no) as number);

#110. Write a query in SQL to find the match no. and teams who played the match where highest number of penalty shots had been taken.  (penalty_shootout)
select country_name as opponents from soccer_country where country_id in
(select distinct team_id from penalty_shootout where match_no in (select  match_no from penalty_shootout group by match_no 
having count(penalty_shootout.player_id) = 
(select max(penalty) from (select count(penalty_shootout.player_id) as penalty from penalty_shootout group by match_no) as number))); 

#111.Write a query in SQL to find the player of portugal who taken the 7th kick against poland. (penalty_shootout, soccer_country)
select player_name from player_mast where player_id = (SELECT DISTINCT player_id FROM penalty_shootout
WHERE player_id = (SELECT player_id FROM penalty_shootout WHERE kick_no = 7 AND match_no IN (
SELECT DISTINCT match_no FROM penalty_shootout WHERE team_id IN(SELECT country_id FROM soccer_country
WHERE country_name IN ('Portugal', 'Poland')) AND team_id IN (SELECT country_id FROM soccer_country
WHERE country_name = 'Portugal')))); 

#112. Write a query in SQL to find the stage of match where the penalty kick number 23 had been taken.
select match_no,play_stage from match_mast 
where match_no = (select distinct match_no from penalty_shootout where  kick_id = '23');

#113.Write a query in SQL to find the venues where penalty shootout matches played
select venue_name from soccer_venue 
where venue_id in (select distinct venue_id from match_mast where match_no in 
(select distinct match_no from penalty_shootout ));

#114 Write a query in SQL to find the date when penalty shootout matches played.
select play_date from  match_mast 
where match_no in (select distinct match_no from penalty_shootout);

#115.Write a query in SQL to find the most quickest goal at the EURO cup 2016, after 5 minutes.(goal_details)
select min(goal_time) as Quickest_after_5_min from goal_details
where goal_time > 5;
