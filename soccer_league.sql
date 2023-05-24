DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league

CREATE TABLE Team (
  team_id INT PRIMARY KEY,
  team_name VARCHAR(255)
);

CREATE TABLE Player (
  player_id INT PRIMARY KEY,
  player_name VARCHAR(255),
  team_id INT,
  FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE Game (
  game_id INT PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  season_id INT,
  FOREIGN KEY (season_id) REFERENCES Season(season_id)
);

CREATE TABLE Goal (
  goal_id INT PRIMARY KEY,
  game_id INT,
  player_id INT,
  FOREIGN KEY (game_id) REFERENCES Game(game_id),
  FOREIGN KEY (player_id) REFERENCES Player(player_id)
);

CREATE TABLE Referee (
  referee_id INT PRIMARY KEY,
  referee_name VARCHAR(255)
);

CREATE TABLE Game_Referee_Relationship (
  relationship_id INT PRIMARY KEY,
  game_id INT,
  referee_id INT,
  FOREIGN KEY (game_id) REFERENCES Game(game_id),
  FOREIGN KEY (referee_id) REFERENCES Referee(referee_id)
);

CREATE TABLE Match (
  match_id INT PRIMARY KEY,
  home_team_id INT,
  away_team_id INT,
  game_id INT,
  FOREIGN KEY (home_team_id) REFERENCES Team(team_id),
  FOREIGN KEY (away_team_id) REFERENCES Team(team_id),
  FOREIGN KEY (game_id) REFERENCES Game(game_id)
);
